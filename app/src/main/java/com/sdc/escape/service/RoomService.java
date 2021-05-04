package com.sdc.escape.service;

import com.sdc.escape.domain.Room;

public interface RoomService {
	Room list() throws Exception;
    Room listByNo(int no) throws Exception;
}
