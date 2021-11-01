package com.devpro.shop14.controller.manager;

import java.io.IOException;
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
import com.devpro.shop14.dto.ModelSearch;
import com.devpro.shop14.entities.Categories;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.entities.SaleOrder;
import com.devpro.shop14.entities.SaleOrderProducts;
import com.devpro.shop14.services.CategoriesService;
import com.devpro.shop14.services.ProductsService;
import com.devpro.shop14.services.SaleOrderProductsService;
import com.devpro.shop14.services.SaleOrderService;


@Controller
public class ManagerSaleOrderController extends BaseController{
	
	@Autowired
	private SaleOrderService saOrderService;
	@Autowired
	private SaleOrderProductsService saOrderServiceProductsService;
	
	
	@RequestMapping(value = { "/admin/sale-order" }, method = RequestMethod.GET) // -> action
	public String sale(final ModelMap model,
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
		List<SaleOrder> saleOrders = saOrderService.search(ps);
		int pageNext = ps.getPage()+2;
		if(saleOrders.size() <= 0) {
			pageNext = 1;
		}
		model.addAttribute("keyword" ,keyword);
		model.addAttribute("pageNext" ,pageNext);
		model.addAttribute("pagePrevious" ,pagePrevious);
		model.addAttribute("saleOrders" ,saleOrders);
		
		
		// cac views se duoc dat tai thu muc: 
		return "manager/sale-order"; // -> duong dan toi VIEW.
	}
	
	
	
	@RequestMapping(value = { "/admin/edit-sale-order/{saleId}" }, method = RequestMethod.GET) // -> action
	public String editProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleId") int saleId)
			throws IOException {
		SaleOrder saleOrder = saOrderService.getById(saleId);
		
		List<SaleOrderProducts> saleProducts = saOrderServiceProductsService.findListById(saleId);
		model.addAttribute("saleOrder" ,saleOrder);
		model.addAttribute("saleProducts" ,saleProducts);
		model.addAttribute("nameAction" , "Edit Sale Order");
		// cac views se duoc dat tai thu muc: 
		return "manager/edit-sale-order"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/admin/edit-sale-order" }, method = RequestMethod.POST) // -> action
	public String addProduct(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("saleOrder") SaleOrder saleOrder)
			throws IOException {
		saOrderService.saveOrUpdate(saleOrder);
		// cac views se duoc dat tai thu muc: 
		return "redirect:" + "sale-order?page=1"; // -> duong dan toi VIEW.
	}
	
}
