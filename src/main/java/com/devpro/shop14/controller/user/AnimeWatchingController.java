package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.dto.SimpleComment;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Comment;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.User;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.CommentService;
import com.devpro.shop14.services.ProductsService;
import com.devpro.shop14.services.UserService;

@Controller
public class AnimeWatchingController extends BaseController {

	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private ProductsService productsService;
	@Autowired
	private UserService userService;
	@Autowired
	private CommentService commentService;

	@RequestMapping(value = { "/anime-watching/{seo}" }, method = RequestMethod.GET) // -> action
	public String animeWatching(final ModelMap model, final HttpServletRequest request, @PathVariable("seo") String seo,
			final HttpServletResponse response) throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);

		ModelSearch ps = new ModelSearch();
		ps.setSeo(seo);
		Products products = productsService.searchOne(ps);

		if (!StringUtils.isEmpty(products.getWatch())) {
			products.setWatch(products.getWatch() + 1);
		} else {
			products.setWatch(1);
		}

		productsService.saveOrUpdate(products);

		if (isLogined()) {
			User uLogined = getUserLogined();
			ArrayList<Products> watched = new ArrayList<Products>();
			if (!StringUtils.isEmpty(uLogined.getWatched())) {
				if (!uLogined.getWatched().contains(seo)) {
					String[] seoWatch = uLogined.getWatched().trim().split("@");
					for (String string : seoWatch) {
						ps.setSeo(string);
						watched.add(productsService.searchOne(ps));
					}
					uLogined.setWatched(uLogined.getWatched() + seo + "@");
				}

			} else {
				uLogined.setWatched(seo + "@");
				ps.setSeo(uLogined.getWatched());
				watched.add(productsService.searchOne(ps));
			}
			model.addAttribute("watched", watched);
			userService.saveOrUpdate(uLogined);
		}
		model.addAttribute("products", products);
		// cac views se duoc dat tai thu muc:
		return "user/anime-watching"; // -> duong dan toi VIEW.
	}

	/*
	 * @RequestMapping(value = { "/anime-watching" }, method = RequestMethod.POST)
	 * // -> action public String saveContact(final ModelMap model, final
	 * HttpServletRequest request, final HttpServletResponse response,
	 * 
	 * @ModelAttribute("comment") SimpleComment comment) throws IOException { //1:
	 * lay thon tin nguoi dung day len String name = comment.getName();
	 * 
	 * //TODO 2: luu thong tin vao co so du lieu
	 * 
	 * //3: thong bao cho nguoi biet da luu thanh cong
	 * model.addAttribute("thongbao", "Cam on ban "+ name + " da gui lien he!");
	 * 
	 * // cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views return
	 * "user/anime-watching"; // -> duong dan toi VIEW. }
	 */
	@RequestMapping(value = { "/comment-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody Comment comment) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong

		if (StringUtils.isEmpty(comment.getName())) {
			jsonResult.put("code", 200);
			jsonResult.put("message", "Hãy nhập tên của bạn!");
		} else if (StringUtils.isEmpty(comment.getMessage())) {
			jsonResult.put("code", 200);
			jsonResult.put("message", "Hãy Nhập bình luận của bạn!");

		} else {
			jsonResult.put("code", 200);
			jsonResult.put("message", "Cảm ơn bình luận của bạn " + comment.getName());
			if (isLogined()) {
				comment.setUser(getUserLogined());
			}
			Products pro = productsService.getById(comment.getpId());
			if (!StringUtils.isEmpty(comment.getStar())) {
				double starP = (pro.getPrice().doubleValue()*pro.getComment() + comment.getStar()) / (pro.getComment() + 1);
				pro.setPrice(new BigDecimal(starP));
			}
			if (StringUtils.isEmpty(pro.getComment())) {
				pro.setComment(1);
			} else {
				pro.setComment(pro.getComment() + 1);
			}
			comment.setProduct(pro);
			productsService.saveOrUpdate(pro);
			commentService.saveOrUpdate(comment);
		}

		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/like/{id}" }, method = RequestMethod.GET) // -> action
	public String like(final ModelMap model, final HttpServletRequest request,
			@PathVariable("id") int id,
			final HttpServletResponse response) throws IOException {

		Comment com = commentService.getById(id);
		if (StringUtils.isEmpty(com.getNumberLike())) {
			com.setNumberLike(1);
		}else {
			com.setNumberLike(com.getNumberLike() + 1);
		}
		commentService.saveOrUpdate(com);

		ModelSearch ps = new ModelSearch();
		ps.setSeo(request.getParameter("seo"));
		Products products = productsService.searchOne(ps);
		model.addAttribute("products", products);
		return "user/anime-watching";
	}

	@RequestMapping(value = { "/dislike/{id}" }, method = RequestMethod.GET) // -> action
	public String dlike(final ModelMap model, final HttpServletRequest request,
			@PathVariable("id") int id,
			final HttpServletResponse response) throws IOException {

		Comment com = commentService.getById(id);
		if (StringUtils.isEmpty(com.getNumberDislike())) {
			com.setNumberDislike(1);
		}else {
			com.setNumberDislike(com.getNumberDislike() + 1);
		}
		commentService.saveOrUpdate(com);

		ModelSearch ps = new ModelSearch();
		ps.setSeo(request.getParameter("seo"));
		Products products = productsService.searchOne(ps);
		model.addAttribute("products", products);
		return "user/anime-watching";
	}
	
	@RequestMapping(value = { "/del/{id}" }, method = RequestMethod.GET) // -> action
	public String del(final ModelMap model, final HttpServletRequest request,
			@PathVariable("id") int id,
			final HttpServletResponse response) throws IOException {
		
		commentService.deleteById(id);

		ModelSearch ps = new ModelSearch();
		ps.setSeo(request.getParameter("seo"));
		Products products = productsService.searchOne(ps);
		model.addAttribute("products", products);
		return "user/anime-watching";
	}
	
}
