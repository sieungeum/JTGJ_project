package com.jtgz.jtgzproject.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jtgz.jtgzproject.member.dao.IMemberDAO;
import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	IMemberDAO dao;
	
	// 회원가입 메소드
	public int registMember(MemberDTO member) {
		int result = dao.registMember(member);
		return result;
	}
	
	// 로그인 메소드
	public MemberDTO loginMember(MemberDTO member) {
		MemberDTO result = dao.loginMember(member);
		return result;
	}
	
	// 회원 수정
	public int editMember(MemberDTO member) {
		int result = dao.editMember(member);
		
		return result;
	}
	
	
	// sjm 회원 수 구하기
	public int countMemeber() {
		int result = dao.countMemeber();
		
		return result;
	}
}
