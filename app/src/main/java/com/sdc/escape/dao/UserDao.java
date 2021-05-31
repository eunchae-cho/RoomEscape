package com.sdc.escape.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.sdc.escape.domain.User;

public interface UserDao {
	User findByIdPassword(@Param("id") String id, @Param("password") String password) throws Exception;
	User findIdByNameEmail(Map<String, Object> map) throws Exception;
	User findByNo(int no) throws Exception;
    int add(User user) throws Exception;
	User findPassword(String password) throws Exception;
	User findSameId(String id) throws Exception;
	int update(User user) throws Exception;
}
