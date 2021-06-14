package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.Event;

public interface EventService {
	List<Event> list() throws Exception;
	Event eventByNo(int no) throws Exception;
	int add(Event event) throws Exception;
	int update(int no) throws Exception;
	int delete(int no) throws Exception;
}
