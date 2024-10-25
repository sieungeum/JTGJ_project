package com.jtgz.jtgzproject.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.map.dto.MapDTO;

@Mapper
public interface IMapDAO {
	
	// ¸ðµç ºôµù Á¤º¸ °¡Á®¿À±â
	List<MapDTO> allBuildingInfo();
	
	// SJM ºôµù ¼ö
	int countBuilding();
	
	// SJM zeb ºôµù ¼ö
	int countZebBuilding();
}
