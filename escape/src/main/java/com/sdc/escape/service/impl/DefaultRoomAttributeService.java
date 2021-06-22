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
    
    @Override
    public RoomAttribute roomAttrByNoWithoutStar(int no) throws Exception {
    	return roomAttributeDao.findByNoWithoutStar(no);
    }
    
    @Override
    public int add(RoomAttribute roomAttribute) throws Exception {
    	return roomAttributeDao.add(roomAttribute);
    }
    
    @Override
    public int delete(int no) throws Exception {
    	return roomAttributeDao.delete(no);
    }
    
    @Override
    public int update(RoomAttribute roomAttribute) throws Exception {
    	return roomAttributeDao.update(roomAttribute);
    }
}
