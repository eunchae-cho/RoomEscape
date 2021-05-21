package com.sdc.escape.service;

import com.sdc.escape.domain.User;

public interface UserService {
	User get(String id, String password) throws Exception;
	int add(User user) throws Exception;
}
