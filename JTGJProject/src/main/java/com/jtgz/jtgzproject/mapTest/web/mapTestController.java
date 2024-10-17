package com.jtgz.jtgzproject.mapTest.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgz.jtgzproject.mapTest.dto.MapTestDTO;
import com.jtgz.jtgzproject.mapTest.service.MapTestService;

@Controller
public class mapTestController {
	
	@Autowired
	MapTestService mapTestService;

	@RequestMapping("/mapViewTest")
	public String mapTestView(HttpSession session) {
		System.out.println(" - mapViewTest - ");
		
		MapTestDTO mapInfo = mapTestService.testMapInfo("주거용", "서울 용산구 원효로3가 277-8");
		
		System.out.println(mapInfo);
		
		session.setAttribute("mapInfo", mapInfo);
		
		return "map/mapViewTest";
	}
}
