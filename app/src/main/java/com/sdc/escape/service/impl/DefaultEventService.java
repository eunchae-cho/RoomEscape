package com.sdc.escape.service.impl;

import java.util.List;

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
	 public int update(int no) throws Exception {
		 return eventDao.update(no);
	 }
	 
	 @Override
	public int delete(int no) throws Exception {
		return eventDao.delete(no);
	}
}
