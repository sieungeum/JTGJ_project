package com.jtgz.jtgzproject.mapTest.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.mapTest.dao.IMapTestDAO;
import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;

@Service
public class MapTestService {

	@Autowired
	IMapTestDAO dao;
	
	// 해당 건물의 정보 불러오기
	public MapTestDTO testMapInfo(String purposeKindName, String locAddr) {
		MapTestDTO result = dao.testMapInfo(purposeKindName, locAddr);
		
		return result;
	}
	
	// 모든 건물의 정보 불러오기
	public List<MapTestDTO> allBuildingZeb(){
		List<MapTestDTO> result = dao.allBuildingZeb();
		
		return result;
	}
	
}
