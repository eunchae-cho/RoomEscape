package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.Review;

public interface ReviewService {
	List<Review> listByUno(int no) throws Exception;
}
