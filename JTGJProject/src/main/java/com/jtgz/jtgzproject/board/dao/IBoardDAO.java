package com.jtgz.jtgzproject.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.dto.ComDTO;
import com.jtgz.jtgzproject.common.dto.SearchDTO;

@Mapper
public interface IBoardDAO {
	List<BoardDTO> getBoardList(SearchDTO search);
	int writeBoard(BoardDTO board);
	BoardDTO getBoard(int boardNo);
	int editBoard(BoardDTO board);
	int deleteBoard(int boardNo);
	
	int writeCom(ComDTO comment);
	ComDTO getCom(String comNo);
	List<ComDTO> getComList(int boardNo);
	int delCom(String comNo);
}
