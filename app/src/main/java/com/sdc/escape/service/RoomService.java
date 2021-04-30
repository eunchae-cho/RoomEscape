package com.sdc.escape.service;

import java.util.List;

import com.sdc.escape.domain.Room;

public interface RoomService {
    List<Room> list() throws Exception;
}
