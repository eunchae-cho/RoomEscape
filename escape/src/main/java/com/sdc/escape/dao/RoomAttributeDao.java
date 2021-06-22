package com.sdc.escape.dao;

import com.sdc.escape.domain.RoomAttribute;

public interface RoomAttributeDao {
	RoomAttribute findByNo(int no) throws Exception;
	RoomAttribute findByNoWithoutStar(int no) throws Exception;
	int add(RoomAttribute roomAttribute) throws Exception;
	int delete(int no) throws Exception;
	int update(RoomAttribute roomAttribute) throws Exception;
}
