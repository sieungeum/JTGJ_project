package com.jtgz.jtgzproject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;

@Mapper
public interface IAdminDAO {
	List<AdminDTO> getAdminList();
	String wirteAdmin(AdminDTO admin);
	AdminDTO buildingDetail(AdminDTO admin);
	AdminDTO buildingEditView(AdminDTO admin);
	int buildingEditDo(AdminDTO admin);
	int buildingAddDo(AdminDTO admin);
	List<AdminDTO> getAdminList(SearchDTO search);
}