package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.Contacts;

@Service
public class ContactsService extends BaseService<Contacts> {

	@Override
	protected Class<Contacts> clazz() {
		return Contacts.class;
	}
	
	public List<Contacts> findAllActive() {
		String sql = "SELECT * FROM tbl_contact";
		return super.executeNativeSql(sql, -1);
	}
}
