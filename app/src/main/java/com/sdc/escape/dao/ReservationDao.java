package com.sdc.escape.dao;

import com.sdc.escape.domain.Reservation;

public interface ReservationDao {
	int add(Reservation reservation) throws Exception;
}

