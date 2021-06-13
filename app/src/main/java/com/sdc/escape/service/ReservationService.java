package com.sdc.escape.service;

import java.sql.Date;
import java.util.List;

import com.sdc.escape.domain.Reservation;

public interface ReservationService {
	int add(Reservation reservation) throws Exception;
	List<Reservation>listByUno(int no) throws Exception;
	Reservation reservationByNo(int no) throws Exception;
	int cancel(Reservation reservation) throws Exception;
	List<Reservation> findReservation(Date date) throws Exception;
	List<Reservation> reservatedList(int no) throws Exception;
	List<Reservation> listByRoom(int no) throws Exception;
	Reservation reservationByResNo(int no) throws Exception;
 }
