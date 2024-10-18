package com.jtgz.jtgzproject.mapTest.dto;

public class MapTestDTO {
    private String purposeKindName;       	/* 건물 용도(주거용, 주거용 이외) */ 
    private String bldNm;                  	/* 건묾명 */
    private String grdName;                	/* 에너지 효율 등급 */
    private double wOneEnergyRequire;       /* 1차 에너지 소요량 */
    private String crtifIsuDd;              /* 인증발급일자 */
    private String locAddr;               	/* 건물 주소 */
    private String zeb;                 	/* ZEB 유무 */
    private String delYn;					/* 삭제 유무 */
    
    /* 등급이 1++등급 이상일 경우 ZEB 선정 기준에 적합하기 위해 설치해야할 태양열 패널 갯수 */
    /* 아닐경우 전부 0.0으로 저장 */
    private double mmThousP;                  	/* 면적이 1000m^2일 경우  */
    private double mmTenThousP;                  /* 면적이 10000m^2일 경우 */
    private double mmFiftyThousP;                 	/* 면적이 50000m^2일 경우 */
    
    
	public MapTestDTO() {
	}


	public MapTestDTO(String purposeKindName, String bldNm, String grdName, double wOneEnergyRequire, String crtifIsuDd,
			String locAddr, String zeb, String delYn, double mmThousP, double mmTenThousP, double mmFiftyThousP) {
		super();
		this.purposeKindName = purposeKindName;
		this.bldNm = bldNm;
		this.grdName = grdName;
		this.wOneEnergyRequire = wOneEnergyRequire;
		this.crtifIsuDd = crtifIsuDd;
		this.locAddr = locAddr;
		this.zeb = zeb;
		this.delYn = delYn;
		this.mmThousP = mmThousP;
		this.mmTenThousP = mmTenThousP;
		this.mmFiftyThousP = mmFiftyThousP;
	}


	@Override
	public String toString() {
		return "MapTestDTO [purposeKindName=" + purposeKindName + ", bldNm=" + bldNm + ", grdName=" + grdName
				+ ", wOneEnergyRequire=" + wOneEnergyRequire + ", crtifIsuDd=" + crtifIsuDd + ", locAddr=" + locAddr
				+ ", zeb=" + zeb + ", delYn=" + delYn + ", mmThousP=" + mmThousP + ", mmTenThousP=" + mmTenThousP
				+ ", mmFiftyThousP=" + mmFiftyThousP + "]";
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


	public String getDelYn() {
		return delYn;
	}


	public void setDelYn(String delYn) {
		this.delYn = delYn;
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
	
	
}
