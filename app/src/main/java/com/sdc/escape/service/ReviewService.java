package com.sdc.escape.service;

import java.util.List;
import java.util.Map;

import com.sdc.escape.domain.Review;

public interface ReviewService {
	List<Review> listByUno(int no) throws Exception;
	int addPhotos(int no, String photo) throws Exception;
}
