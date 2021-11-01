package com.devpro.shop14.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity {

	@Column(name = "title", nullable = true)
	private String title;
	
	@Column(name = "price", nullable = true)
	private BigDecimal price;

	@Column(name = "price_sale", nullable = true)
	private BigDecimal priceSale;

	@Column(name = "short_description", nullable = true)
	private String shortDescription;

	@Lob
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String details;

	@Column(name = "avatar", nullable = true)
	private String avatar;
	
	@Column(name = "release_date", nullable = true)
	private String releaseDate;

	@Column(name = "category_id", insertable = false, updatable = false, nullable = false)
	private Integer categoryId;

	@Column(name = "seo", nullable = true)
	private String seo;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot;

	@Column(name = "ep", nullable = true)
	private Integer ep;

	@Column(name = "comment", nullable = true)
	private Integer comment;

	@Column(name = "watch", nullable = true)
	private Integer watch;

	public Integer getWatch() {
		return watch;
	}

	public void setWatch(Integer watch) {
		this.watch = watch;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "products")
	private Set<ProductsImages> productsImages = new HashSet<ProductsImages>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "product")
	private Set<Comment> comments	 = new HashSet<Comment>();

	
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public void addProductImages(ProductsImages _productsImages) {
		_productsImages.setProduct(this);
		productsImages.add(_productsImages);
	}

	public void deleteProductImages(ProductsImages _productsImages) {
		_productsImages.setProduct(null);
		productsImages.remove(_productsImages);
	}

	public Set<ProductsImages> getProductsImages() {
		return productsImages;
	}

	public void setProductsImages(Set<ProductsImages> productsImages) {
		this.productsImages = productsImages;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public Integer getEp() {
		return ep;
	}

	public void setEp(Integer ep) {
		this.ep = ep;
	}

	public Integer getComment() {
		return comment;
	}

	public void setComment(Integer comment) {
		this.comment = comment;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

}
