package com.devpro.shop14.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop14.controller.BaseController;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;

@Controller // -> controller
public class HomeController extends BaseController{
	@Autowired
	CategoriesService categoriesService;
	@Autowired
	ProductsService productsService;

	@RequestMapping(value = { "/index" }, method = RequestMethod.GET) // -> action
	public String index(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		List<Categories> list = categoriesService.findAll();
		model.addAttribute("category", list);
		
		List<Products> listProduct = productsService.findAllActive();
		
		List<Products> productHot = new ArrayList<Products>();
		int count = 0;
		for (Products products : listProduct) {
			if (products.getIsHot()) {
				productHot.add(products);
				count++;
			}
			if (count == 3) {
				count = 0;
				break;
			}
		}
		
		
		model.addAttribute("productHot", productHot);
		
		List<Products> productHight = productsService.findAllHight();
		model.addAttribute("productHight", productHight);
		
		List<Products> productPopular = productsService.findAllPopular();
		model.addAttribute("productPopular", productPopular);
		
		List<Products> productNew = productsService.findAllNew();
		model.addAttribute("productNew", productNew);
		
		List<Products> productBest = productsService.findAllTheBest();
		model.addAttribute("productBest", productBest);
		
		List<Products> productWatch = productsService.findAllWatch();
		model.addAttribute("productWatch", productWatch);
		
		List<Products> productComment = productsService.findAllComment();
		model.addAttribute("productComment", productComment);
		// cac views se duoc dat tai thu muc: 
		return "user/index"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/save-contact" }, method = RequestMethod.POST) // -> action
	public String saveContact(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		//1: lay thon tin nguoi dung day len
		String email = request.getParameter("txtName");
		
		//TODO 2: luu thong tin vao co so du lieu
		
		//3: thong bao cho nguoi biet da luu thanh cong
		model.addAttribute("thongbao", "Cam on ban "+ email+ " da gui lien he!");
		
		// cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views
		return "user/index"; // -> duong dan toi VIEW.
	}

}

