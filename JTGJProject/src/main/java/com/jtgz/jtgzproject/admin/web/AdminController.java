package com.jtgz.jtgzproject.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.admin.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/adminMainView")
	public String adminMainView(){
		return "admin/adminMainView";
	}
	
	@RequestMapping("/buildingView")
	public String adminView(Model model) {
		
		List<AdminDTO> adminList = adminService.getAdminList();
		
		model.addAttribute("adminList", adminList);
		
		return "admin/buildingView";
	}
	
	@RequestMapping("/buildingDetailView")
	public String buildingDetailView(AdminDTO admin, Model model) {
		
		System.out.println(admin);
		System.out.println("건물명" + admin.getBldNm());
		System.out.println("건물 용도" + admin.getPurposeKindName());
		
		AdminDTO detail = adminService.bulidingDetail(admin);
		
		model.addAttribute("detail" ,detail);
		
		System.out.println(detail);
		
		return "admin/buildingDetailView";
		
	}

}
