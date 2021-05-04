package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.RoomDao;
import com.sdc.escape.domain.Room;
import com.sdc.escape.service.RoomService;

@Service
public class DefaultRoomService implements RoomService{
    RoomDao roomDao;

    public DefaultRoomService(RoomDao roomDao) {
        this.roomDao = roomDao;
    }
    
    @Override
    public Room list() throws Exception {
    	return roomDao.findAll();
    }

    @Override
    public Room listByNo(int no) throws Exception {
        return roomDao.findByNo(no);
    }
}
