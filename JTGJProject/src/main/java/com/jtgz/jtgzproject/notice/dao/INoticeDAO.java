package com.jtgz.jtgzproject.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {
	
	// �������� �ҷ�����(SELECT)
	List<NoticeDTO> noticeSelect(String adminYn);
	
	// �������� �ڼ��� ����
	NoticeDTO getNotice(int notiNo);
	
	// �������� �ۼ�
	int writeNotice(NoticeDTO notice);
	
	// �������� ����
	int editNotice(NoticeDTO notice);
	
	// �������� ����
	int deleteNotice(int notiNo);
}
