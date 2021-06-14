package com.sdc.escape.dao;

import java.util.List;

import com.sdc.escape.domain.Event;

public interface EventDao {
	List<Event> findAll() throws Exception;
	Event findByNo(int no) throws Exception;
	int add(Event event) throws Exception;
	int update(int no) throws Exception;
	int delete(int no) throws Exception;
}
