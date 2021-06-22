package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.Room;

public interface RoomService {
	List<Room> list() throws Exception;
    Room roomByNo(int no) throws Exception;
    Room roomByNoWithoutStar(int no) throws Exception;
    int add(Room room) throws Exception;
    int recentNo() throws Exception;
    int delete(int no) throws Exception;
    int update(Room room) throws Exception;
}
