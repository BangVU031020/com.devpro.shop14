package com.devpro.shop14.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.shop14.entities.Comment;

@Service
public class CommentService extends BaseService<Comment> {

	@Override
	protected Class<Comment> clazz() {
		return Comment.class;
	}
	
	public List<Comment> findAllActive() {
		String sql = "SELECT * FROM tbl_comment";
		return super.executeNativeSql(sql, -1);
	}
}
