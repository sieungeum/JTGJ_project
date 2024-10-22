package com.jtgz.jtgzproject.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {
	
	// 공지사항 불러오기(SELECT)
	List<NoticeDTO> noticeSelect(String adminYn);
	
	// 공지사항 자세히 보기
	NoticeDTO getNotice(int notiNo);
	
	// 공지사항 작성
	int writeNotice(NoticeDTO notice);
	
	// 공지사항 수정
	int editNotice(NoticeDTO notice);
	
	// 공지사항 삭제
	int deleteNotice(int notiNo);
}
