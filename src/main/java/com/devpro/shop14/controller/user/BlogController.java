package com.devpro.shop14.controller.user;

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
import com.devpro.shop14.entities.Post;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.PostService;
import com.devpro.shop14.services.ProductsService;

@Controller
public class BlogController extends BaseController{
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private PostService postService;
	@Autowired
	private ProductsService productsService;

	@RequestMapping(value = { "/blog" }, method = RequestMethod.GET) // -> action
	public String animeWatching(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);
		
		List<Post> post = postService.findAll();
		model.addAttribute("post",post);
		
		List<Products> products = productsService.findComming();
		model.addAttribute("products" ,products);
		
		// cac views se duoc dat tai thu muc:
		return "user/blog"; // -> duong dan toi VIEW.
	}
}
