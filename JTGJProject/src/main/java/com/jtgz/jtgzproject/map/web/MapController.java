package com.jtgz.jtgzproject.map.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/mapView")
	public String mapView() {
		return "map/mapView";
	}
	
	// ��� ���� �׽�Ʈ
	@RequestMapping("/LeeTest")
	public String LeeTest() {
		
		
		return "map/LeeTest";
	}
}
