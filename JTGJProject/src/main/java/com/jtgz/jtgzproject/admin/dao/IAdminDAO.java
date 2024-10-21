package com.jtgz.jtgzproject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.admin.dto.AdminDTO;

@Mapper
public interface IAdminDAO {
	List<AdminDTO> getAdminList();
	String wirteAdmin(AdminDTO admin);
	AdminDTO buildingDetail(AdminDTO admin);
	AdminDTO buildingEditView(AdminDTO admin);
	int buildingEditDo(AdminDTO admin);
	int buildingAddDo(AdminDTO admin);
}