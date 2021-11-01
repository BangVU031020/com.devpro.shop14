package com.devpro.shop14.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.conf.MVCConf;
import com.devpro.shop14.entities.Post;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.ProductsImages;

@Service
public class PostService extends BaseService<Post>{

	@Override
	protected Class<Post> clazz() {
		// TODO Auto-generated method stub
		return Post.class;
	}
	
	@Transactional
	public Post save(Post product, MultipartFile avatarUpload)
			throws IllegalStateException, IOException {
		if (!isEmptyUploadFile(avatarUpload)) {
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "post\\" + avatarUpload.getOriginalFilename()));
			product.setImg("post/" + avatarUpload.getOriginalFilename());
		}
		
		return super.saveOrUpdate(product);
	}
	
	@Transactional
	public Post edit(Post product, MultipartFile avatarUpload) throws IllegalStateException, IOException {
		
		Post productDB = super.getById(product.getId());
		
		if (!isEmptyUploadFile(avatarUpload)) {
			
			new File(MVCConf.PATH_UPLOAD_FILE + "post\\" + product.getImg()).delete();
			
			avatarUpload.transferTo(
					new File(MVCConf.PATH_UPLOAD_FILE + "post\\" + avatarUpload.getOriginalFilename()));
			product.setImg("post/" + avatarUpload.getOriginalFilename());
		}else {
			product.setImg(productDB.getImg());
		}
		
		return super.saveOrUpdate(product);
		
	}

}
