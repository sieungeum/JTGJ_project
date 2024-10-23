package com.jtgz.jtgzproject.board.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jtgz.jtgzproject.attach.dto.AttachDTO;
import com.jtgz.jtgzproject.attach.service.AttachService;
import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.dto.ComDTO;
import com.jtgz.jtgzproject.board.service.BoardService;
import com.jtgz.jtgzproject.common.dto.SearchDTO;
import com.jtgz.jtgzproject.common.util.FileUploadUtil;
import com.jtgz.jtgzproject.common.vo.PageSearchVO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;
import com.jtgz.jtgzproject.notice.dto.NoticeDTO;
import com.jtgz.jtgzproject.notice.service.NoticeService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	AttachService attachService;
	
	@Autowired
	FileUploadUtil fileUploadUtil;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/boardView")
	public String boardView(HttpSession session, Model model, PageSearchVO search) {

		// 페이징 부분
		int totalRowCount = boardService.getBoardCount(search);
		search.setTotalRowCount(totalRowCount);
		search.pageSetting();
		
		List<BoardDTO> boardList = boardService.getBoardList(search);

		// sjm
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		String admin = "";
		try {
			admin = login.getMemAdminYn();
		} catch (Exception e) {
			// TODO: handle exception
			admin = "N";
		}
		
		List<NoticeDTO> notice = noticeService.noticeSelect(admin);
		
		model.addAttribute("notice", notice);
		// sjm
		
		model.addAttribute("boardList", boardList);
		
		model.addAttribute("pageSearch", search);
		// LHS
		
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
	public String boardWriteDo(BoardDTO board, HttpSession session, MultipartFile[] boFile) {
		
		System.out.println(board);
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String memId = login.getMemId();
		board.setMemId(memId);
		
		int boardNo = boardService.getBoardNo();
		
		if(boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
			System.out.println("파일 개수: " + boFile.length);
			try {
				List<AttachDTO> attachList = fileUploadUtil.getAttachListByMultiparts(boFile);
				if(!attachList.isEmpty()) {
					for(AttachDTO attach : attachList) {
						attach.setBoardNo(boardNo);
						attachService.insertAttach(attach);
					}
				}
			}catch(IOException e) {
				e.printStackTrace();
				System.out.println("첨부파일 업로드 중 문제 발생");
				return "error/errorPath500";
			}
		}
		
		boardService.writeBoard(board);
		
		return "redirect:/boardView";
	}
	
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int boardNo, Model model) {
		System.out.println("클릭한 게시글의 번호:" + boardNo);
		
		BoardDTO board = boardService.getBoard(boardNo);
		
		List<ComDTO> comList = boardService.getComList(boardNo);
		
		List<AttachDTO> attachList = attachService.getAttachList(boardNo);
		
		model.addAttribute("board", board);
		model.addAttribute("comList", comList);
		model.addAttribute("attachList", attachList);
		
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
	
	@ResponseBody
	@PostMapping("/writeComDo")
	public ComDTO writeComDo(ComDTO com) {
		System.out.println(com);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String uniqueId = sdf.format(date);
		for(int i = 0; i < 3; i++) {
			uniqueId += (int)(Math.random() * 10);
		}
		
		com.setComNo(uniqueId);
		
		boardService.writeCom(com);
		
		ComDTO result = boardService.getCom(uniqueId);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/delComDo")
	public String delComDo(@RequestBody ComDTO com) {
		System.out.println(com);
		String result = "fail";
		
		int cnt = boardService.delCom(com.getComNo());
		
		if(cnt > 0) {
			result = "success";
		}
		return result;
	}
	
}
