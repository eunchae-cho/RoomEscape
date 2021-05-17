package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.RoomTime;

public interface RoomTimeService {
    List<RoomTime> timeByNo(int no) throws Exception;
}
