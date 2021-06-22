package com.sdc.escape.web;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.Review;
import com.sdc.escape.domain.Room;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.ReviewService;

@Controller
@RequestMapping("/mypage/review")
public class ReviewController {

	@Autowired ServletContext servletContext;
	@Autowired ReviewService reviewService;
	@Autowired ReservationService reservationService;
	
	// 리뷰 리스트
	@GetMapping("/list")
	public String list(Model model, 
								HttpSession session) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		
		List<Review> list = new ArrayList<>();
		list = reviewService.listByUno(loginUser.getNo());
		model.addAttribute("list", list);
		// 리뷰 사진 조회
		List<String> photoList = reviewService.listPhotosByUno(loginUser.getNo());
		if (photoList.size() != 0) {
			model.addAttribute("photo", photoList.get(0));
		}
		
		return "mypage/review/list";
	}
	
	// 리뷰 등록
	@GetMapping("/add")
	public String add(int resNo, 
								Model model) throws Exception {
		
		Reservation reservation = reservationService.reservationByNo(resNo);
		model.addAttribute("res", reservation);
		
		return "mypage/review/add";
	}
	
	// 리뷰 등록 - form
	@PostMapping("/add")
	public String addForm(int resNo,
												int roomNo,
												int userNo,
												String title, 
												String content, 
												MultipartFile[] photos, 
												HttpSession session,
												MultipartHttpServletRequest multiReq) throws Exception {
		Review review = new Review();
		Room room = new Room();
		room.setNo(roomNo);
		
		User user = new User();
		user.setNo(userNo);
		review.setResNo(resNo);
		review.setRoom(room);
		review.setUser(user);
		review.setTitle(title);
		review.setContent(content);
		
		reviewService.addReview(review);
		
		// 방금 등록된 리뷰 번호 조회
		review = reviewService.selectOne();
		
		if (photos.length != 0) {
			for (int i = 0; i < photos.length; i++) {
				System.out.println("=====================================");
				System.out.println(photos[i]);
				String filename = UUID.randomUUID().toString();
				String saveFilePath = multiReq.getSession().getServletContext().getRealPath("/upload/") +  filename;
				photos[i].transferTo(new File(saveFilePath));
				reviewService.addPhotos(review.getNo(), filename);
			}
		}
		
		return "redirect:/mypage/history";
	}
	
	// 리뷰 상세 보기
	@GetMapping("/detail")
	public String detail(Model model, int no) throws Exception {
		model.addAttribute("res" ,reservationService.reservationByResNo(no));
    	model.addAttribute("rev",  reviewService.reviewByNo(no));
		
    	List<String> photoList =  reviewService.listPhotosByResNo(no);
    	if (photoList != null) {
    		model.addAttribute("photoList",photoList);
    	}
		
    	return "mypage/review/detail";
	}
	
	// 리뷰 삭제
	@GetMapping("/delete")
	public String delete(int no) throws Exception {
		reviewService.deletePhotoByNo(no);
		reviewService.deleteByNo(no);
		return "redirect:/mypage/review/list";
	}
	
	// 리뷰 수정
	@GetMapping("/update")
	public String update(Model model, int no) throws Exception {
		model.addAttribute("res" ,reservationService.reservationByResNo(no));
		model.addAttribute("revNo", no);
		return "mypage/review/update";
	}
	
	// 리뷰 수정 - form
	@PostMapping("/update")
	public String updateForm(int no,
										String title,
										String content,
										MultipartFile[] photos,
										MultipartHttpServletRequest multiReq) throws Exception {
		
		Review review = new Review();
		review = reviewService.reviewByNo(no);
		review.setTitle(title);
		review.setContent(content);
		reviewService.update(review);
		// 사진 식별 코드 생성
		for (int i = 0; i < photos.length; i++) {
			String filename = UUID.randomUUID().toString();
			String saveFilePath = multiReq.getSession().getServletContext().getRealPath("/upload/") +  filename;
			photos[i].transferTo(new File(saveFilePath));
			reviewService.deletePhotoByNo(no);
			reviewService.addPhotos(no, filename);
		}
		
		return "redirect:/mypage/review/list";
	}
	
 }
