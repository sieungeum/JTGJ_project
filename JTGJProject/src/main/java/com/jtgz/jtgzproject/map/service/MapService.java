package com.jtgz.jtgzproject.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.map.dao.IMapDAO;
import com.jtgz.jtgzproject.map.dto.MapDTO;

@Service
public class MapService {
	
	@Autowired
	IMapDAO dao;
	
	public List<MapDTO> allBuildingInfo() {
		List<MapDTO> result = dao.allBuildingInfo();
		return result;
	}
}
