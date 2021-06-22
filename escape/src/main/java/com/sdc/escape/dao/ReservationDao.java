package com.sdc.escape.dao;

import java.sql.Date;
import java.util.List;

import com.sdc.escape.domain.Reservation;

public interface ReservationDao {
	int add(Reservation reservation) throws Exception;
	List<Reservation> findByUno(int no) throws Exception;
	Reservation findByNo(int no) throws Exception;
	int updateCancel(Reservation reservation) throws Exception;
	List<Reservation> findReservation(Date date) throws Exception;
	List<Reservation> findByUnoReservated(int no) throws Exception;
	List<Reservation> findByRoom(int no) throws Exception;
	Reservation findByResNo(int no) throws Exception;
	List<Reservation> findByDate(String date) throws Exception;
	int updateByAdmin(Reservation reservation) throws Exception;
	List<Reservation> findAll() throws Exception;
}

