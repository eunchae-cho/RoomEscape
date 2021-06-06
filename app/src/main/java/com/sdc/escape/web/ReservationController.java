package com.sdc.escape.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.Room;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.domain.User;
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
		List<Room> roomList = roomService.list();
		List<RoomTime> roomTimeList = roomTimeService.list();
	
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomTimeList", roomTimeList);
        return "reservation/form";
    }
	
	@ResponseBody
	@PostMapping("/selectDate")
	public List<Reservation> selectDate(Date date) throws Exception {
		List<Reservation> list = reservationService.findReservation(date);
		return list;
	}
	
	@PostMapping("/reserve")
	public String selectValue(String roomTime, String date, int participant, String price, int roomNo, HttpSession session) throws Exception {
		Reservation reservation = new Reservation();
		System.out.println(roomTime);
		// 값이 넘어올 때 뒤에',,,,,,,,,'을 포함해서 오기 때문에 ',' 찾아서 삭제
		String roomTimeStr = roomTime.replace(",", ""); 
		reservation.setRoomTime(roomTimeStr);
		reservation.setDoDate(date);
		reservation.setParticipant(participant);
		reservation.setPrice(price);
		reservation.setRno(roomNo);
		User loginUser = (User) session.getAttribute("loginUser");
		reservation.setUno(loginUser.getNo());
		reservationService.add(reservation);
		return "redirect:/reservation/";
	}
}
