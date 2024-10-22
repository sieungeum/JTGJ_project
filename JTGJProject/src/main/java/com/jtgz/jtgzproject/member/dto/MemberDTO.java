package com.jtgz.jtgzproject.member.dto;

public class MemberDTO {
	private String memId; 		// ȸ�� ���̵�
	private String memPw;		// ȸ�� ��� ��ȣ
	private String memName;		// ȸ�� �̸�
	private String memEmail;	// ȸ�� �̸���
	private String memDate;		// ȸ�� ������
	private String memCerYn;	// ȸ�� Ż�� ����
	private String memAdminYn;	// ���� ����
	
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
