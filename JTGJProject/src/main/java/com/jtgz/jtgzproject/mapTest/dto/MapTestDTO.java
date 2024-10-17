package com.jtgz.jtgzproject.mapTest.dto;

public class MapTestDTO {
    private String purposeKindName;       	/* �ǹ� �뵵(�ְſ�, �ְſ� �̿�) */ 
    private String bldNm;                  	/* �ǹ��� */
    private String grdName;                	/* ������ ȿ�� ��� */
    private double wOneEnergyRequire;       /* 1�� ������ �ҿ䷮ */
    private String crtifIsuDd;              /* �����߱����� */
    private String locAddr;               	/* �ǹ� �ּ� */
    private String zeb;                 	/* ZEB ���� */
    private String delYn;					/* ���� ���� */
    
    /* ����� 1++��� �̻��� ��� ZEB ���� ���ؿ� �����ϱ� ���� ��ġ�ؾ��� �¾翭 �г� ���� */
    /* �ƴҰ�� ���� 0.0���� ���� */
    private double mmThousP;                  	/* ������ 1000m^2�� ���  */
    private double mmTenThousP;                  /* ������ 10000m^2�� ��� */
    private double mmFiftyThousP;                 	/* ������ 50000m^2�� ��� */
    
    
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
