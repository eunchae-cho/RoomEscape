package com.sdc.escape.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sdc.escape.domain.User;
import com.sdc.escape.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	
	@Autowired UserService userService;

	// 회원 가입
	@GetMapping("/signup")
	public String signup() throws Exception {
		return "auth/signup";
	}
	
	// 회원 가입
	@PostMapping("/signup")
	public String signupForm(
			String name, 
			String id, 
			String password, 
			String email,
			String phone) throws Exception {
		
		User user = new User();
		user.setName(name);
		user.setId(id);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		userService.add(user);
		
		return "redirect:../";
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@GetMapping("/confirmId")
	public int confirmId(String id) throws Exception {
		int check = 0;
		try {
			User user = userService.findSameId(id);
			if (id.equals(user.getId())) {
				// 중복되는 아이디일 때 '1'
				check = 1;
			} 
			// 중복되지 않는 아이디일 때 '0'으로 리턴
		} catch (NullPointerException e) {
			check = 0;
		}
		return check;
	}
	
	// 로그인
	@GetMapping("/login")
	public ModelAndView login(HttpServletRequest req) throws Exception {
		
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
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("auth/login");
		return mv;
	}
	
	// 로그인
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
		
		User loginUser = userService.getByIdPassword(id, password);
		
		if (loginUser == null) {
			return "fail";
		}
	
		session.setAttribute("loginUser", loginUser);
		return "ok";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletResponse res, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser != null) {
			session.invalidate();
		}
		return "redirect:../";
	}
	
	// 아이디 찾기
	@GetMapping("/findId")
	public String findId() throws Exception{
		return "auth/findId";
	}
	
	@ResponseBody
	@PostMapping("/findId")
	public User findIdAjax(String name, String email) throws Exception{
		return userService.findIdByNameEmail(name, email);
	}
	
	// 패스워드 찾기
	@GetMapping("/findPassword")
	public String findPassword() throws Exception{
		return "auth/findPassword";
	}
}
