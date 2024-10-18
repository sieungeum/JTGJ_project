package com.jtgz.jtgzproject.board.dto;

public class ComDTO {
	private String comContent;
	private String comNo;
	private String comDate;
	private String memName;
	private String memId;
	private String comDelYn;
	private int boardNo;
	
	
	public ComDTO() {
	}
	
	
	public ComDTO(String comContent, String comNo, String comDate, String memName, String memId, String comDelYn,
			int boardNo) {
		this.comContent = comContent;
		this.comNo = comNo;
		this.comDate = comDate;
		this.memName = memName;
		this.memId = memId;
		this.comDelYn = comDelYn;
		this.boardNo = boardNo;
	}
	
	
	@Override
	public String toString() {
		return "ReplyDTO [comContent=" + comContent + ", comNo=" + comNo + ", comDate=" + comDate + ", memName="
				+ memName + ", memId=" + memId + ", comDelYn=" + comDelYn + ", boardNo=" + boardNo + "]";
	}
	
	
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public String getComNo() {
		return comNo;
	}
	public void setComNo(String comNo) {
		this.comNo = comNo;
	}
	public String getComDate() {
		return comDate;
	}
	public void setComDate(String comDate) {
		this.comDate = comDate;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getComDelYn() {
		return comDelYn;
	}
	public void setComDelYn(String comDelYn) {
		this.comDelYn = comDelYn;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
	
}
