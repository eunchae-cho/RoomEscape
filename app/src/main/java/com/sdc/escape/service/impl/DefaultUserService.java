package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.UserDao;
import com.sdc.escape.domain.User;
import com.sdc.escape.service.UserService;

@Service
public class DefaultUserService implements UserService{
	UserDao userDao;
	
	public DefaultUserService(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public User get(String id, String password) throws Exception {
		return userDao.findByIdPassword(id, password);
	}
	
	@Override
	public User userByNo(int no) throws Exception {
		return userDao.findByNo(no);
	}
	
	@Override
	public int add(User user) throws Exception {
		return userDao.add(user);
	}
	
	@Override
	public User findPassword(String password) throws Exception {
		return userDao.findPassword(password);
	}
	
	@Override
	public int update(User user) throws Exception {
		return userDao.update(user);
	}
}
