package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;


@Controller
public class ManagerCategoriesController extends BaseController{
	
	@Autowired
	private CategoriesService categoriesService;
	
	@RequestMapping(value = { "/admin/category" }, method = RequestMethod.GET) // -> action
	public String cate(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		List<Categories> categories = categoriesService.findAll();
		model.addAttribute("categories" ,categories);
		// cac views se duoc dat tai thu muc: 
		return "manager/category"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.GET) // -> action
	public String add(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		List<Categories> categories = categoriesService.findAll();
		Categories category = new Categories();
		model.addAttribute("categories" ,categories);
		model.addAttribute("category" ,category);
		model.addAttribute("nameAction" , "Add Category");
		// cac views se duoc dat tai thu muc: 
		return "manager/add-category"; // -> duong dan toi VIEW.
	}
	
	
	@RequestMapping(value = { "/admin/edit-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") int categoryId)
			throws IOException {
		
		Categories category = categoriesService.getById(categoryId);
		
		List<Categories> categories = categoriesService.findAll();
		model.addAttribute("categories" ,categories);
		model.addAttribute("category" ,category);
		model.addAttribute("nameAction" , "Edit Category");
		// cac views se duoc dat tai thu muc: 
		return "manager/add-category"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/admin/del-category/{categoryId}" }, method = RequestMethod.GET) // -> action
	public String delProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categoryId") Integer categoryId)
			throws IOException {
		
		categoriesService.deleteById(categoryId);
		// cac views se duoc dat tai thu muc: 
		return "manager/category"; // -> duong dan toi VIEW.
	}
	
	
	@RequestMapping(value = { "/admin/add-category" }, method = RequestMethod.POST) // -> action
	public String addCate(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("category") Categories category)
			throws IOException {
		categoriesService.saveOrUpdate(category);
		// cac views se duoc dat tai thu muc: 
		return "redirect:" + "category"; // -> duong dan toi VIEW.
	}
	
}
