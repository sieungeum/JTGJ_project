package com.jtgz.jtgzproject.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.admin.dao.IAdminDAO;
import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;

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
	
	public int buildingEditDo(AdminDTO admin) {
		int result = dao.buildingEditDo(admin);
		return result;
	}
	
	public int buildingAddDo(AdminDTO admin) {
		int result = dao.buildingAddDo(admin);
		return result;
	}
	
	public List<AdminDTO> getAdminListSearch(SearchDTO search){
		List<AdminDTO> result = dao.getAdminListSearch(search);
		return result;
	}
	
}
