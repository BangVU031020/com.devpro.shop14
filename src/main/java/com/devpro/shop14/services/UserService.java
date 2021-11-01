package com.devpro.shop14.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.conf.MVCConf;
import com.devpro.shop14.entities.User;
import com.devpro.shop14.entities.User;

@Service
public class UserService extends BaseService<User>{
	
	

	@Override
	protected Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	public User loadUserByUsername(String username) {
		String sql = "SELECT * FROM tbl_users u WHERE u.username='"+username+"'";
		List<User> users = this.executeNativeSql(sql, -1);
		if (users == null || users.size() <= 0) {
			return null;
		}
		return users.get(0);
	}
	@Transactional
	public User save(User product, MultipartFile avatarUpload)
			throws IllegalStateException, IOException {
		if (!isEmptyUploadFile(avatarUpload)) {
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "post\\" + avatarUpload.getOriginalFilename()));
			product.setAvatar("post/" + avatarUpload.getOriginalFilename());
		}
		
		return super.saveOrUpdate(product);
	}
	
	@Transactional
	public User edit(User product, MultipartFile avatarUpload) throws IllegalStateException, IOException {
		
		User productDB = super.getById(product.getId());
		
		if (!isEmptyUploadFile(avatarUpload)) {
			
			new File(MVCConf.PATH_UPLOAD_FILE + "user\\" + product.getAvatar()).delete();
			
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "user\\" + avatarUpload.getOriginalFilename()));
			product.setAvatar("user/" + avatarUpload.getOriginalFilename());
		}else {
			product.setAvatar(productDB.getAvatar());
		}
		
		return super.saveOrUpdate(product);
		
	}
}
