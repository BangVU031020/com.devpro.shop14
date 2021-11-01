package com.devpro.shop14.controller.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;


@Controller
public class ManagerHomeController extends BaseController{
	
	@Autowired
	private CategoriesService categoriesService;
	
	@RequestMapping(value = { "/admin/index" }, method = RequestMethod.GET) // -> action
	public String home(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("show" ,"show");
		// cac views se duoc dat tai thu muc: 
		return "manager/index"; // -> duong dan toi VIEW.
	}

}
