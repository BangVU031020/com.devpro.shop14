package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Post;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.User;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.PostService;
import com.devpro.shop14.services.ProductsService;
import com.devpro.shop14.services.RoleService;
import com.devpro.shop14.services.UserService;

@Controller
public class SignUpController extends BaseController {
	@Autowired
	private CategoriesService categoriesService;

	@Autowired
	private ProductsService productsService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postsService;

	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET) // -> action
	public String signUp(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);

		model.addAttribute("nUser", new User());
		// cac views se duoc dat tai thu muc:
		return "user/signup"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST) // -> action
	public String addPost(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("nUser") User nUser, @RequestParam("avatarUpload") MultipartFile avatarUpload)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		List<User> listUser = userService.findAll();
		boolean check = true;
		for (User user : listUser) {
			if (nUser.getUsername().equalsIgnoreCase(user.getUsername()) || nUser.getEmail().equalsIgnoreCase(user.getEmail())) {
				check = false;
				break;
			}
		}

		if (check) {
			nUser.addRoles(roleService.getById(12));
			String password = nUser.getPassword();
			PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(4);
			nUser.setPassword(passwordEncoder.encode(password));

			if (nUser.getId() == null || nUser.getId() <= 0) {
				userService.save(nUser, avatarUpload);
			} else {
				userService.edit(nUser, avatarUpload);
			}
		}
		model.addAttribute("check",check);
		try {
			TimeUnit.SECONDS.sleep(3);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// cac views se duoc dat tai thu muc:
		return "redirect:/login"; // -> duong dan toi VIEW.
	}

	@RequestMapping(value = { "/user-detail" }, method = RequestMethod.GET) // -> action
	public String signDetail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {

		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);
		User user = getUserLogined();
		ArrayList<Products> listWatch = new ArrayList<Products>();
		if (!StringUtils.isEmpty(user.getWatched())) {
			String[] watched = user.getWatched().split("@");
			ModelSearch ps = new ModelSearch();
			for (String string : watched) {
				ps.setSeo(string);
				listWatch.add(productsService.searchOne(ps));
			}
		}
		

		model.addAttribute("posts" ,new Post());
		model.addAttribute("listWatch", listWatch);
		model.addAttribute("nUser", user);
		return "user/user-detail";
	}
	@RequestMapping(value = { "/edit" }, method = RequestMethod.POST) // -> action
	public String eiit(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("nUser") User nUser, @RequestParam("avatarUpload") MultipartFile avatarUpload)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		String password = nUser.getPassword();
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(4);
		nUser.setPassword(passwordEncoder.encode(password));
		

		ArrayList<Products> listWatch = new ArrayList<Products>();
		if (!StringUtils.isEmpty(nUser.getWatched())) {
			String[] watched = nUser.getWatched().split("@");
			ModelSearch ps = new ModelSearch();
			for (String string : watched) {
				ps.setSeo(string);
				listWatch.add(productsService.searchOne(ps));
			}
		}
		

		model.addAttribute("listWatch", listWatch);

		if (nUser.getId() == null || nUser.getId() <= 0) {
			userService.save(nUser, avatarUpload);
		} else {
			userService.edit(nUser, avatarUpload);
		}
		try {
			TimeUnit.SECONDS.sleep(3);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// cac views se duoc dat tai thu muc:
		return "user/user-detail"; // -> duong dan toi VIEW.
	}

}
