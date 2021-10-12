package com.sdc.escape.service;

import java.util.List;
import java.util.Map;

import com.sdc.escape.domain.Event;
import org.springframework.stereotype.Service;

public interface EventService {
	List<Event> list() throws Exception;
	Event eventByNo(int no) throws Exception;
	int add(Event event) throws Exception;
	int update(Event event) throws Exception;
	int delete(int no) throws Exception;
	Map<String, Object> findPhotoByEventNo(int eventNo) throws Exception;
	int addPhoto(Map<String, Object> photoMap) throws Exception;
	int updatePhoto(Map<String, Object> photoMap) throws  Exception;
	int deletePhoto(int no) throws Exception;
}
