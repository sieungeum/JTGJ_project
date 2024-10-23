package com.jtgz.jtgzproject.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jtgz.jtgzproject.member.dto.MemberDTO;

@Mapper
public interface IMemberDAO {
	
	int registMember(MemberDTO member);
	
	MemberDTO loginMember(MemberDTO member);
	
	// 회원 수정
	int editMember(MemberDTO member);

}
