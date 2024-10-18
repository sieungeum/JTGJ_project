package com.jtgz.jtgzproject.leeMapTest.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgz.jtgzproject.leeMapTest.dto.LeeMapTestDTO;
import com.jtgz.jtgzproject.leeMapTest.service.LeeMapTestService;

@Controller
public class LeeMapTestController {
	
	@Autowired
	LeeMapTestService leeMapTestService;
	
	// ��� ���� �׽�Ʈ
	@RequestMapping("/LeeTest")
	public String LeeTest() {
		System.out.println("��� ���� �׽�Ʈ ȭ�� ����");
		
		List<LeeMapTestDTO> allInfo = leeMapTestService.allBuildingInfo();
		
		return "map/LeeTest";
	}
	
}
