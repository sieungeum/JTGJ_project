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
	
	// �ش� �ǹ��� ���� �ҷ�����
	public MapTestDTO testMapInfo(String purposeKindName, String locAddr) {
		MapTestDTO result = dao.testMapInfo(purposeKindName, locAddr);
		
		return result;
	}
	
	// ��� �ǹ��� ���� �ҷ�����
	public List<MapTestDTO> allBuildingZeb(){
		List<MapTestDTO> result = dao.allBuildingZeb();
		
		return result;
	}
	
}
