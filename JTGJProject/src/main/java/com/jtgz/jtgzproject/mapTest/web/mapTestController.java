package com.jtgz.jtgzproject.mapTest.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;
import com.jtgz.jtgzproject.mapTest.service.MapTestService;

@Controller
public class mapTestController {
	
	@Autowired
	MapTestService mapTestService;
	// 績獣 凪戚走 穿勺 controller
	@RequestMapping("/mapViewTest")
	public String mapTestView(HttpSession session) {
		System.out.println(" - mapViewTest - ");
		
		return "map/mapViewTest";
	}
	
	@ResponseBody
	@PostMapping("/mapViewTestDo")
	public MapTestDTO mapViewTestDo(String purposeKindName, String locAddr, HttpSession session) {
		System.out.println(" - mapViewTestDo - ");

		System.out.println(purposeKindName);
		
		MapTestDTO mapInfo = mapTestService.testMapInfo(purposeKindName, locAddr);
		
		System.out.println(mapInfo);
		
		// し格生生嬢嬢嬢嬢嬢っし
		// しいけ櫛蟹っ空嬢たいし
		
		return mapInfo;
	}
	
	
	
	
	
	
	
	
}
