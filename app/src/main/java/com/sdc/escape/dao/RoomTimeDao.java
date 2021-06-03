package com.sdc.escape.dao;

import java.util.List;

import com.sdc.escape.domain.RoomTime;

public interface RoomTimeDao {
		List<RoomTime> findAll() throws Exception;
    	List<RoomTime> findByNo(int no) throws Exception;
}
