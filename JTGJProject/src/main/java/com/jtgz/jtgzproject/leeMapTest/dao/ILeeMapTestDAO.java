package com.jtgz.jtgzproject.leeMapTest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;

@Mapper
public interface ILeeMapTestDAO {
	
	// ��� ���� ���� ��������
	List<LeeMapTestDTO> allBuildingInfo();
	
}
