package com.sdc.escape.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.RoomTimeDao;
import com.sdc.escape.domain.RoomTime;
import com.sdc.escape.service.RoomTimeService;

@Service
public class DefaultRoomAttributeService implements RoomTimeService{
	RoomTimeDao roomTimeDao;

    public DefaultRoomAttributeService(RoomTimeDao roomTimeDao) {
        this.roomTimeDao = roomTimeDao;
    }
    
   
    @Override
    public List<RoomTime> timeByNo(int no) throws Exception {
        return roomTimeDao.findByNo(no);
    }
}
