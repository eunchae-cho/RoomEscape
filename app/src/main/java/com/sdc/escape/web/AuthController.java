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
import org.springframework.web.servlet.ModelAndView;

import com.sdc.escape.domain.User;
import com.sdc.escape.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	
	@Autowired UserService userService;

	@GetMapping("/signup")
	public String signup() throws Exception {
		return "auth/signup";
	}
	
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
	
	@PostMapping("/login")
	public String loginForm(
			String id, 
			String password, 
			String rememberMe,
			boolean check,
			HttpServletResponse res,
			HttpSession session) throws Exception {
		
		Cookie idCookie = new Cookie("id", id);
		
		if (rememberMe != null) {
			idCookie.setMaxAge(60 * 60 * 24 * 7);
		} else {
			idCookie.setMaxAge(0);
		}
		res.addCookie(idCookie);
		
		User loginUser = userService.get(id, password);
	
		// 아이디나 비밀번호가 일치하지 않을 
		if (loginUser == null) {
			check = false;
		 	return "auth/login";
		}
		
		check = true;
		session.setAttribute("loginUser", loginUser);
		return "redirect:../";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletResponse res, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser != null) {
			session.invalidate();
		}
		return "redirect:../";
	}
}
