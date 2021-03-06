package com.sdc.escape.service.impl;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.ReservationDao;
import com.sdc.escape.domain.Reservation;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.ReservationService;

@Service
public class DefaultReservationService implements ReservationService{
	ReservationDao reservationDao;
    HttpSession session;
	
	public DefaultReservationService(ReservationDao reservationDao, HttpSession sesstion) {
		this.reservationDao = reservationDao;
		this.session = sesstion;
	}
	
	@Override
	public int add(Reservation reservation) throws Exception {
		User loginUser = (User) session.getAttribute("loginUser");
		reservation.setUno(loginUser.getNo());
		return reservationDao.add(reservation);
	}
	
	@Override
	public List<Reservation> listByUno(int no) throws Exception {
		return reservationDao.findByUno(no);
	}
	
	@Override
	public Reservation reservationByNo(int no) throws Exception {
		return reservationDao.findByNo(no);
	}
	
	@Override
	public int cancel(Reservation reservation) throws Exception {
		return reservationDao.updateCancel(reservation);
	}
	
	@Override
	public List<Reservation> findReservation(Date date) throws Exception {
		return reservationDao.findReservation(date);
	}
	
	@Override
	public List<Reservation> reservatedList(int no) throws Exception {
		return reservationDao.findByUnoReservated(no);
	}
	
	@Override
	public List<Reservation> listByRoom(int no) throws Exception {
		return reservationDao.findByRoom(no);
	}
	
	@Override
	public Reservation reservationByResNo(int no) throws Exception {
		return reservationDao.findByResNo(no);
	}
	
	@Override
	public List<Reservation> listByNoDate(String date) throws Exception {
		return reservationDao.findByDate(date);
	}
	
	@Override
	public int updateByAdmin(Reservation reservation) throws Exception {
		return reservationDao.updateByAdmin(reservation);
	}
	
	@Override
	public List<Reservation> findAll() throws Exception {
		return reservationDao.findAll();
	}
}
