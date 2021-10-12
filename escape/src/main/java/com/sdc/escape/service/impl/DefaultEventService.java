package com.sdc.escape.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.EventDao;
import com.sdc.escape.domain.Event;
import com.sdc.escape.service.EventService;

@Service
public class DefaultEventService implements EventService{
	EventDao eventDao;

    public DefaultEventService(EventDao eventDao) {
		this.eventDao = eventDao;
    }
   
	 @Override
	public List<Event> list() throws Exception {
		return eventDao.findAll();
	}
	 
	 @Override
	public Event eventByNo(int no) throws Exception {
		return eventDao.findByNo(no);
	}
	 
	 @Override
	public int add(Event event) throws Exception {
		return eventDao.add(event);
	}
	 
	 @Override
	 public int update(Event event) throws Exception {
		 return eventDao.update(event);
	 }
	 
	 @Override
	public int delete(int no) throws Exception {
		eventDao.deletePhoto(no);
		return eventDao.delete(no);
	}

	@Override
	public Map<String, Object> findPhotoByEventNo(int eventNo) throws Exception {
		return eventDao.findPhotoByEventNo(eventNo);
	}

	@Override
	public int addPhoto(Map<String, Object> photoMap) throws Exception {
		return eventDao.addPhoto(photoMap);
	}

	@Override
	public int updatePhoto(Map<String, Object> photoMap) throws  Exception {
		return eventDao.updatePhoto(photoMap);
	}

	@Override
	public int deletePhoto(int no) throws Exception {
		return eventDao.deletePhoto(no);
	}
}
