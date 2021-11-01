package com.devpro.shop14.homework.homework22_7;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devpro.shop14.dto.Hw22_7;

@Controller
public class TikiController {
	@RequestMapping(value = { "/hw22_7" }, method = RequestMethod.GET) // -> action
	public String comment(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		model.addAttribute("hw22_7", new Hw22_7());
		// cac views se duoc dat tai thu muc: 
		return "homework/hw22_7"; // -> duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/hw22_7" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("hw22_7") Hw22_7 hw,
			@RequestParam("fileUpload") MultipartFile[] inputFiles)
			throws IOException {
		//1: lay thon tin nguoi dung day len
		String email = hw.getEmail();
		
		//TODO 2: luu thong tin vao co so du lieu
		
		//3: thong bao cho nguoi biet da luu thanh cong
		model.addAttribute("thongbao", "Cảm ơn bạn "+ email+ " góp ý!");
		
		//4 save file
		if (inputFiles.length > 0) {
			for (MultipartFile file : inputFiles) {
				file.transferTo(new File("D:\\J52_dev_pro\\com.devpro.shop14\\upload\\" + file.getOriginalFilename()));
			}
		}
		
		// cac views se duoc dat tai thu muc: /src/main/webapp/WEB-INF/views
		return "homework/hw22_7"; // -> duong dan toi VIEW.
	}
	@RequestMapping(value = { "/hw22_7-ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response, 
						final @RequestBody Hw22_7 hw22_7
						) {
		
		//System.out.println("Contact[Email]: " + hw22_7.getEmail());

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200 <-> thanh cong
		// 500 <-> khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", hw22_7);
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/hw22_7-ajax-file" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactAjaxFile(final Model model , 
						final HttpServletRequest request, 
						final HttpServletResponse response,
						@RequestParam("fileUpload") MultipartFile[] inputFiles) {
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		ArrayList<String> list = new ArrayList<String>(); 
		if (inputFiles.length > 0) {
			for (MultipartFile file : inputFiles) {
				try {
					file.transferTo(new File("D:\\J52_dev_pro\\com.devpro.shop14\\upload\\" + file.getOriginalFilename()));
					list.add(file.getOriginalFilename());
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		jsonResult.put("Status", 200);
		jsonResult.put("SuccessList", list);

		return ResponseEntity.ok(jsonResult);
	}
	
}
