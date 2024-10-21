package com.jtgz.jtgzproject.leeMapTest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.leeMapTest.dao.ILeeMapTestDAO;
import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;

@Service
public class LeeMapTestService {

	@Autowired
	ILeeMapTestDAO dao;
	
	public List allBuildingInfo() {
		List<LeeMapTestDTO> result = dao.allBuildingInfo();
		return result;
	}
}
