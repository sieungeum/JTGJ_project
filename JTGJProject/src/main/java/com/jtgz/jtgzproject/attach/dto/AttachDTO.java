package com.jtgz.jtgzproject.attach.dto;

public class AttachDTO {
	private int memFileNo;
	private int memNo;
	private String memFileName;
	private String memFileOriginalName;
	private long memFileSize;
	private String  memFileFancySize;
	private String memFileType;
	private String memFilePath;
	
	
	public AttachDTO() {
	}
	
	
	public AttachDTO(int memFileNo, int memNo, String memFileName, String memFileOriginalName, long memFileSize,
			String memFileFancySize, String memFileType, String memFilePath) {
		this.memFileNo = memFileNo;
		this.memNo = memNo;
		this.memFileName = memFileName;
		this.memFileOriginalName = memFileOriginalName;
		this.memFileSize = memFileSize;
		this.memFileFancySize = memFileFancySize;
		this.memFileType = memFileType;
		this.memFilePath = memFilePath;
	}
	
	
	@Override
	public String toString() {
		return "AttachDTO [memFileNo=" + memFileNo + ", memNo=" + memNo + ", memFileName=" + memFileName
				+ ", memFileOriginalName=" + memFileOriginalName + ", memFileSize=" + memFileSize
				+ ", memFileFancySize=" + memFileFancySize + ", memFileType=" + memFileType + ", memFilePath="
				+ memFilePath + "]";
	}
	
	
	public int getMemFileNo() {
		return memFileNo;
	}
	public void setMemFileNo(int memFileNo) {
		this.memFileNo = memFileNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getMemFileName() {
		return memFileName;
	}
	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}
	public String getMemFileOriginalName() {
		return memFileOriginalName;
	}
	public void setMemFileOriginalName(String memFileOriginalName) {
		this.memFileOriginalName = memFileOriginalName;
	}
	public long getMemFileSize() {
		return memFileSize;
	}
	public void setMemFileSize(long memFileSize) {
		this.memFileSize = memFileSize;
	}
	public String getMemFileFancySize() {
		return memFileFancySize;
	}
	public void setMemFileFancySize(String memFileFancySize) {
		this.memFileFancySize = memFileFancySize;
	}
	public String getMemFileType() {
		return memFileType;
	}
	public void setMemFileType(String memFileType) {
		this.memFileType = memFileType;
	}
	public String getMemFilePath() {
		return memFilePath;
	}
	public void setMemFilePath(String memFilePath) {
		this.memFilePath = memFilePath;
	}
	
	
	
	
	
	
	
}
