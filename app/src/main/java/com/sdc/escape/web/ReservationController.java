package com.sdc.escape.web;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.service.ReservationService;
import com.sdc.escape.service.RoomService;
import com.sdc.escape.service.RoomTimeService;

@Controller
@RequestMapping("reservation")
public class ReservationController {
	
	@Autowired RoomService roomService;
	@Autowired RoomTimeService roomTimeService;
	@Autowired ReservationService reservationService;

	@GetMapping("/")
    public String reservation(Model model) throws Exception {
		model.addAttribute("roomList", roomService.list());
        return "reservation/form";
    }
	
	@ResponseBody
	@PostMapping("/roomTimeList")
	public List<RoomTime> roomTimeList(int no) throws Exception {
		return roomTimeService.timeByNo(no);
	}
	
	@PostMapping("/reserve")
	public String selectValue(String roomTime, Date date, int participant, String price, int roomNo) throws Exception {
		Reservation reservation = new Reservation();
		reservation.setRoomTime(roomTime);
		reservation.setReservatedDate(date);
		reservation.setParticipant(participant);
		reservation.setPrice(price);
		reservation.setRno(roomNo);
		reservation.setUno(1);
		reservationService.add(reservation);
		return "redirect:/reservation/";
	}
}
