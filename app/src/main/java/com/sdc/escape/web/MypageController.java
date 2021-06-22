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
	
	// 마이페이지 
	@GetMapping("/")
	public ModelAndView mypage(HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		
		ModelAndView mv = new ModelAndView();
		List<Reservation> list = reservationService.listByUno(loginUser.getNo());
		int size = list.size();
		// 만약 예약 리스트가 없을 때 
		if (list.size() == 0) {
			mv.addObject("size", size);
			mv.setViewName("mypage/mypage");
			return mv;
		}
		// 가장 최신 예약 리스트 하나 조회
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
	
	//  수정 버튼
	@ResponseBody
	@GetMapping("/editBtn")
	public String testPassword() throws Exception {
		return "ok";
	}
	
	// 회원 정보 수정 -  비밀번호 확인
	@ResponseBody
	@PostMapping("/account/confirmPassword")
	public String confirmPassword(String password, HttpSession session) throws Exception {
		User user = userService.findPassword(password);
		User loginUser = (User) session.getAttribute("loginUser");
		// 로그인 된 회원의 비밀번호가 맞다면
		if (loginUser.getPassword().equals(user.getPassword())) {
			return "ok";
		}
		return "fail";
	}
	
	// 회원 정보 수정 - 조회
	@GetMapping("/info")
	public String info() throws Exception {
		return "mypage/account/info";
	}
	
	// 회원 정보 수정 
	@GetMapping("/update")
	public String update() throws Exception {
		return "mypage/account/update";
	}
	
	// 회원 정보 수정 - form
	@PostMapping("/update")
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
		return "redirect:/mypage/info";
	}
	
	// 예약 확인/취소
	@GetMapping("/reservation")
	public String reservation(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Reservation> list = reservationService.reservatedList(loginUser.getNo());
		model.addAttribute("list", list);
		return "mypage/reservation";
	}
	
	// 예약 취소
	@GetMapping("/cancel")
	public String cancel(int no) throws Exception {
		Reservation res = reservationService.reservationByNo(no);
		res.setCancel(1);	// 예약 취소
		res.setStatus(1);	// 예약 취소 
		reservationService.cancel(res);
		
		return "redirect:/mypage/reservation";
	}
	
	// 이용 내역
	@GetMapping("/history")
	public String history(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Reservation> list = reservationService.listByUno(loginUser.getNo());
		List<Reservation> historyList = new ArrayList<>();
		// 리스트의 상태만 따로 추출
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getStatus() == 2) {
				historyList.add(list.get(i));
			}
		}
		model.addAttribute("historyList", historyList);
		return "mypage/history";
	}
	
	// 리뷰 조회
	// 리뷰가 있다면 리뷰 쓰기 버튼 보이지 않게 하기
	@ResponseBody
	@GetMapping("/hasReview")
	public int[] historyAjax(int[] resNoArr) throws Exception {
		
		if (resNoArr == null) {
			return new int[0];
		}
		
		int length = resNoArr.length;
		int[] intArr = new int[length];
		for(int i = 0; i < resNoArr.length; i++) {
				intArr[i] = reviewService.selectNoByResNo(resNoArr[i]);
		}
		
		return intArr;
	}
	
	// 회원 탈퇴
	@GetMapping("/account/delete") 
	public String delete() throws Exception {
		return "mypage/account/delete";
	}
	
	// 회원 탈퇴 - a태그(회원탈퇴) submit
	@GetMapping("/account/delete/do")
	public void accountDelete(HttpSession session) throws Exception {
		User loginUser =(User)  session.getAttribute("loginUser");
		if (loginUser != null) {
			userService.deleteByNo(loginUser.getNo());
			session.invalidate();
		}
	}
}
