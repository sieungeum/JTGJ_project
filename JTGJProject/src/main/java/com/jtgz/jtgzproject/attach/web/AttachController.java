package com.jtgz.jtgzproject.attach.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttachController {
	
	@Value("#{util['file.upload.path']}")
	private String uploadPath;
	
}
