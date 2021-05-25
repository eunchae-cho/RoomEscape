package com.sdc.escape.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired ReservationService reservationService;
	@Autowired UserService userService;
	
	@GetMapping("/")
	public String mypage() throws Exception {
		return "mypage/mypage";
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
	
	@GetMapping("update")
	public String update() throws Exception {
		return "mypage/update";
	}
	
	@PostMapping("update")
	public String updateForm(int no, String email, String phone, String password, HttpSession session) throws Exception {
		User user = userService.userByNo(no);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		userService.update(user);
		
		// 로그인유저도 정보 업데이트
		session.setAttribute("loginUser", user);
		return "redirect:./";
	}
	
	@GetMapping("/reservation")
	public String reservation(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Reservation> list = reservationService.listByUno(loginUser.getNo());
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getStatus() == 2) {
				list.remove(i);
			}
		}
		model.addAttribute("list", list);
		return "mypage/reservation";
	}
	
	@GetMapping("/cancel")
	public String cancel(int no) throws Exception {
		Reservation res = reservationService.reservationByNo(no);
		res.setCancel(1);	// 예약 취소
		res.setStatus(1);	// 예약 취소 
		reservationService.cancel(res);
		
		return "redirect:mypage/reservation";
	}
}
