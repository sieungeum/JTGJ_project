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
	
	// ��� ���� �׽�Ʈ
	@RequestMapping("/LeeTestPage")
	public String LeeTestPage() {
		System.out.println("���� ȭ�� ����");
		return "map/LeeTestPage";
	}
	
	// �����͸� ��ȯ (AJAX ��û���� ȣ��� ��������Ʈ)
	@RequestMapping("/getLeeTestData")
	@ResponseBody
	public List<LeeMapTestDTO> getLeeTestData(Model model) {
		System.out.println("���� ������ ��������");
		List<LeeMapTestDTO> allInfo = leeMapTestService.allBuildingInfo();
		
		// JSON ������ ��ȯ
		return allInfo;
	}
	
}
