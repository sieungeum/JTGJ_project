package com.jtgz.jtgzproject.map.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.map.dto.MapDTO;

@Mapper
public interface IMapDAO {
	
	// ��� ���� ���� ��������
	List<MapDTO> allBuildingInfo();
}
