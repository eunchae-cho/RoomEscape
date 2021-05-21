package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.RoomAttributeDao;
import com.sdc.escape.domain.RoomAttribute;
import com.sdc.escape.service.RoomAttributeService;

@Service
public class DefaultRoomAttributeService implements RoomAttributeService{
	RoomAttributeDao roomAttributeDao;

    public DefaultRoomAttributeService(RoomAttributeDao roomAttributeDao) {
        this.roomAttributeDao = roomAttributeDao;
    }
   
    @Override
    public RoomAttribute roomAttrByNo(int no) throws Exception {
        return roomAttributeDao.findByNo(no);
    }
}
