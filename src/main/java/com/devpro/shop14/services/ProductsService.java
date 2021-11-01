package com.devpro.shop14.services;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.conf.MVCConf;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.ProductsImages;

@Service
public class ProductsService extends BaseService<Products> {

	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}
	
	public List<Products> findComming() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");  
		LocalDateTime now = LocalDateTime.now();  
		String sql = "SELECT * FROM tbl_products WHERE release_date >= '"+ dtf.format(now) +"'"
				+ "	LIMIT 0, 4";
		return super.executeNativeSql(sql, -1);
	}
	
	public List<Products> findAllHight() {
		String sql = "SELECT * FROM tbl_products WHERE is_hot = '1'"
				+ " ORDER BY watch DESC"
				+ "	LIMIT 0, 5";
		return super.executeNativeSql(sql, -1);
	}
	
	public List<Products> findAllNew() {
		String sql = "SELECT * FROM tbl_products "
				+ " ORDER BY release_date DESC"
				+ "	LIMIT 0, 4";
		return super.executeNativeSql(sql, -1);
	}
	
	public List<Products> findAllWatch() {
		String sql = "SELECT * FROM tbl_products "
				+ " ORDER BY watch DESC"
				+ "	LIMIT 0, 9";
		return super.executeNativeSql(sql, -1);
	}
	public List<Products> findAllComment() {
		String sql = "SELECT * FROM tbl_products "
				+ " ORDER BY comment DESC"
				+ "	LIMIT 0, 8";
		return super.executeNativeSql(sql, -1);
	}
	
	
	public List<Products> findAllTheBest() {
		String sql = "SELECT * FROM tbl_products "
				+ " ORDER BY price DESC"
				+ "	LIMIT 0, 4";
		return super.executeNativeSql(sql, -1);
	}
	
	public List<Products> findAllPopular() {
		String sql = "SELECT * FROM tbl_products "
				+ " ORDER BY watch DESC, comment DESC"
				+ "	LIMIT 0, 4";
		return super.executeNativeSql(sql, -1);
	}

	public List<Products> findAllActive() {
		String sql = "SELECT * FROM tbl_products";
		return super.executeNativeSql(sql, -1);
	}
	
	public Products searchOne(ModelSearch searchModel) {
		Products pr =null;
		List<Products> prs = search(searchModel);
		for (Products products : prs) {
			pr = products;
		}
		return pr;
	}
	public List<Products> searchByCate(int id) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		
		sql += " AND p.category_id =" + id;

		return executeNativeSql(sql, -1);
	}
	// tất cả các services cần thêm hàm search.
	public List<Products> search(ModelSearch searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		
		if (!StringUtils.isEmpty(searchModel.getSeo())) {
			sql += " and ( p.seo like '%" + searchModel.getSeo() + "%' ) ";
		}

		
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			sql += " and ( p.title like '%" + searchModel.getKeyword() + "%'" + " or p.detail_description like '%"
					+ searchModel.getKeyword() + "%'" + " or p.short_description like '%"
					+ searchModel.getKeyword() + "%')";
		}
		
		// chi lay san pham chua xoa
		//sql += " and p.status=1 ";
		return executeNativeSql(sql, searchModel.getPage());
	}

	@Transactional
	public Products save(Products product, MultipartFile avatarUpload, MultipartFile[] pictureUpload)
			throws IllegalStateException, IOException {
		if (!isEmptyUploadFile(avatarUpload)) {
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "product\\avatar\\" + avatarUpload.getOriginalFilename()));
			product.setAvatar("product/avatar/" + avatarUpload.getOriginalFilename());
		}
		if (!isEmptyUploadFile(pictureUpload)) {
			for (MultipartFile pic : pictureUpload) {
				pic.transferTo(
						new File(MVCConf.PATH_UPLOAD_FILE + "product\\picture\\" + pic.getOriginalFilename()));
				ProductsImages images = new ProductsImages();
				images.setPath("product/picture/" + pic.getOriginalFilename());
				images.setTitle(pic.getOriginalFilename());
				product.addProductImages(images);
			}
		}
		return super.saveOrUpdate(product);
	}
	
	@Transactional
	public Products edit(Products product, MultipartFile avatarUpload, MultipartFile[] pictureUpload) throws IllegalStateException, IOException {
		
		Products productDB = super.getById(product.getId());
		
		if (!isEmptyUploadFile(avatarUpload)) {
			
			new File(MVCConf.PATH_UPLOAD_FILE + "product\\avatar\\" + product.getAvatar()).delete();
			
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "product\\avatar\\" + avatarUpload.getOriginalFilename()));
			product.setAvatar("product/avatar/" + avatarUpload.getOriginalFilename());
		}else {
			product.setAvatar(productDB.getAvatar());
		}
		if (!isEmptyUploadFile(pictureUpload)) {
			for (MultipartFile pic : pictureUpload) {
				pic.transferTo(
						new File(MVCConf.PATH_UPLOAD_FILE + "product\\picture\\" + pic.getOriginalFilename()));
				ProductsImages images = new ProductsImages();
				images.setPath("product/picture/" + pic.getOriginalFilename());
				images.setTitle(pic.getOriginalFilename());
				product.addProductImages(images);
			}
		}
		return super.saveOrUpdate(product);
		
	}

	
	
}
