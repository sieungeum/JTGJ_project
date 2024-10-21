package com.jtgz.jtgzproject.leeMapTest.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;
import com.jtgz.jtgzproject.leeMapTest.service.LeeMapTestService;

@Controller
public class LeeMapTestController {
	
	@Autowired
	LeeMapTestService service;
	
	// 재완 지도 테스트
	@RequestMapping("/LeeTestPage")
	public String LeeTestPage() {
		System.out.println("지도 화면 실행");
		return "map/LeeTestPage";
	}
	
	// 페이지 로딩시 DB에서 건물정보 받아오기
	@GetMapping("/getAllInfo")
	@ResponseBody
	public List<LeeMapTestDTO> getAllInfo(){
		List<LeeMapTestDTO> result = service.allBuildingInfo();
		System.out.println("DB정보 받아오기");
		return result;
	}
	
}
