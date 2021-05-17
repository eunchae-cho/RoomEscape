package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.RoomAttributeDao;
import com.sdc.escape.domain.RoomAttribute;
import com.sdc.escape.service.RoomAttributeService;

@Service
public class DefaultRoomTimeService implements RoomAttributeService{
	RoomAttributeDao roomAttributeDao;

    public DefaultRoomTimeService(RoomAttributeDao roomAttributeDao) {
        this.roomAttributeDao = roomAttributeDao;
    }
    
   
    @Override
    public RoomAttribute roomAttrByNo(int no) throws Exception {
        return roomAttributeDao.findByNo(no);
    }
}
