package com.sdc.escape.dao;

import com.sdc.escape.domain.RoomAttribute;

public interface RoomAttributeDao {
	RoomAttribute findByNo(int no) throws Exception;
}
