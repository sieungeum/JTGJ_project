package com.jtgz.jtgzproject.regionSolar.web;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgz.jtgzproject.map.service.MapService;
import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;
import com.jtgz.jtgzproject.mapTest.service.MapTestService;
import com.jtgz.jtgzproject.member.service.MemberService;
import com.jtgz.jtgzproject.regionSolar.dto.RegionSolarDTO;
import com.jtgz.jtgzproject.regionSolar.service.RegionSolarService;

@Controller
public class RegionSolarController {

	@Autowired
	RegionSolarService regionSolarService;
	
	@Autowired
	MapTestService mapTestService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MapService mapService;

	// chartView�� �̵�
	@RequestMapping("/chartView")
	public String chartView(Model model) {
		System.out.println(" - chartView - ");
		
		List<String> infoCnt = new ArrayList<>();
		
		int memCnt = memberService.countMemeber();
		int buildingCnt = mapService.countBuilding();
		int zebBuildingCnt = mapService.countZebBuilding();
		
		// ���ڸ� ��ǥ�� ���Ե� ���ڿ��� ��ȯ
        NumberFormat numberFormat = NumberFormat.getInstance();
        String memCntStr = numberFormat.format(memCnt);
        String buildingCntStr = numberFormat.format(buildingCnt);
        String zebBuildingCntStr = numberFormat.format(zebBuildingCnt);

		infoCnt.add(memCntStr);
		infoCnt.add(buildingCntStr);
		infoCnt.add(zebBuildingCntStr);
		
		model.addAttribute("infoCnt" , infoCnt);
		
		return "admin/chartView";
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
