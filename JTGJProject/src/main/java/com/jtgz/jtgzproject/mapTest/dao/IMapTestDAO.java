package com.jtgz.jtgzproject.mapTest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;

@Mapper
public interface IMapTestDAO {
	
	// �ǹ� ���� �ҷ����� (SELECT)
	MapTestDTO testMapInfo(@Param("purposeKindName")String purposeKindName, @Param("locAddr")String locAddr);
	
	// ��� �ǹ� zeb ���� ������ �ҷ����� (SELECT)
	List<MapTestDTO> allBuildingZeb();
}
