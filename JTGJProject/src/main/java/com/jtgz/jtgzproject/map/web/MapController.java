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
	
	// 재완 지도 테스트
	@RequestMapping("/mapView")
	public String mapView() {
		System.out.println("지도 화면 실행");
		return "map/mapView";
	}
	
	// 페이지 로딩시 DB에서 건물정보 받아오기
	@GetMapping("/getAllInfo")
	@ResponseBody
	public List<MapDTO> getAllInfo(){
		List<MapDTO> result = service.allBuildingInfo();
		System.out.println("DB정보 받아오기");
		return result;
	}
}
