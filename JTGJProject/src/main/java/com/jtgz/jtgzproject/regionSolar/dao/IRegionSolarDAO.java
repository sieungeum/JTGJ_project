package com.jtgz.jtgzproject.regionSolar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.regionSolar.dto.RegionSolarDTO;

@Mapper
public interface IRegionSolarDAO {
	
	// 지역별 태양열 발전량 가져오기(SELECT)
	List<RegionSolarDTO> solarSelect();
	
	
}
