package com.jtgz.jtgzproject.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.notice.dao.INoticeDAO;
import com.jtgz.jtgzproject.notice.dto.NoticeDTO;

@Service
public class NoticeService {
	
	@Autowired
	INoticeDAO dao;
	
	// ��� �������� ����Ʈ�� ��������
	public List<NoticeDTO> noticeSelect(String adminYn){
		
		List<NoticeDTO> result = dao.noticeSelect(adminYn);
		
		return result;
	}
	
	// �������� �ڼ��� ����
	public NoticeDTO getNotice(int notiNo) {
		NoticeDTO result = dao.getNotice(notiNo);
		
		return result;
	}
	
	// �������� �ۼ�
	public int writeNotice(NoticeDTO notice) {
		int result = dao.writeNotice(notice);
		
		return result;
	}
	
	// �������� ����
	public int editNotice(NoticeDTO notice) {
		int result = dao.editNotice(notice);
		
		return result;
	}
	
	public int deleteNotice(int notiNo) {
		int result = dao.deleteNotice(notiNo);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
