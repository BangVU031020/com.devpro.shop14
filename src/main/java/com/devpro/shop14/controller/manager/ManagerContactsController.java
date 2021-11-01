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
import com.devpro.shop14.entities.Contacts;
import com.devpro.shop14.entities.Products;
import com.devpro.shop14.services.ContactsService;


@Controller
public class ManagerContactsController extends BaseController{
	
	@Autowired
	private ContactsService contactsService;
	
	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET) // -> action
	public String con(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		List<Contacts> contacts = contactsService.findAllActive();
		model.addAttribute("contacts" ,contacts);
		// cac views se duoc dat tai thu muc: 
		return "manager/contact"; // -> duong dan toi VIEW.
	}

}
