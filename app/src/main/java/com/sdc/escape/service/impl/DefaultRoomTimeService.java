package com.sdc.escape.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.RoomTimeDao;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.service.RoomTimeService;

@Service
public class DefaultRoomTimeService implements RoomTimeService{
	RoomTimeDao roomTimeDao;

    public DefaultRoomTimeService(RoomTimeDao roomTimeDao) {
        this.roomTimeDao = roomTimeDao;
    }
    
    @Override
    public List<RoomTime> list() throws Exception {
    	return roomTimeDao.findAll();
    }
   
    @Override
    public List<RoomTime> timeByNo(int no) throws Exception {
        return roomTimeDao.findByNo(no);
    }
    
    @Override
    public int add(RoomTime roomTime) throws Exception {
    	return roomTimeDao.add(roomTime);
    }
}
