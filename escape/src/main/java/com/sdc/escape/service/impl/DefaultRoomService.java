package com.sdc.escape.service.impl;

import java.util.List;

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
    public List<Room> list() throws Exception {
    	return roomDao.findAll();
    }

    @Override
    public Room roomByNo(int no) throws Exception {
        return roomDao.findByNo(no);
    }
    
    @Override
    public int add(Room room) throws Exception {
    	return roomDao.add(room);
    }
    
    @Override
    public int recentNo() throws Exception {
    	return roomDao.recentNo();
    }
    
    @Override
    public int delete(int no) throws Exception {
    	return roomDao.delete(no);
    }
    
    @Override
    public Room roomByNoWithoutStar(int no) throws Exception {
    	return roomDao.findByNoWithoutStar(no);
    }
    
    @Override
    public int update(Room room) throws Exception {
    	return roomDao.update(room);
    }
}
