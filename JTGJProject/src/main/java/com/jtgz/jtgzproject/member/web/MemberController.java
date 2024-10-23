package com.jtgz.jtgzproject.member.web;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jtgz.jtgzproject.member.dto.MemberDTO;
import com.jtgz.jtgzproject.member.service.MemberService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	@PostMapping("/registDo")
	public String registDo(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String date = request.getParameter("date");
		String ceryn = request.getParameter("ceryn");
		String adminyn = request.getParameter("adminyn");
		
		System.out.println("id = " + id);
		System.out.println("password = " + password);
		System.out.println("name = " + name);
		System.out.println("email = " + email);
		
		MemberDTO member = new MemberDTO(id, password, name, email, date, ceryn, adminyn);
		
		try {
			memberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return "errorPage";
		}
		
		return "redirect:/loginView";
		
	}
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@PostMapping("/loginDo")
	public String loginDo(MemberDTO member, HttpSession session) {
		System.out.println(member);
		
		System.out.println("id = " + member.getMemId());
		System.out.println("password = " + member.getMemPw());
		MemberDTO login = memberService.loginMember(member);
		
		System.out.println(login);
		
		session.setAttribute("login", login);
		
		return "redirect:/home";
		
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		
		session.invalidate();
		return "redirect:/home";
	}
	
	// 회원 수정 페이지로 이동
	@RequestMapping("/editView")
	public String editView() {
		System.out.println("- editView - ");
		
		return "member/editView";
	}
	
	// 회원 수정
	@PostMapping("/editDo")
	public String editDo(MemberDTO member, HttpSession session) {
		System.out.println(" - editDo - ");
		
		memberService.editMember(member); // 회원 수정
		
		// session 최신화
		MemberDTO login = memberService.loginMember(member);
		session.setAttribute("login", login);
		
		return "redirect:/home";
	}
	
}
