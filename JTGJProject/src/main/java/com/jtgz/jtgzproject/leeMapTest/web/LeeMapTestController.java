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
	
	// ��� ���� �׽�Ʈ
	@RequestMapping("/LeeTestPage")
	public String LeeTestPage() {
		System.out.println("���� ȭ�� ����");
		return "map/LeeTestPage";
	}
	
	// ������ �ε��� DB���� �ǹ����� �޾ƿ���
	@GetMapping("/getAllInfo")
	@ResponseBody
	public List<LeeMapTestDTO> getAllInfo(){
		List<LeeMapTestDTO> result = service.allBuildingInfo();
		System.out.println("DB���� �޾ƿ���");
		return result;
	}
	
}
