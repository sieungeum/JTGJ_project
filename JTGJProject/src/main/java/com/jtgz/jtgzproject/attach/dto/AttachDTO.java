package com.jtgz.jtgzproject.attach.dto;

public class AttachDTO {
	private int boardFileNo;
	private int boardNo;
	private String boardFileName;
	private String boardFileOriginalName;
	private long boardFileSize;
	private String  boardFileFancySize;
	private String boardFileType;
	private String boardFilePath;
	
	
	public AttachDTO() {
	}
	
	
	public AttachDTO(int boardFileNo, int boardNo, String boardFileName, String boardFileOriginalName,
			long boardFileSize, String boardFileFancySize, String boardFileType, String boardFilePath) {
		this.boardFileNo = boardFileNo;
		this.boardNo = boardNo;
		this.boardFileName = boardFileName;
		this.boardFileOriginalName = boardFileOriginalName;
		this.boardFileSize = boardFileSize;
		this.boardFileFancySize = boardFileFancySize;
		this.boardFileType = boardFileType;
		this.boardFilePath = boardFilePath;
	}
	
	
	@Override
	public String toString() {
		return "AttachDTO [boardFileNo=" + boardFileNo + ", boardNo=" + boardNo + ", boardFileName=" + boardFileName
				+ ", boardFileOriginalName=" + boardFileOriginalName + ", boardFileSize=" + boardFileSize
				+ ", boardFileFancySize=" + boardFileFancySize + ", boardFileType=" + boardFileType + ", boardFilePath="
				+ boardFilePath + "]";
	}
	
	
	public int getBoardFileNo() {
		return boardFileNo;
	}
	public void setBoardFileNo(int boardFileNo) {
		this.boardFileNo = boardFileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFileOriginalName() {
		return boardFileOriginalName;
	}
	public void setBoardFileOriginalName(String boardFileOriginalName) {
		this.boardFileOriginalName = boardFileOriginalName;
	}
	public long getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(long boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public String getBoardFileFancySize() {
		return boardFileFancySize;
	}
	public void setBoardFileFancySize(String boardFileFancySize) {
		this.boardFileFancySize = boardFileFancySize;
	}
	public String getBoardFileType() {
		return boardFileType;
	}
	public void setBoardFileType(String boardFileType) {
		this.boardFileType = boardFileType;
	}
	public String getBoardFilePath() {
		return boardFilePath;
	}
	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}
	
	
	
	
	
	
	
	
}
