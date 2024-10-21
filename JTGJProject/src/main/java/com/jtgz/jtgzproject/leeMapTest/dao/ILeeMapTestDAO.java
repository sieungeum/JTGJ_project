package com.jtgz.jtgzproject.leeMapTest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;

@Mapper
public interface ILeeMapTestDAO {
	
	// 모든 빌딩 정보 가져오기
	List<LeeMapTestDTO> allBuildingInfo();
	
}
