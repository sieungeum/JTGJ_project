package com.jtgz.jtgzproject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.admin.dao.IAdminDAO;
import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Service
public class AdminService {
	
	@Autowired
	IAdminDAO dao;
	
	public List<AdminDTO> getAdminList(SearchDTO search) {
		List<AdminDTO> result  = dao.getAdminList(search);
		return result;
	}
	
	public AdminDTO buildingDetail(AdminDTO admin) {
		AdminDTO result = dao.buildingDetail(admin);
		return result;
	}
	
	public AdminDTO buildingEditView(AdminDTO admin) {
		AdminDTO result = dao.buildingEditView(admin);
		return result;
	}
	
	public int buildingEditDo(AdminDTO admin) {
		int result = dao.buildingEditDo(admin);
		return result;
	}
	
	public int buildingAddDo(AdminDTO admin) {
		int result = dao.buildingAddDo(admin);
		return result;
	}
	
	public List<MemberDTO> getAdminMemList(SearchDTO search) {
		List<MemberDTO> result  = dao.getAdminMemList(search);
		return result;
	}
	
	public int adminMemDo(MemberDTO member) {
		int result = dao.adminMemDo(member);
		return result;
	}
	
	public int adminMemDelDo(MemberDTO member) {
		int result = dao.adminMemDelDo(member);
		return result;
	}
	
}
