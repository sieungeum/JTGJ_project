package com.jtgz.jtgzproject.cal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalController {
	
	@RequestMapping("/calView")
	public String calView() {
		return "cal/calView";
	}
}
