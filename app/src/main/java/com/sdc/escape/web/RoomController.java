package com.sdc.escape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	public RoomController() {
		System.out.println("dd") ;
	}

    @GetMapping("/")
    public String index() {
        return "index";
    }
    
    @GetMapping("/list")
    public String room() {
        return "room/room";
    }
}
