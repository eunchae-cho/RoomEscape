package com.sdc.escape.service;

import com.sdc.escape.domain.User;

public interface UserService {
	User get(String id, String password) throws Exception;
	User userByNo(int no) throws Exception;
	int add(User user) throws Exception;
	User findPassword(String password) throws Exception;
	int update(User user) throws Exception;
}
