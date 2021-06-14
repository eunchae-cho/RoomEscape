package com.sdc.escape.dao;

import java.util.List;

import com.sdc.escape.domain.Room;

public interface RoomDao {
	List<Room> findAll() throws Exception;
    Room findByNo(int no) throws Exception;
    int add(Room room) throws Exception;
    int recentNo() throws Exception;
}
