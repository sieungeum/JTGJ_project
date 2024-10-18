package com.jtgz.jtgzproject.map.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	
	@RequestMapping("/mapView")
	public String mapView() {
		return "map/mapView";
	}
	
	// 재완 지도 테스트
	@RequestMapping("/LeeTest")
	public String LeeTest() {
		
		
		return "map/LeeTest";
	}
}
