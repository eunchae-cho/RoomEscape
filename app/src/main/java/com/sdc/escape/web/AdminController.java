package com.sdc.escape.web;

import java.io.File;
import java.util.List;
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
import com.sdc.escape.domain.Room;
import com.sdc.escape.domain.RoomAttribute;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.service.AdminService;
import com.sdc.escape.service.EventService;
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
	@Autowired RoomAttributeService roomAttrbuteService;

	@GetMapping("/")
	public String index(HttpSession session) throws Exception{
		Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			return "admin/login";
		}
		return "admin/index";
	}
	
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
	
	@GetMapping("/reservation")
	public String reservation() throws Exception {
		return "admin/reservation";
	}
	
	@GetMapping("/room")
	public String room(Model model) throws Exception {
		List<Room> list = roomService.list();
		model.addAttribute("list", list);
		return "admin/room/list";
	}
	
	@GetMapping("/room/detail")
	public String roomDetail(Model model, int no) throws Exception {
		Room room = roomService.roomByNo(no);
		model.addAttribute("room", room);
		return "admin/room/detail";
	}
	
	@GetMapping("/room/add")
	public String roomAdd() throws Exception {
		return "admin/room/add";
	}
	
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
		String filename = UUID.randomUUID().toString();
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("img/") +  filename;
		photo.transferTo(new File(saveFilePath));
		room.setPhoto(filename);
		roomService.add(room);
		
		int roomNo = roomService.recentNo();
		
		for (int i = 0; i < roomTime.length; i++) {
			RoomTime rtime = new RoomTime();
			rtime.setRno(roomNo);
			rtime.setRoomTime(roomTime[i]);
			roomTimeService.add(rtime);
		}
		
		RoomAttribute roomAttr = new RoomAttribute();
		roomAttr.setRno(roomNo);
		roomAttr.setReasoning(reasoning);
		roomAttr.setObservation(observation);
		roomAttr.setHorror(horror);
		roomAttr.setActivity(activity);
		roomAttrbuteService.add(roomAttr);
		
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
		String saveFilePath = multiReq.getSession().getServletContext().getRealPath("img/") +  filename;
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
		eventService.update(no);
		return "redirect:/admin/event/detail?no="+ no;
	}
	
	@GetMapping("/event/delete")
	public String eventDelete(int no) throws Exception {
		eventService.delete(no);
		return "redirect:/admin/event";
	}
}
