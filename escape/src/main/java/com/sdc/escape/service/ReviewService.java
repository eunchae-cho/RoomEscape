package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.Review;

public interface ReviewService {
	List<Review> listByUno(int no) throws Exception;
	Review reviewByNo(int no) throws Exception;
	int addPhotos(int no, String photo) throws Exception;
	int addReview(Review review) throws Exception;
	int selectNoByResNo(int no) throws Exception;
	Review selectOne()throws Exception;
	List<Review> listReviewByRoom(int no) throws Exception;
	List<String> listPhotos(int no) throws Exception;
	List<String> listPhotosByUno(int no) throws Exception;
	List<String> listPhotosByResNo(int no) throws Exception;
	int countReview(int no) throws Exception;
	int countPhoto(int no) throws Exception;
	int deleteByNo(int no) throws Exception;
	int deletePhotoByNo(int no) throws Exception;
	int hasPhoto(int no) throws Exception;
	int update(Review review) throws Exception;
}
