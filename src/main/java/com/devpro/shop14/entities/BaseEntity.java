package com.devpro.shop14.entities;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class BaseEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "status", nullable = true)
	private Boolean status;
	
	@Column(name = "created_by", nullable = true)
	private Integer createdBy;
	
	@Column(name = "updated_by", nullable = true)
	private Integer updateBy;
	
	
	@Column(name = "created_date", nullable = true)
	private Date createdDate;
	
	@Column(name = "updated_date", nullable = true)
	private Date upadteDate;

	public Integer getId() {
		return id;
	}

	public Boolean getStatus() {
		return status;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public Integer getUpdateBy() {
		return updateBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public Date getUpadteDate() {
		return upadteDate;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public void setUpdateBy(Integer updateBy) {
		this.updateBy = updateBy;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public void setUpadteDate(Date upadteDate) {
		this.upadteDate = upadteDate;
	}
	
	
	
}
