package com.sdc.escape.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sdc.escape.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired RoomService roomService;

    @GetMapping("/detail")
    public void room(Model model, int no) throws Exception {
    	model.addAttribute("room" , roomService.roomByNo(no));
    }
}
