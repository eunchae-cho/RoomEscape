package com.sdc.escape.dao;

import com.sdc.escape.domain.Room;

public interface RoomDao {
	Room findAll() throws Exception;
    Room findByNo(int no) throws Exception;
}
