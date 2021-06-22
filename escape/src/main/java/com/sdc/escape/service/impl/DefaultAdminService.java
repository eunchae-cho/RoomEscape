package com.sdc.escape.service.impl;

import org.springframework.stereotype.Service;

import com.sdc.escape.dao.AdminDao;
import com.sdc.escape.domain.Admin;
import com.sdc.escape.service.AdminService;

@Service
public class DefaultAdminService implements AdminService{
	AdminDao adminDao;

    public DefaultAdminService(AdminDao adminDao) {
        this.adminDao = adminDao;
    }
   
    @Override
    public Admin getByIdPassword(String id, String password) throws Exception {
    	return adminDao.findByIdPassword(id, password);
    }

}
