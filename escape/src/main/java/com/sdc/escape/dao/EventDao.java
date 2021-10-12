package com.sdc.escape.dao;

import java.util.List;
import java.util.Map;

import com.sdc.escape.domain.Event;
import org.springframework.context.annotation.Configuration;

public interface EventDao {
	List<Event> findAll() throws Exception;
	Event findByNo(int no) throws Exception;
	int add(Event event) throws Exception;
	int update(Event event) throws Exception;
	int delete(int no) throws Exception;
	Map<String, Object> findPhotoByEventNo(int eventNo) throws Exception;
	int addPhoto(Map<String, Object> photoMap) throws Exception;
	int updatePhoto(Map<String, Object> photoMap) throws  Exception;
	int deletePhoto(int no) throws Exception;
}
