package com.jtgz.jtgzproject.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardView")
	public String boardView(Model model) {

		List<BoardDTO> boardList = boardService.getBoardList();
		
		model.addAttribute("boardList", boardList);
		
		return "board/boardView";
	}
}
