package com.jtgz.jtgzproject.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.admin.service.AdminService;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/adminMainView")
	public String adminMainView(){
		return "admin/adminMainView";
	}
	
	@RequestMapping("/buildingView")
	public String buildingView(Model model, SearchDTO search) {
		
		List<AdminDTO> AdminList = adminService.getAdminList(search);
		
		model.addAttribute("AdminList", AdminList);
		
		System.out.println(search);
		
		return "admin/buildingView";
		
	}
	
	@RequestMapping("/buildingDetailView")
	public String buildingDetailView(AdminDTO admin, Model model) {
		
		AdminDTO detail = adminService.buildingDetail(admin);
		
		model.addAttribute("detail" ,detail);
		
		return "admin/buildingDetailView";
		
	}
	
	@RequestMapping("/buildingEditView")
	public String bulidingEditView(AdminDTO admin, Model model) {
		System.out.println(admin);
		
		AdminDTO edit = adminService.buildingEditView(admin);
		
		System.out.println(edit);
		
		model.addAttribute("edit", edit);
		
		return "admin/buildingEditView";
	}
	
	@PostMapping("/buildingEditDo")
	public String buildingEditDo(AdminDTO admin) {
		System.out.println("- buildingEditdo -");
		System.out.println(admin);
		
		adminService.buildingEditDo(admin);
		
		return "forward:/buildingDetailView";
		
	}
	
	@RequestMapping("/buildingAddView")
	public String buildingAddView() {
		return "admin/buildingAddView";
	}

	@PostMapping("/buildingAddDo")
	public String buildingAddDo(AdminDTO admin) {
		System.out.println(admin);
		
		adminService.buildingAddDo(admin);
		
		return "redirect:/buildingView";
	}
	
	@RequestMapping("/adminMemView")
	public String adminMemView(Model model, SearchDTO search, MemberDTO member){
		
		List<MemberDTO> AdminMemList = adminService.getAdminMemList(search);
		
		model.addAttribute("AdminMemList", AdminMemList);
		
		return "admin/adminMemView";
	}
	
	@PostMapping("/adminMemDo")
	public String adminMemDo(MemberDTO member) {
		System.out.println(member);
		
		adminService.adminMemDo(member);
		
		return "redirect:/adminMemView";
		
	}
	
	@PostMapping("/adminMemDelDo")
	public String adminMemDelDo(MemberDTO member) {
		System.out.println(member);
		
		adminService.adminMemDelDo(member);
		
		return "redirect:/adminMemView";
		
	}
	
}
