package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;

@Controller
public class SearchController extends BaseController {

	@Autowired
	CategoriesService categoriesService;

	@Autowired
	ProductsService productsService;

	@RequestMapping(value = { "/search" }, method = RequestMethod.GET) // -> action
	public String search(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);

		List<Products> all = productsService.findAllActive();
		List<Products> search = new ArrayList<Products>();
		ModelSearch ps = new ModelSearch();
		if (!StringUtils.isEmpty(request.getParameter("keyword"))) {
			ps.setKeyword(request.getParameter("keyword"));
			search = productsService.search(ps);
		} else {
			search = all;
		}
		if (!StringUtils.isEmpty(request.getParameter("title"))) {
			ps.setTitle(request.getParameter("title"));
			for (int i = 0; i < search.size(); i++) {
				if (!search.get(i).getCategories().getName().equals(ps.getTitle())) {
					search.remove(i);
					i--;
				}
			}
		}
		if (!StringUtils.isEmpty(request.getParameter("year"))) {
			ps.setYear(request.getParameter("year"));
			for (int i = 0; i < search.size(); i++) {
				if (!search.get(i).getReleaseDate().contains(ps.getYear())) {
					search.remove(i);
					i--;
				}
			}
		}

		model.addAttribute("proSearch", search);

		model.addAttribute("modelSearch", ps);

		// cac views se duoc dat tai thu muc:
		return "user/search"; // -> duong dan toi VIEW.
	}

}
