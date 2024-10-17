package com.jtgz.jtgzproject.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.service.BoardService;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardView")
	public String boardView(Model model, SearchDTO search) {

		List<BoardDTO> boardList = boardService.getBoardList(search);
		
		model.addAttribute("boardList", boardList);
		
		return "board/boardView";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView(HttpSession session) {

		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "board/boardWriteView";
	}
	
	
	@PostMapping("/boardWriteDo")
	public String boardWriteDo(BoardDTO board, HttpSession session) {
		
		System.out.println(board);
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String memId = login.getMemId();
		board.setMemId(memId);
		
		boardService.writeBoard(board);
		
		return "redirect:/boardView";
	}
	
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) {
		System.out.println("클릭한 게시글의 번호:" + boardNo);
		
		BoardDTO board = boardService.getBoard(boardNo);
		
		model.addAttribute("board", board);
		
		return "board/boardDetailView";
	}
	
	@RequestMapping(value="/boardEditView", method=RequestMethod.POST)
	public String boardEditView(int boardNo, Model model){
		
		BoardDTO board = boardService.getBoard(boardNo);
		
		model.addAttribute("board", board);
		
		return "board/boardEditView";
	}
	
	@PostMapping("/boardEditDo")
	public String boardEditDo(BoardDTO board) {
		
		boardService.editBoard(board);
		
		return "redirect:/boardView";
	}
	
	@PostMapping("/boardDeleteDo")
	public String boardDeleteDo(int boardNo) {
		
		boardService.deleteBoard(boardNo);
		
		return "redirect:/boardView";
	}
}
