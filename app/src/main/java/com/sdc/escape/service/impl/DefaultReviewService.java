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
    public int addPhotos(int no, String photo) throws Exception {
    	Map<String, Object> map = new HashMap<>();
    	map.put("no", no);
    	map.put("photo", photo);
    	return reviewDao.addPhotos(map);
    }
    
}
