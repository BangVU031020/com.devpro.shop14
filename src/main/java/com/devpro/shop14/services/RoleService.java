package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.Role;

@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}
	
	public List<Role> findAllActive() {
		String sql = "SELECT * FROM tbl_roles ";
		return super.executeNativeSql(sql, -1);
	}
}
