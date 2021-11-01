package com.devpro.shop14.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_comment")
public class Comment extends BaseEntity{
	@Column(name = "p_id", nullable = true)
	private Integer pId;
	
	@Column(name = "number_like", nullable = true)
	private Integer numberLike;
	
	@Column(name = "number_dislike", nullable = true)
	private Integer numberDislike;
	
	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	@Column(name = "star", nullable = true)
	private Integer star;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "message", length = 500, nullable = true)
	private String message;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "parent")
	private Set<Comment> childs = new HashSet<Comment>();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id")
	private Comment parent;

	public Set<Comment> getChilds() {
		return childs;
	}

	public void setChilds(Set<Comment> childs) {
		this.childs = childs;
	}

	public Comment getParent() {
		return parent;
	}

	public void setParent(Comment parent) {
		this.parent = parent;
	}

	public Integer getNumberLike() {
		return numberLike;
	}

	public void setNumberLike(Integer numberLike) {
		this.numberLike = numberLike;
	}

	public Integer getNumberDislike() {
		return numberDislike;
	}

	public void setNumberDislike(Integer numberDislike) {
		this.numberDislike = numberDislike;
	}
	
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Products product;
	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}
	
	
	
}
