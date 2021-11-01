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
import com.devpro.shop14.entities.Post;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.SaleOrder;
import com.devpro.shop14.entities.SaleOrderProducts;
import com.devpro.shop14.services.PostService;
import com.github.slugify.Slugify;

@Controller
public class ManagerPostController extends BaseController{
	@Autowired
	PostService postsService;

	
	@RequestMapping(value = { "/admin/post" }, method = RequestMethod.GET) // -> action
	public String posts(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("posts", postsService.findAll());
		
		return "manager/post";
	}
	
	@RequestMapping(value = { "/admin/edit-post/{id}" }, method = RequestMethod.GET) // -> action
	public String editPost(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("id") int id)
			throws IOException {
		
		model.addAttribute("posts", postsService.getById(id));
		
		model.addAttribute("nameAction" , "Edit Post");
		// cac views se duoc dat tai thu muc: 
		return "manager/add-post"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/admin/add-post" }, method = RequestMethod.GET) // -> action
	public String addPost(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {

		model.addAttribute("posts" ,new Post());
		model.addAttribute("nameAction" , "Add Post");
		return "manager/add-post";
	}
	
	@RequestMapping(value = { "/admin/add-post" }, method = RequestMethod.POST) // -> action
	public String addPost(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("posts") Post posts,
			@RequestParam("avatarUpload") MultipartFile avatarUpload)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		
		if (isLogined()) {
			posts.setUser(getUserLogined());
		}
		
		if (posts.getId() == null || posts.getId() <= 0) {
			postsService.save(posts, avatarUpload);
		}else {
			postsService.edit(posts, avatarUpload);
		}
		// cac views se duoc dat tai thu muc: 
		return "redirect:" + "post"; // -> duong dan toi VIEW.
	}
}
