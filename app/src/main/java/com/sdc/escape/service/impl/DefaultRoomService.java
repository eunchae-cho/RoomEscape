package com.sdc.escape.service.impl;

import java.util.List;

import com.sdc.escape.dao.RoomDao;
import com.sdc.escape.domain.Room;
import com.sdc.escape.service.RoomService;

public class DefaultRoomService implements RoomService{
    RoomDao roomDao;

    public DefaultRoomService(RoomDao roomDao) {
        this.roomDao = roomDao;
    }

    @Override
    public List<Room> list() throws Exception {
        return roomDao.findAll();
    }
}
