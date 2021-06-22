package com.sdc.escape.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.ReviewDao;
import com.sdc.escape.domain.Review;
import com.sdc.escape.service.ReviewService;

@Service
public class DefaultReviewService implements ReviewService{
	ReviewDao reviewDao;

    public DefaultReviewService(ReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }
   
    @Override
    public List<Review> listByUno(int no) throws Exception {
    	return reviewDao.findByUno(no);
    }
    
    @Override
    public Review reviewByNo(int no) throws Exception {
    	return reviewDao.findByNo(no);
    }
    
    @Override
    public int addPhotos(int no, String photo) throws Exception {
    	Map<String, Object> map = new HashMap<>();
    	map.put("no", no);
    	map.put("photo", photo);
    	return reviewDao.addPhotos(map);
    }
    
    @Override
    public int addReview(Review review) throws Exception {
    	return reviewDao.addReview(review);
    }
    
    @Override
    public int selectNoByResNo(int no) throws Exception {
    	return reviewDao.selectNoByResNo(no);
    }
    
    @Override
    public Review selectOne() throws Exception {
    	return reviewDao.selectOne();
    }
    
    @Override
    public List<Review> listReviewByRoom(int no) throws Exception {
    	return reviewDao.findReviewByRoom(no);
    }
    
    @Override
    public List<String> listPhotos(int no) throws Exception {
    	return reviewDao.findPhotosByRno(no);
    }
    
    @Override
    public int countReview(int no) throws Exception {
    	return reviewDao.countReview(no);
    }
    @Override
    public int countPhoto(int no) throws Exception {
    	return reviewDao.countPhoto(no);
    }
    
    @Override
    public List<String> listPhotosByUno(int no) throws Exception {
    	return reviewDao.findPhotosByUno(no);
    }
    
    @Override
    public int deleteByNo(int no) throws Exception {
    	return reviewDao.deleteByNo(no);
    }
    
    @Override
    public int deletePhotoByNo(int no) throws Exception {
    	return reviewDao.deletePhotoByNo(no);
    }
    
    @Override
    public int hasPhoto(int no) throws Exception {
    	return reviewDao.hasPhoto(no);
    }
    
    @Override
    public List<String> listPhotosByResNo(int no) throws Exception {
    	return reviewDao.findPhotosByResNo(no);
    }
   
    @Override
    public int update(Review review) throws Exception {
    	return reviewDao.update(review);
    }
}
