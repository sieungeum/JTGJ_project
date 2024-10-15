package com.jtgz.jtgzproject.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.board.dao.IBoardDAO;
import com.jtgz.jtgzproject.board.dto.BoardDTO;

@Service
public class BoardService {

	@Autowired
	IBoardDAO dao;
	
	public List<BoardDTO> getBoardList(){
		List<BoardDTO> result = dao.getBoardList();
		return result;
	}
	
}
