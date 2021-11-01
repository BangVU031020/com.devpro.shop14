package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.dto.SimpleComment;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;

@Controller
public class RomaticController extends BaseController{
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductsService productsService;
	
	@RequestMapping(value = { "/romatic/{id}" }, method = RequestMethod.GET) // -> action
	public String animeWatching(final ModelMap model,
			final HttpServletRequest request,
			@PathVariable("id") int id,
			final HttpServletResponse response)
			throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);
		
		Categories cat = new Categories();
		for (Categories categories : list) {
			if (categories.getId() == id) {
				cat = categories;
				break;
			}
		}
		model.addAttribute("cat",cat);

		List<Products> proCates = productsService.searchByCate(id);
		
		if (!StringUtils.isEmpty(request.getParameter("act"))) {
			int act = Integer.parseInt(request.getParameter("act"));
			if (act == 0) {
				proCates.sort((Products o1, Products o2) -> o1.getTitle().compareToIgnoreCase(o1.getTitle()) > 0 ? -1 : 1);
			}else if (act == 1) {
				proCates.sort((Products o1, Products o2) -> o1.getTitle().compareToIgnoreCase(o1.getTitle()) > 0 ? 1 : -1);
			}else if (act == 2) {
				proCates.sort((Products o1, Products o2) -> o1.getWatch() > o2.getWatch() ? -1 : 1);
			}else if (act == 3) {
				proCates.sort((Products o1, Products o2) -> o1.getComment() > o2.getComment() ? -1 : 1);
			}else if (act == 4) {
				proCates.sort((Products o1, Products o2) -> o1.getPrice().compareTo(o2.getPrice()) > 0 ? -1 : 1);
			}
		}
		model.addAttribute("proCates",proCates);
		
		// cac views se duoc dat tai thu muc: 
		return "user/romatic"; // -> duong dan toi VIEW.
	}
	
}
