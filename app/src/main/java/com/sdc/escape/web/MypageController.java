package com.sdc.escape.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.Review;
import com.sdc.escape.domain.Room;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.ReviewService;
import com.sdc.escape.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired ReservationService reservationService;
	@Autowired UserService userService;
	@Autowired ReviewService reviewService;
	
	@GetMapping("/")
	public ModelAndView mypage(HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		ModelAndView mv = new ModelAndView();
		// 만약 로그인되어 있지 않다면 로그인 페이지로 리턴
		if (loginUser == null) {
			mv.setViewName("auth/login");
			return mv;
		}
		List<Reservation> list = reservationService.listByUno(loginUser.getNo());
		int size = list.size();
		if (list.size() == 0) {
			mv.addObject("size", size);
			mv.setViewName("mypage/mypage");
			return mv;
		}
		Reservation reservation = new Reservation();
		reservation.setNo(list.get(0).getNo());
		reservation.setDoDate(list.get(0).getDoDate());
		reservation.setRoomTime(list.get(0).getRoomTime());
		Room room = new Room();
		room.setTitle(list.get(0).getRoom().getTitle());
		reservation.setRoom(room);
		
		mv.addObject("recentRes", reservation);
		mv.addObject("size", size);
		mv.setViewName("mypage/mypage");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("/editBtn")
	public String testPassword() throws Exception {
		return "ok";
	}
	
	@ResponseBody
	@PostMapping("/confirmPassword")
	public String confirmPassword(String password, HttpSession session) throws Exception {
		User user = userService.findPassword(password);
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser.getPassword().equals(user.getPassword())) {
			return "ok";
		}
		return "fail";
	}
	
	@GetMapping("info")
	public String info() throws Exception {
		return "mypage/account/info";
	}
	
	@GetMapping("update")
	public String update() throws Exception {
		return "mypage/account/update";
	}
	
	@PostMapping("update")
	public String updateForm(int no, String email, String phone, String password, HttpSession session) throws Exception {
		User user = userService.userByNo(no);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		userService.update(user);
		
		// 로그인유저도 정보 업데이트
		// 비밀번호 암호화 상태로 세션에 저장하기 위해
		// 업데이트 후 새로 조회
		user = userService.userByNo(no);
		session.setAttribute("loginUser", user);
		return "redirect:/mypage/account/info";
	}
	
	@GetMapping("/reservation")
	public String reservation(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Reservation> list = reservationService.reservatedList(loginUser.getNo());
		model.addAttribute("list", list);
		return "mypage/reservation";
	}
	
	@GetMapping("/cancel")
	public String cancel(int no) throws Exception {
		Reservation res = reservationService.reservationByNo(no);
		res.setCancel(1);	// 예약 취소
		res.setStatus(1);	// 예약 취소 
		reservationService.cancel(res);
		
		return "redirect:/mypage/reservation";
	}
	
	@GetMapping("/history")
	public String history(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Reservation> list = reservationService.listByUno(loginUser.getNo());
		List<Reservation> historyList = new ArrayList<>();
		
		for (int i = 0; i < list.size(); i++) {
			// 상태만 따로 추출
			if (list.get(i).getStatus() == 2) {
				historyList.add(list.get(i));
			}
		}
		model.addAttribute("historyList", historyList);
		return "mypage/history";
	}
	
	@ResponseBody
	@GetMapping("/hasReview")
	public int[] historyAjax(int[] resNoArr) throws Exception {
		if (resNoArr == null) {
			return new int[0];
		}
		int length = resNoArr.length;
		int[] intArr = new int[length];
		for(int i = 0; i < resNoArr.length; i++) {
			System.out.println(reviewService.selectNoByResNo(resNoArr[i]));
				intArr[i] = reviewService.selectNoByResNo(resNoArr[i]);
		}
		return intArr;
	}
	
	@GetMapping("/account/delete") 
	public String delete() throws Exception {
		return "mypage/account/delete";
	}
	
	@GetMapping("/account/delete/do")
	public void accountDelete(HttpSession session) throws Exception {
		User loginUser =(User)  session.getAttribute("loginUser");
		if (loginUser != null) {
			userService.deleteByNo(loginUser.getNo());
			session.invalidate();
		}
	}
}
