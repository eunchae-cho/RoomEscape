package com.sdc.escape.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sdc.escape.domain.Admin;
import com.sdc.escape.domain.Event;
import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.Room;
import com.sdc.escape.domain.RoomAttribute;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.domain.Scheduler;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.AdminService;
import com.sdc.escape.service.EventService;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.RoomAttributeService;
import com.sdc.escape.service.RoomService;
import com.sdc.escape.service.RoomTimeService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired EventService eventService;
	@Autowired AdminService adminService;
	@Autowired RoomService roomService;
	@Autowired RoomTimeService roomTimeService;
	@Autowired RoomAttributeService roomAttributeService;
	@Autowired ReservationService reservationService;

	@GetMapping("/")
	public String index(HttpSession session) throws Exception{
		return "admin/index";
	}
	
	// 스케줄러
	@ResponseBody
	@PostMapping("/scheduler")
	public List<Scheduler> scheduler() throws Exception {
		// 스케줄러에 넣을 데이터 조회
		List<Reservation> list = reservationService.findAll();
		
		// 스케줄러에 넣을 데이터만 따로 리스트 생성
		List<Scheduler> schedulerList = new ArrayList<>();
		for (int i  = 0; i < list.size(); i++) {
			Scheduler s= new Scheduler();
			s.setId(list.get(i).getNo());
			String str = list.get(i).getRoomTime() +" | "+ list.get(i).getRoom().getTitle();
			s.setTitle(str);
			s.setStart(list.get(i).getDoDate());
			s.setUrl("/app/admin/reservation/detail?no=" + list.get(i).getNo());
			schedulerList.add(s);
		}
		
		return schedulerList;
	}
	
	// 어드민 로그인
	@GetMapping("/login")
	public ModelAndView login(HttpServletRequest req) throws Exception{
		String id = "";
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					id = cookie.getValue();
					break;
				}
			}
		}
		
		// 이전페이지 기억하고 세션에 저장
		String referer = req.getHeader("Referer");
		req.getSession().setAttribute("prevPage", referer);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("admin/login");
		
		return mv;
	}
		
		// 로그인 검사
		@ResponseBody
		@PostMapping("/login")
		public String loginForm(
				String id, 
				String password, 
				String rememberMe,
				HttpServletResponse res,
				HttpSession session) throws Exception {

			Cookie idCookie = new Cookie("id", id);
			
			if (rememberMe != null) {
				idCookie.setMaxAge(60 * 60 * 24 * 7);
			} else {
				idCookie.setMaxAge(0);
			}
			res.addCookie(idCookie);
			
			Admin loginAdmin = adminService.getByIdPassword(id, password);
			
			if (loginAdmin == null) {
				return "fail";
			}
		
			session.setAttribute("loginAdmin", loginAdmin);
			
			return "ok";
		}
		
	// 어드민 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletResponse res, HttpSession session) {
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
			
		if(loginAdmin != null) {
			session.invalidate();
		}
		
		return "redirect:/admin/";
	}
	
	// 예약 관리
	@GetMapping("/reservation")
	public String reservation(Model model, String date) throws Exception {
		
		// date의 default를 오늘 날짜로 설정
		if (date == null) {
			Date today = new Date();
			SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
			date = d.format(today);
			model.addAttribute("dateToday", date);
		}
		
		List<Reservation> list = reservationService.listByNoDate(date);
		model.addAttribute("list", list);
		
		return "admin/reservation/list";
	}
	
	// 날짜에 따른 예약 조회
	@ResponseBody
	@GetMapping("/selectDate")
	public List<Reservation> selectDate(String date) throws Exception {
		return reservationService.listByNoDate(date);
	}
	
	// 예약 관리의 수정 버튼
	@ResponseBody
	@GetMapping("/edit")
	public String edit(int no, int status, String escape) throws Exception {
		Reservation reservation = reservationService.reservationByNo(no);
		reservation.setStatus(status);
		reservation.setEscape(escape);
		reservationService.updateByAdmin(reservation);
		return "ok";
	}
	
	// 예약 상세 페이지
	@GetMapping("/reservation/detail")
	public String reservationDetail(Model model, int no) throws Exception {
		Reservation res = reservationService.reservationByNo(no);
		model.addAttribute("res", res);
		return "admin/reservation/detail";
	}
	
	// 룸 테마 설정
	@GetMapping("/room")
	public String room(Model model) throws Exception {
		List<Room> list = roomService.list();
		model.addAttribute("list", list);
		return "admin/room/list";
	}
	
	// 룸 테마 상세보기
	@GetMapping("/room/detail")
	public String roomDetail(Model model, int no) throws Exception {
		Room room = roomService.roomByNo(no);
		model.addAttribute("room", room);
		List<RoomTime> roomTimeList = roomTimeService.timeByNo(no);
		model.addAttribute("roomTimeList", roomTimeList);
		RoomAttribute roomAttr = roomAttributeService.roomAttrByNo(no);
		model.addAttribute("roomAttr", roomAttr);
		return "admin/room/detail";
	}
	
	// 룸 테마 추가
	@GetMapping("/room/add")
	public String roomAdd() throws Exception {
		return "admin/room/add";
	}
	
	// 룸 테마 추가
	@PostMapping("room/add")
	public String roomAddForm(String title,
														String content,
														String[] roomTime,
														String level,
														String participant,
														String reasoning,
														String observation,
														String horror,
														String activity,
														MultipartFile photo,
														MultipartHttpServletRequest multiReq) throws Exception {
		Room room = new Room();
		room.setTitle(title);
		room.setContent(content);
		room.setLevel(level);
		room.setParticipant(participant);
		
		// 사진 파일 이름 덮기
		String filename = UUID.randomUUID().toString();
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("/img/") +  filename;
		photo.transferTo(new File(saveFilePath));
		room.setPhoto(filename);
		roomService.add(room);
		
		// 최근 번호
		int roomNo = roomService.recentNo();
		
		for (int i = 0; i < roomTime.length; i++) {
			RoomTime rtime = new RoomTime();
			rtime.setRno(roomNo);
			rtime.setRoomTime(roomTime[i]);
			roomTimeService.add(rtime);
		}
		
		// 방 테마 속성
		RoomAttribute roomAttr = new RoomAttribute();
		roomAttr.setRno(roomNo);
		roomAttr.setReasoning(reasoning);
		roomAttr.setObservation(observation);
		roomAttr.setHorror(horror);
		roomAttr.setActivity(activity);
		roomAttributeService.add(roomAttr);
		
		return "redirect:/admin/room";
	}
	
	@GetMapping("/room/update")
	public String roomUpdate(Model model, int no) throws Exception {
		Room room = roomService.roomByNoWithoutStar(no);
		model.addAttribute("room", room);
		List<RoomTime> roomTimeList = roomTimeService.timeByNo(no);
		model.addAttribute("roomTimeList", roomTimeList);
		RoomAttribute roomAttr = roomAttributeService.roomAttrByNoWithoutStar(no);
		model.addAttribute("roomAttr", roomAttr);
		return "admin/room/update";
	}
	
	@PostMapping("room/update")
	public String roomUpdateForm(int no,
														String title,
														String content,
														String[] roomTime,
														String level,
														String participant,
														String reasoning,
														String observation,
														String horror,
														String activity,
														MultipartFile photo,
														MultipartHttpServletRequest multiReq) throws Exception {
	
		Room room = roomService.roomByNoWithoutStar(no);
		room.setTitle(title);
		room.setContent(content);
		room.setLevel(level);
		room.setParticipant(participant);
		String filename = UUID.randomUUID().toString();
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("/img/") +  filename;
		photo.transferTo(new File(saveFilePath));
		room.setPhoto(filename);
		roomService.update(room);
		
		for (int i = 0; i < roomTime.length; i++) {
			RoomTime rtime = new RoomTime();
			rtime.setRno(no);
			rtime.setRoomTime(roomTime[i]);
			roomTimeService.delete(no);
			roomTimeService.add(rtime);
		}
		
		RoomAttribute roomAttr = new RoomAttribute();
		roomAttr.setRno(no);
		roomAttr.setReasoning(reasoning);
		roomAttr.setObservation(observation);
		roomAttr.setHorror(horror);
		roomAttr.setActivity(activity);
		roomAttributeService.update(roomAttr);
		
		return "redirect:/admin/room/detail?no=" + no;
	}
	
	@GetMapping("/room/delete")
	public String roomDelete(int no) throws Exception {
		roomTimeService.delete(no);
		roomAttributeService.delete(no);
		roomService.delete(no);
		return "redirect:/admin/room";
	}
	
	@GetMapping("/event")
	public String event(Model model) throws Exception {
		List<Event> list = eventService.list();
		model.addAttribute("list", list);
		return "admin/event/list";
	}
	
	@GetMapping("/event/detail")
	public String eventDetail(Model model, int no)  throws Exception {
		Event event = eventService.eventByNo(no);
		model.addAttribute("event", event);
		return "admin/event/detail";
	}
	
	@GetMapping("/event/add")
	public String eventAdd() throws Exception {
		return "admin/event/add";
	}
	
	@PostMapping("/event/add")
	public String eventAddForm(String title, 
												String content, 
												HttpSession session,
												MultipartFile photo,
												MultipartHttpServletRequest multiReq) throws Exception {
		Event event = new Event();
		event.setTitle(title);
		event.setContent(content);
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
		event.setAdminNo(loginAdmin.getNo());
		// 사진 파일 이름 암호화
		String filename = UUID.randomUUID().toString();
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("/img/") +  filename;
		photo.transferTo(new File(saveFilePath));
		event.setPhoto(filename);
		eventService.add(event);
		return "redirect:/admin/event";
	}
	
	@GetMapping("/event/update")
	public String eventUpdate(Model model, int no) throws Exception {
		Event event = eventService.eventByNo(no);
		model.addAttribute("event", event);
		return "admin/event/update";
	}
	
	@PostMapping("/event/update")
	public String eventUpdateForm(int no,
													String title, 
													String content, 
													MultipartFile photo,
													MultipartHttpServletRequest multiReq) throws Exception {
		Event event = eventService.eventByNo(no);
		event.setTitle(title);
		event.setContent(content);
		// 사진 파일 이름 암호화
		String filename = UUID.randomUUID().toString();
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("img/") +  filename;
	    photo.transferTo(new File(saveFilePath));
		event.setPhoto(filename);
		eventService.update(event);
		return "redirect:/admin/event/detail?no="+ no;
	}
	
	@GetMapping("/event/delete")
	public String eventDelete(int no) throws Exception {
		eventService.delete(no);
		return "redirect:/admin/event";
	}
}
