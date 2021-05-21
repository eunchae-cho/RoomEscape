package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.ReservationDao;
import com.sdc.escape.domain.Reservation;
import com.sdc.escape.service.ReservationService;

@Service
public class DefaultReservationService implements ReservationService{
	ReservationDao reservationDao;
	
	public DefaultReservationService(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}
	
	@Override
	public int add(Reservation reservation) throws Exception {
		return reservationDao.add(reservation);
	}
}
