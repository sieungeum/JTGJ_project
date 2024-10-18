package com.jtgz.jtgzproject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.admin.dao.IAdminDAO;
import com.jtgz.jtgzproject.admin.dto.AdminDTO;

@Service
public class AdminService {
	
	@Autowired
	IAdminDAO dao;
	
	public List<AdminDTO> getAdminList() {
		List<AdminDTO> result  = dao.getAdminList();
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
	
	public AdminDTO buildingEditDo(AdminDTO admin) {
		AdminDTO result = dao.buildingEditDo(admin);
		return result;
	}
	
}
