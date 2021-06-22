package com.sdc.escape.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdc.escape.domain.Review;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.ReviewService;
import com.sdc.escape.service.RoomAttributeService;
import com.sdc.escape.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired RoomService roomService;
	@Autowired ReviewService reviewService;
	@Autowired ReservationService reservationService;
	@Autowired RoomAttributeService roomAttributeService;

	// 룸 테마 리스트
	@GetMapping("/list")
    public String index(Model model) throws Exception {
    	model.addAttribute("roomList", roomService.list());
        return "room/list";
    }
	
	// 룸 테마 상세 보기
    @GetMapping("/detail")
    public void room(Model model, int no) throws Exception {
    	// 방 테마
    	model.addAttribute("room" , roomService.roomByNo(no));
    	// 방 테마 속성
    	model.addAttribute("roomAttr", roomAttributeService.roomAttrByNo(no));
    	// 리뷰 리스트
    	List<Review> reviewList = reviewService.listReviewByRoom(no);
    	if (reviewList != null) {
    		model.addAttribute("reviewList", reviewList);
    	}
    	// 예약 리스트
    	model.addAttribute("resList", reservationService.listByRoom(no));
    	// 리뷰 사진
    	List<String> photoList =  reviewService.listPhotos(no);
    	if (photoList != null) {
    		model.addAttribute("photoList",photoList);
    	}
    	// 리뷰 갯수
    	model.addAttribute("countReview", reviewService.countReview(no));
    	// 리뷰 사진 갯수
    	model.addAttribute("countPhoto", reviewService.countPhoto(no));
    }
}
