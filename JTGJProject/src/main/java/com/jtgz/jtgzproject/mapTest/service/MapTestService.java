package com.jtgz.jtgzproject.mapTest.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.mapTest.dao.IMapTestDAO;
import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;

@Service
public class MapTestService {

	@Autowired
	IMapTestDAO dao;
	
	public MapTestDTO testMapInfo(String purposeKindName, String locAddr) {
		MapTestDTO result = dao.testMapInfo(purposeKindName, locAddr);
		
		return result;
	}
	
}
