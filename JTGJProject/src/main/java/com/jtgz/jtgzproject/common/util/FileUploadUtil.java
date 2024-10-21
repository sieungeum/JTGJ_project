package com.jtgz.jtgzproject.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.jtgz.jtgzproject.attach.dto.AttachDTO;

@Component
public class FileUploadUtil {
	
	@Value("#{util['file.uploadpath']}")
	private String uploadPath;
	
	public List<AttachDTO> getAttachListByMultiparts(MultipartFile[] boFileArray) throws IOException{
		List<AttachDTO> attachList = new ArrayList<>();
		
		for(MultipartFile boFile : boFileArray) {
			if(!boFile.isEmpty()) {
				AttachDTO attach = getAttachByMultipart(boFile);
				attachList.add(attach);
			}
		}
		return attachList;
	}
	
	public AttachDTO getAttachByMultipart(MultipartFile boFile) throws IOException {
		String fileName = UUID.randomUUID().toString();
		
		File uploadFolder = new File(uploadPath);
		uploadFolder.mkdir();
		
		String filePath = uploardPath + File.separatorChar + fileName;
		
		boFile.transferTo(new File(filePath));
		
		
	}
}
