package com.sdc.escape.service;

import com.sdc.escape.domain.Admin;

public interface AdminService {
	Admin getByIdPassword(String id, String password) throws Exception;
}
