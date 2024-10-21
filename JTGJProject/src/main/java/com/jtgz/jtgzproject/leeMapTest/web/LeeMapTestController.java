package com.jtgz.jtgzproject.leeMapTest.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;
import com.jtgz.jtgzproject.leeMapTest.service.LeeMapTestService;

@Controller
public class LeeMapTestController {
	
	@Autowired
	LeeMapTestService leeMapTestService;
	
	// 재완 지도 테스트
	@RequestMapping("/LeeTestPage")
	public String LeeTestPage() {
		System.out.println("지도 화면 실행");
		return "map/LeeTestPage";
	}
	
	// 데이터를 반환 (AJAX 요청에서 호출될 엔드포인트)
	@RequestMapping("/getLeeTestData")
	@ResponseBody
	public List<LeeMapTestDTO> getLeeTestData(Model model) {
		System.out.println("지도 데이터 가져오기");
		List<LeeMapTestDTO> allInfo = leeMapTestService.allBuildingInfo();
		
		// JSON 데이터 반환
		return allInfo;
	}
	
}
