package com.sdc.escape.dao;

import org.apache.ibatis.annotations.Param;

import com.sdc.escape.domain.Admin;

public interface AdminDao {
	Admin findByIdPassword(@Param(value = "id") String id, @Param(value = "password") String password) throws Exception;
}
