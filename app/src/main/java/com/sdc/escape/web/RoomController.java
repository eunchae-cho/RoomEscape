package com.sdc.escape.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sdc.escape.service.RoomService;

@Controller
public class RoomController {
	
	@Autowired RoomService roomService;

    @GetMapping("/room")
    public String room(Model model, int no) throws Exception {
    	model.addAttribute("room" , roomService.listByNo(no));
        return "room/detail";
    }
}
