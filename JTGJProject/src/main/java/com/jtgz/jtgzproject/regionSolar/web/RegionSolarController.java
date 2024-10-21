package com.jtgz.jtgzproject.regionSolar.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;
import com.jtgz.jtgzproject.mapTest.service.MapTestService;
import com.jtgz.jtgzproject.regionSolar.dto.RegionSolarDTO;
import com.jtgz.jtgzproject.regionSolar.service.RegionSolarService;

@Controller
public class RegionSolarController {

	@Autowired
	RegionSolarService regionSolarService;
	
	@Autowired
	MapTestService mapTestService;

	
	// chartView�� �̵�
	@RequestMapping("/chartView")
	public String chartView(Model model) {
		System.out.println(" - chartView - ");
		
		return "map/chartView";
	}
	
	// chart�� ���� ������ ��������
	@ResponseBody
	@RequestMapping("/chartSolarData")
	public List<RegionSolarDTO> chartSolarData() {
		System.out.println(" - chartSolarData - ");
		
		List<RegionSolarDTO> solar = regionSolarService.solarSelect();
		
		return solar;
	}
	
	// chart�� ���� ������ ��������
	@ResponseBody
	@RequestMapping("/chartZebData")
	public List<MapTestDTO> chartZebData() {
		System.out.println(" - chartZebData - ");
		
		List<MapTestDTO> zeb = mapTestService.allBuildingZeb();
		
		return zeb;
	}
	
}
