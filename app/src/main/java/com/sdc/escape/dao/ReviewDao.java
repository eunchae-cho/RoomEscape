package com.sdc.escape.dao;

import java.util.List;
import java.util.Map;

import com.sdc.escape.domain.Review;

public interface ReviewDao {
    List<Review> findByUno(int no) throws Exception;
    int addPhotos(Map<String, Object> map) throws Exception;
}
