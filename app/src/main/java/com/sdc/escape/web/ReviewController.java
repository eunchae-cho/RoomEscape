package com.sdc.escape.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdc.escape.domain.Review;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReviewService;

@Controller
@RequestMapping("/mypage/review")
public class ReviewController {

	@Autowired ReviewService reviewService;
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Review> list = reviewService.listByUno(loginUser.getNo());
		model.addAttribute("list", list);
		return "mypage/review/list";
	}
	
	@GetMapping("/add")
	public String add() throws Exception {
		return "mypage/review/add";
	}
}
