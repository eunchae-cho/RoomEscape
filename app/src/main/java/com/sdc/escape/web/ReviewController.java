package com.sdc.escape.web;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.Review;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.ReviewService;

@Controller
@RequestMapping("/mypage/review")
public class ReviewController {

	@Autowired ServletContext servletContext;
	@Autowired ReviewService reviewService;
	@Autowired ReservationService reservationService;
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Review> list = reviewService.listByUno(loginUser.getNo());
		model.addAttribute("list", list);
		return "mypage/review/list";
	}
	
	@GetMapping("/add")
	public String add(int resNo, Model model, HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		Reservation reservation = reservationService.reservationByNo(resNo);
		model.addAttribute("res", reservation);
		return "mypage/review/add";
	}
	
	@PostMapping("/add")
	public String addForm(int resNo,
												int roomNo,
												int userNo,
												String title, 
												String content, 
												MultipartFile[] photos, 
												HttpSession session) throws Exception {
		for (int i = 0; i < photos.length; i++) {
			String filename = UUID.randomUUID().toString();
			String saveFilePath = servletContext.getRealPath("/upload/" + filename);
			photos[i].transferTo(new File(saveFilePath));
			reviewService.addPhotos(resNo, filename);
		}
		Review review = new Review();
		review.setNo(resNo);
		review.getRoom().setNo(roomNo);
		review.getUser().setNo(userNo);
		review.setTitle(title);
		review.setContent(content);
		return "redirect:/mypage/history";
	}
 }
