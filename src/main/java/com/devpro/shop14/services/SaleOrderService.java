package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	public List<SaleOrder> search(ModelSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder p WHERE 1=1";

		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and (p.customer_name like '%" + searchModel.getKeyword() + "%'" + " or p.customer_address like '%"
					+ searchModel.getKeyword() + "%'" + " or p.cutomer_email like '%"
					+ searchModel.getKeyword() + "%')";
		}
		
		// chi lay san pham chua xoa
		//sql += " and p.status=1 ";

		return executeNativeSql(sql, searchModel.getPage());
	}
}
