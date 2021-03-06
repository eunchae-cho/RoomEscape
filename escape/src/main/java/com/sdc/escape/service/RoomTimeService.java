package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.RoomTime;

public interface RoomTimeService {
	List<RoomTime> list() throws Exception;
    List<RoomTime> timeByNo(int no) throws Exception;
    int add(RoomTime roomTime) throws Exception;
    int delete(int no) throws Exception;
}
