package com.sdc.escape.service;

import com.sdc.escape.domain.RoomAttribute;

public interface RoomAttributeService {
    RoomAttribute roomAttrByNo(int no) throws Exception;
    RoomAttribute roomAttrByNoWithoutStar(int no) throws Exception;
    int add(RoomAttribute roomAttribute) throws Exception;
    int delete(int no) throws Exception;
    int update(RoomAttribute roomAttribute) throws Exception;
}
