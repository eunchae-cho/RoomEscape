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

	@GetMapping("/list")
    public String index(Model model) throws Exception {
    	model.addAttribute("roomList", roomService.list());
        return "room/list";
    }
	
    @GetMapping("/detail")
    public void room(Model model, int no) throws Exception {
    	model.addAttribute("room" , roomService.roomByNo(no));
    	model.addAttribute("roomAttr", roomAttributeService.roomAttrByNo(no));
    	List<Review> reviewList = reviewService.listReviewByRoom(no);
    	if (reviewList != null) {
    		model.addAttribute("reviewList", reviewList);
    	}
    	model.addAttribute("resList", reservationService.listByRoom(no));
    	List<String> photoList =  reviewService.listPhotos(no);
    	if (photoList != null) {
    		model.addAttribute("photoList",photoList);
    	}
    	model.addAttribute("countReview", reviewService.countReview(no));
    	model.addAttribute("countPhoto", reviewService.countPhoto(no));
    }
}
