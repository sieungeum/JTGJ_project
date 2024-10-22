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
	
	// 모든 공지사항 리스트로 가져오기
	public List<NoticeDTO> noticeSelect(String adminYn){
		
		List<NoticeDTO> result = dao.noticeSelect(adminYn);
		
		return result;
	}
	
	// 공지사항 자세히 보기
	public NoticeDTO getNotice(int notiNo) {
		NoticeDTO result = dao.getNotice(notiNo);
		
		return result;
	}
	
	// 공지사항 작성
	public int writeNotice(NoticeDTO notice) {
		int result = dao.writeNotice(notice);
		
		return result;
	}
	
	// 공지사항 수정
	public int editNotice(NoticeDTO notice) {
		int result = dao.editNotice(notice);
		
		return result;
	}
	
	public int deleteNotice(int notiNo) {
		int result = dao.deleteNotice(notiNo);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
