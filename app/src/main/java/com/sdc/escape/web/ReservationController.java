package com.sdc.escape.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdc.escape.service.RoomService;
import com.sdc.escape.service.RoomTimeService;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired RoomService roomService;
	@Autowired RoomTimeService roomTimeService;

	@GetMapping("/form")
    public String reservation(Model model) throws Exception {
		model.addAttribute("roomList", roomService.list());
//		model.addAttribute("timeList", roomTimeService.timeByNo(no));
        return "reservation/form";
    }
	
	@PostMapping("/reserve")
	public void selectValue() throws Exception {
		
	}
}
