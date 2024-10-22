package com.jtgz.jtgzproject.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.admin.dto.AdminDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Mapper
public interface IAdminDAO {
	List<AdminDTO> getAdminList(SearchDTO search);
	AdminDTO buildingDetail(AdminDTO admin);
	AdminDTO buildingEditView(AdminDTO admin);
	int buildingEditDo(AdminDTO admin);
	int buildingAddDo(AdminDTO admin);
	List<MemberDTO> getAdminMemList(SearchDTO search);
	int adminMemDo(MemberDTO member);
	int adminMemDelDo(MemberDTO member);
	
}