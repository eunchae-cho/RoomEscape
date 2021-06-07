package com.sdc.escape.dao;

import java.util.List;

import com.sdc.escape.domain.Review;

public interface ReviewDao {
    List<Review> findByUno(int no) throws Exception;
}
