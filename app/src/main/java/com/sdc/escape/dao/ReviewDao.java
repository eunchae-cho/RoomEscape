package com.sdc.escape.dao;

import java.util.List;
import java.util.Map;

import com.sdc.escape.domain.Review;

public interface ReviewDao {
    List<Review> findByUno(int no) throws Exception;
    Review findByNo(int no) throws Exception;
    int addPhotos(Map<String, Object> map) throws Exception;
    int addReview(Review review) throws Exception;
    int selectNoByResNo(int no) throws Exception;
    Review selectOne()throws Exception;
    List<Review> findReviewByRoom(int no) throws Exception;
    List<String> findPhotosByRno(int no) throws Exception;
    List<String> findPhotosByUno(int no) throws Exception;
    List<String> findPhotosByResNo(int no) throws Exception;
    int countReview(int no) throws Exception;
    int countPhoto(int no) throws Exception;
    int deleteByNo(int no) throws Exception;
    int deletePhotoByNo(int no) throws Exception;
    int hasPhoto(int no) throws Exception;
    int update(Review review) throws Exception;
}