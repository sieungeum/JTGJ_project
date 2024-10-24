package com.jtgz.jtgzproject.map.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jtgz.jtgzproject.map.dto.MapDTO;
import com.jtgz.jtgzproject.map.service.MapService;

@Controller
public class MapController {
	
	@Autowired
	MapService service;
	
	// ��� ���� �׽�Ʈ
	@RequestMapping("/mapView")
	public String mapView() {
		System.out.println("���� ȭ�� ����");
		return "map/mapView";
	}
	
	// ������ �ε��� DB���� �ǹ����� �޾ƿ���
	@GetMapping("/getAllInfo")
	@ResponseBody
	public List<MapDTO> getAllInfo(){
		List<MapDTO> result = service.allBuildingInfo();
		System.out.println("DB���� �޾ƿ���");
		return result;
	}
}
