package com.sdc.escape.service;

import com.sdc.escape.domain.User;

public interface UserService {
	User getByIdPassword(String id, String password) throws Exception;
	User findIdByNameEmail(String name, String email) throws Exception;
	User userByNo(int no) throws Exception;
	int add(User user) throws Exception;
	User findPassword(String password) throws Exception;
	User findSameId(String id) throws Exception;
	int update(User user) throws Exception;
	int deleteByNo(int no) throws Exception;
}
