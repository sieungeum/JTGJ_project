package com.jtgz.jtgzproject.admin.dto;

public class AdminDTO {
	private String purposeKindName; // 건물 용도
	private String bldNm; 	// 건물명
	private String grdName; // 에너지 효율 등급
	private double wOneEnergyRequire;	// 1차 에너지 소요량
	private String crtifIsuDd;	// 인증 발급 일자 
	private String locAddr;	// 건물 주소
	private String zeb;	// ZEB 유무 
	private double mmThousP;	// 면적이 1000m^2일 경우
	private double mmTenThousP; // 면적이 10000m^2일 경우
	private double mmFiftyThousP;	// 면적이 50000m^2일 경우
	private String del_Yn;	// 삭제 유무 
	
	public AdminDTO() {
		super();
	}

	public AdminDTO(String purposeKindName, String bldNm, String grdName, double wOneEnergyRequire, String crtifIsuDd,
			String locAddr, String zeb, double mmThousP, double mmTenThousP, double mmFiftyThousP, String del_Yn) {
		super();
		this.purposeKindName = purposeKindName;
		this.bldNm = bldNm;
		this.grdName = grdName;
		this.wOneEnergyRequire = wOneEnergyRequire;
		this.crtifIsuDd = crtifIsuDd;
		this.locAddr = locAddr;
		this.zeb = zeb;
		this.mmThousP = mmThousP;
		this.mmTenThousP = mmTenThousP;
		this.mmFiftyThousP = mmFiftyThousP;
		this.del_Yn = del_Yn;
	}

	public String getPurposeKindName() {
		return purposeKindName;
	}

	public void setPurposeKindName(String purposeKindName) {
		this.purposeKindName = purposeKindName;
	}

	public String getBldNm() {
		return bldNm;
	}

	public void setBldNm(String bldNm) {
		this.bldNm = bldNm;
	}

	public String getGrdName() {
		return grdName;
	}

	public void setGrdName(String grdName) {
		this.grdName = grdName;
	}

	public double getwOneEnergyRequire() {
		return wOneEnergyRequire;
	}

	public void setwOneEnergyRequire(double wOneEnergyRequire) {
		this.wOneEnergyRequire = wOneEnergyRequire;
	}

	public String getCrtifIsuDd() {
		return crtifIsuDd;
	}

	public void setCrtifIsuDd(String crtifIsuDd) {
		this.crtifIsuDd = crtifIsuDd;
	}

	public String getLocAddr() {
		return locAddr;
	}

	public void setLocAddr(String locAddr) {
		this.locAddr = locAddr;
	}

	public String getZeb() {
		return zeb;
	}

	public void setZeb(String zeb) {
		this.zeb = zeb;
	}

	public double getMmThousP() {
		return mmThousP;
	}

	public void setMmThousP(double mmThousP) {
		this.mmThousP = mmThousP;
	}

	public double getMmTenThousP() {
		return mmTenThousP;
	}

	public void setMmTenThousP(double mmTenThousP) {
		this.mmTenThousP = mmTenThousP;
	}

	public double getMmFiftyThousP() {
		return mmFiftyThousP;
	}

	public void setMmFiftyThousP(double mmFiftyThousP) {
		this.mmFiftyThousP = mmFiftyThousP;
	}

	public String getDel_Yn() {
		return del_Yn;
	}

	public void setDel_Yn(String del_Yn) {
		this.del_Yn = del_Yn;
	}

	@Override
	public String toString() {
		return "AdminDTO [purposeKindName=" + purposeKindName + ", bldNm=" + bldNm + ", grdName=" + grdName
				+ ", wOneEnergyRequire=" + wOneEnergyRequire + ", crtifIsuDd=" + crtifIsuDd + ", locAddr=" + locAddr
				+ ", zeb=" + zeb + ", mmThousP=" + mmThousP + ", mmTenThousP=" + mmTenThousP + ", mmFiftyThousP="
				+ mmFiftyThousP + ", del_Yn=" + del_Yn + "]";
	}
	
}


