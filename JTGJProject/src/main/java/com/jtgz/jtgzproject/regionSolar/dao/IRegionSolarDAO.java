package com.jtgz.jtgzproject.regionSolar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.regionSolar.dto.RegionSolarDTO;

@Mapper
public interface IRegionSolarDAO {
	
	// ������ �¾翭 ������ ��������(SELECT)
	List<RegionSolarDTO> solarSelect();
	
	
}
