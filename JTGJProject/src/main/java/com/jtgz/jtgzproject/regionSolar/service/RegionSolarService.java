package com.jtgz.jtgzproject.regionSolar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.regionSolar.dao.IRegionSolarDAO;
import com.jtgz.jtgzproject.regionSolar.dto.RegionSolarDTO;

@Service
public class RegionSolarService {
	
	@Autowired
	IRegionSolarDAO dao;
	
	// ������ �¾翭 ������ ��������
	public List<RegionSolarDTO> solarSelect() {
		List<RegionSolarDTO> result = dao.solarSelect();
		
		return result;
	}
}
