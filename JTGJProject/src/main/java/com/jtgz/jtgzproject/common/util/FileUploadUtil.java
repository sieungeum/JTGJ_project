package com.jtgz.jtgzproject.common.util;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.jtgz.jtgzproject.attach.dto.AttachDTO;

@Component
public class FileUploadUtil {
	
	@Value("#{util['file.uploadpath']}")
	private String uploadPath;
	
	
	 public List<AttachDTO> getAttachListByMultiparts(MultipartFile[] boFileArray) throws IOException{ 
		 // List
	 
	 }
	 
}
