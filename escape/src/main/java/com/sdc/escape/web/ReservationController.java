package com.sdc.escape.web;

import java.util.Date;
import java.text.SimpleDateFormat;
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

	// 예약 리스트
	@GetMapping("/")
    public String reservation(Model model, HttpSession session) throws Exception {
		List<Room> roomList = roomService.list();
		List<RoomTime> roomTimeList = roomTimeService.list();
	
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomTimeList", roomTimeList);
		// 오늘 날짜 조회
		Date today = new Date();
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		String date = d.format(today);
		model.addAttribute("dateToday", date);
		
        return "reservation/form";
    }
	
	// 날짜를 선택하면 예약이 되어있는 날짜 조회
	@ResponseBody
	@PostMapping("/selectDate")
	public List<Reservation> selectDate(java.sql.Date date) throws Exception {
		List<Reservation> list = reservationService.findReservation(date);
		return list;
	}
	
	// 방 테마 예약
	@PostMapping("/reserve")
	public String selectValue(String roomTime, String date, int participant, String price, int roomNo, HttpSession session) throws Exception {
		Reservation reservation = new Reservation();
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
