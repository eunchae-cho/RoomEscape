package com.sdc.escape.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sdc.escape.service.RoomService;

@Controller
public class IndexController {
	
	@Autowired RoomService roomService;

    @GetMapping("/")
    public String index(Model model) throws Exception {
    	model.addAttribute("roomList", roomService.list());
        return "index";
    }
}
