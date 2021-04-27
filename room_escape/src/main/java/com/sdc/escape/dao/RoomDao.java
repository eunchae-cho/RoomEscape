package com.sdc.escape.dao;

import java.util.List;

import com.sdc.escape.domain.Room;

public interface RoomDao {
    List<Room> findAll() throws Exception;
}
