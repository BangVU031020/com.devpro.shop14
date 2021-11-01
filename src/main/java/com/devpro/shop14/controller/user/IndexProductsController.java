package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;


@Controller
public class IndexProductsController extends BaseController{
	
	@Autowired
	private ProductsService productsService;
	@Autowired
	private CategoriesService categoriesService;
	
	@RequestMapping(value = { "/user/index-product" }, method = RequestMethod.GET) // -> action
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
		model.addAttribute("pageNext" ,pageNext);
		model.addAttribute("pagePrevious" ,pagePrevious);
		model.addAttribute("products" ,products);
		
		
		// cac views se duoc dat tai thu muc: 
		return "user/index-product"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/user/product-detail/{productId}" }, method = RequestMethod.GET) // -> action
	public String delProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("productId") int productId)
			throws IOException {
		
		Products products = productsService.getById(productId);
		model.addAttribute("product" ,products);
		// cac views se duoc dat tai thu muc: 
		return "user/product-detail"; // -> duong dan toi VIEW.
	}
}
