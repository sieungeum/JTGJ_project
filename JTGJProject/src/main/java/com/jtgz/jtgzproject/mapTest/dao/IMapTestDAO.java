package com.jtgz.jtgzproject.mapTest.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;

@Mapper
public interface IMapTestDAO {
	
	// 건물 종류 불러오기 (SELECT)
	MapTestDTO testMapInfo(@Param("purposeKindName")String purposeKindName, @Param("locAddr")String locAddr);
	
	
}
