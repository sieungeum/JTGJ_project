package com.jtgz.jtgzproject.notice.dto;

public class NoticeDTO {
	String notiTitle;
	int notiNo;
	String notiContent;
	String notiDate;
	String memId;
	String memName;
	String notiDelYn;
	
	
	public NoticeDTO() {
		super();
	}


	public NoticeDTO(String notiTitle, int notiNo, String notiContent, String notiDate, String memId, String memName,
			String notiDelYn) {
		super();
		this.notiTitle = notiTitle;
		this.notiNo = notiNo;
		this.notiContent = notiContent;
		this.notiDate = notiDate;
		this.memId = memId;
		this.memName = memName;
		this.notiDelYn = notiDelYn;
	}


	@Override
	public String toString() {
		return "NoticeDTO [notiTitle=" + notiTitle + ", notiNo=" + notiNo + ", notiContent=" + notiContent
				+ ", notiDate=" + notiDate + ", memId=" + memId + ", memName=" + memName + ", notiDelYn=" + notiDelYn
				+ "]";
	}


	public String getNotiTitle() {
		return notiTitle;
	}


	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}


	public int getNotiNo() {
		return notiNo;
	}


	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}


	public String getNotiContent() {
		return notiContent;
	}


	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}


	public String getNotiDate() {
		return notiDate;
	}


	public void setNotiDate(String notiDate) {
		this.notiDate = notiDate;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getNotiDelYn() {
		return notiDelYn;
	}


	public void setNotiDelYn(String notiDelYn) {
		this.notiDelYn = notiDelYn;
	}
	
	
}
