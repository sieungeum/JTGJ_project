package com.jtgz.jtgzproject.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.map.dto.MapDTO;

@Mapper
public interface IMapDAO {
	
	// 모든 빌딩 정보 가져오기
	List<MapDTO> allBuildingInfo();
}
