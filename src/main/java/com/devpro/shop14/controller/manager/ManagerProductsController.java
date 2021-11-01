package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;
import com.github.slugify.Slugify;


@Controller
public class ManagerProductsController extends BaseController{
	
	@Autowired
	private ProductsService productsService;
	@Autowired
	private CategoriesService categoriesService;
	
	
	
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET) // -> action
	public String pro(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword" ,keyword);
		ModelSearch ps = new ModelSearch();
		ps.setKeyword(keyword);
		ps.setPage(getCurrentPage(request));
		int pagePrevious = ps.getPage();
		if(pagePrevious <= 0) {
			pagePrevious = 1;
		}
		List<Products> products = productsService.search(ps);
		int pageNext = ps.getPage()+2;
		if(products.size() <= 0) {
			pageNext = 1;
		}
		model.addAttribute("keyword" ,keyword);
		model.addAttribute("pageNext" ,pageNext);
		model.addAttribute("pagePrevious" ,pagePrevious);
		model.addAttribute("products" ,products);
		
		
		// cac views se duoc dat tai thu muc: 
		return "manager/product"; // -> duong dan toi VIEW.
	}
	
	
	
	@RequestMapping(value = { "/admin/edit-product/{productId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		Products products = productsService.getById(productId);
		
		List<Categories> categories = categoriesService.findAll();
		model.addAttribute("categories" ,categories);
		model.addAttribute("poduct" ,products);
		model.addAttribute("nameAction" , "Edit Product");
		// cac views se duoc dat tai thu muc: 
		return "manager/add-product"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.GET) // -> action
	public String addProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		List<Categories> categories = categoriesService.findAllActive();
		model.addAttribute("categories" ,categories);
		model.addAttribute("poduct" ,new Products());
		model.addAttribute("nameAction" , "Add Product");
		// cac views se duoc dat tai thu muc: 
		return "manager/add-product"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/add-product" }, method = RequestMethod.POST) // -> action
	public String addProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("poduct") Products product,
			@RequestParam("avatarUpload") MultipartFile avatarUpload,
			@RequestParam("pictureUpload") MultipartFile[] pictureUpload)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		if(StringUtils.isEmpty(product.getSeo())) {
			product.setSeo(new Slugify().slugify(product.getTitle()));
		}
		if (product.getId() == null || product.getId() <= 0) {
			productsService.save(product, avatarUpload, pictureUpload);
		}else {
			productsService.edit(product, avatarUpload, pictureUpload);
		}
		// cac views se duoc dat tai thu muc: 
		return "redirect:" + "product"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/del-product/{productId}" }, method = RequestMethod.GET) // -> action
	public String delProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") Integer productId)
			throws IOException {
		
		productsService.deleteById(productId);
		
		// cac views se duoc dat tai thu muc: 
		return "redirect:/admin/product?page=1"; // -> duong dan toi VIEW.
	}
}
