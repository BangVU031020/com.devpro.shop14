package com.devpro.shop14.services;


import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.SaleOrderProducts;

@Service
public class SaleOrderProductsService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}
	
	public List<SaleOrderProducts> findListById(int id){
		String sql = "SELECT * FROM tbl_saleorder_products t WHERE t.saleorder_id=" + id;
		return (List<SaleOrderProducts>) executeNativeSql(sql, -1);
	}
	
}
