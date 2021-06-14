package com.sdc.escape.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sdc.escape.domain.Event;
import com.sdc.escape.domain.Room;
import com.sdc.escape.service.EventService;
import com.sdc.escape.service.RoomService;

@Controller
public class IndexController {
	
	@Autowired RoomService roomService;
	@Autowired EventService eventService;

    @GetMapping("/")
    public String index(HttpServletRequest request) throws Exception {
    	List<Room> roomList =  roomService.list();
    	request.setAttribute("roomList", roomList);
    	List<Event> eventList = eventService.list();
    	request.setAttribute("eventList", eventList);
        return "index";
    }
}
