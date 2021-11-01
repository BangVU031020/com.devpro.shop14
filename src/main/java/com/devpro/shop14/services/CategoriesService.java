package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.Categories;

@Service
public class CategoriesService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}
	
	public List<Categories> findAllActive() {
		String sql = "SELECT * FROM tbl_category WHERE status = 1";
		return super.executeNativeSql(sql, -1);
	}
}
