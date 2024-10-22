package com.jtgz.jtgzproject.member.dto;

public class MemberDTO {
	private String memId; 		// 회원 아이디
	private String memPw;		// 회원 비밀 번호
	private String memName;		// 회원 이름
	private String memEmail;	// 회원 이메일
	private String memDate;		// 회원 가입일
	private String memCerYn;	// 회원 탈퇴 여부
	private String memAdminYn;	// 어드민 권한
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String memId, String memPw, String memName, String memEmail, String memDate, String memCerYn,
			String memAdminYn) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memEmail = memEmail;
		this.memDate = memDate;
		this.memCerYn = memCerYn;
		this.memAdminYn = memAdminYn;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemDate() {
		return memDate;
	}

	public void setMemDate(String memDate) {
		this.memDate = memDate;
	}

	public String getMemCerYn() {
		return memCerYn;
	}

	public void setMemCerYn(String memCerYn) {
		this.memCerYn = memCerYn;
	}

	public String getMemAdminYn() {
		return memAdminYn;
	}

	public void setMemAdminYn(String memAdminYn) {
		this.memAdminYn = memAdminYn;
	}

	@Override
	public String toString() {
		return "MemberDTO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memEmail=" + memEmail
				+ ", memDate=" + memDate + ", memCerYn=" + memCerYn + ", memAdminYn=" + memAdminYn + "]";
	}
	
	
}
