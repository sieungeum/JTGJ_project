package com.jtgz.jtgzproject.notice.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jtgz.jtgzproject.attach.dto.AttachDTO;
import com.jtgz.jtgzproject.board.dto.BoardDTO;
import com.jtgz.jtgzproject.board.dto.ComDTO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;
import com.jtgz.jtgzproject.notice.dto.NoticeDTO;
import com.jtgz.jtgzproject.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/noticeTestsView")
	public String noticeTestsView(Model model, HttpSession session) {
		System.out.println("- noticeTestsView - ");
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
	
		String admin = "";
		try {
			admin = login.getMemAdminYn();
		} catch (Exception e) {
			// TODO: handle exception
			admin = "N";
		}
		
		List<NoticeDTO> notice = noticeService.noticeSelect(admin);
		
		System.out.println(notice);
		model.addAttribute("notice", notice);
		
		return "board/boardView";
	}
	
	@RequestMapping("/noticeDetailView")
	public String noticeDetailView(Model model, int notiNo) {
		System.out.println(" - noticeDetailView - ");
		System.out.println("클릭한 게시글의 번호:" + notiNo);
		
		NoticeDTO notice = noticeService.getNotice(notiNo);
		
		model.addAttribute("notice", notice);
		
		System.out.println(notice);
		
		return "board/noticeDetailTest";
	}
	
	@RequestMapping("/noticeWriteView")
	public String noticeWriteView(HttpSession session) {
		System.out.println(" - noticeWriteViewTest - ");

		if(session.getAttribute("login") == null) {
			return "redirect:/loginView";
		}
		
		return "board/noticeWrite";
	}
	
	@PostMapping("/noticeWriteDo")
	public String noticeWriteDo(NoticeDTO notice, HttpSession session) {
		System.out.println(" - noticeWriteDo - ");
		
		System.out.println(notice);
		
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		String memId = login.getMemId();
		notice.setMemId(memId);
		
		System.out.println(notice);
		
		noticeService.writeNotice(notice);
		
		return "redirect:/boardView";
	}
	
	@RequestMapping(value="/noticeEditView", method=RequestMethod.POST)
	public String noticeEditView(int notiNo, Model model){
		
		NoticeDTO notice = noticeService.getNotice(notiNo);
		
		model.addAttribute("notice", notice);
		
		return "board/noticeEditView";
	}
	
	@PostMapping("/noticeEditDo")
	public String noticeEditDo(NoticeDTO notice) {
		
		noticeService.editNotice(notice);
		
		return "redirect:/boardView";
	}
	
	@PostMapping("/noticeDeleteDo")
	public String noticeDeleteDo(int notiNo) {
		
		noticeService.deleteNotice(notiNo);
		
		return "redirect:/boardView";
	}
	
	
}
