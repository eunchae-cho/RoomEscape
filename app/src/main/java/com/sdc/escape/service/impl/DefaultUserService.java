package com.sdc.escape.service.impl;

import java.util.HashMap;
import java.util.Map;

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
	public User getByIdPassword(String id, String password) throws Exception {
		return userDao.findByIdPassword(id, password);
	}
	
	@Override
	public User findIdByNameEmail(String name, String email) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("email", email);
		return userDao.findIdByNameEmail(map);
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
	public User findSameId(String id) throws Exception {
		return userDao.findSameId(id);
	}
	
	@Override
	public int update(User user) throws Exception {
		return userDao.update(user);
	}
	
	@Override
	public int deleteByNo(int no) throws Exception {
		return userDao.deleteByNo(no);
	}
}
