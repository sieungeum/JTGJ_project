package com.jtgz.jtgzproject.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.board.dao.IBoardDAO;
import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.dto.ComDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.common.vo.PageSearchVO;

@Service
public class BoardService {

	@Autowired
	IBoardDAO dao;
	
	public List<BoardDTO> getBoardList(PageSearchVO search){
		List<BoardDTO> result = dao.getBoardList(search);
		return result;
	}
	
	public int writeBoard(BoardDTO board) {
		int result = dao.writeBoard(board);
		return result;
	}
	
	public BoardDTO getBoard(int boardNo) {
		BoardDTO result = dao.getBoard(boardNo);
		return result;
	}
	
	public int editBoard(BoardDTO board) {
		int result = dao.editBoard(board);
		return result;
	}
	
	public int deleteBoard(int boardNo) {
		int result = dao.deleteBoard(boardNo);
		return result;
	}
	
	public int writeCom(ComDTO com) {
		int result = dao.writeCom(com);
		return result;
	}
	
	public ComDTO getCom(String comNo) {
		ComDTO result = dao.getCom(comNo);
		return result;
	}
	
	public List<ComDTO> getComList(int boardNo){
		List<ComDTO> result = dao.getComList(boardNo);
		return result;
	}
	
	public int delCom(String comNo) {
		int result = dao.delCom(comNo);
		return result;
	}
	
	public int getBoardNo() {
		int result = dao.getBoardNo();
		return result;
	}
	
	public int getBoardCount(PageSearchVO search) {
		int result = dao.getBoardCount(search);
		return result;
	}
	
}
