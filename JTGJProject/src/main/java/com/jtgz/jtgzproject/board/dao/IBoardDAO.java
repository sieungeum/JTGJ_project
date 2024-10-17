package com.jtgz.jtgzproject.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.board.dto.BoardDTO;

@Mapper
public interface IBoardDAO {
	List<BoardDTO> getBoardList();
	int writeBoard(BoardDTO board);
	BoardDTO getBoard(int boardNo);
}
