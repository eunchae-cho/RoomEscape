package com.sdc.escape.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

    // @GetMapping("/")
    // public String index() {
    //     return "index";
    // }
    
    @GetMapping("/")
    public String list() {
        return "room";
    }
}
