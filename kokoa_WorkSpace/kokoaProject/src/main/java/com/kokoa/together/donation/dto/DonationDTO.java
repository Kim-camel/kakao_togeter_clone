package com.kokoa.together.donation.dto;

public class DonationDTO {
	private int dNo;
	private int dSep;
	private String dsDate;
	private String deDate;
	private String dTitle;
	private String dContent;
	private String dCop;
	private String dtImg;
	private String tdTarget;
	
	public String getTdTarget() {
		return tdTarget;
	}
	public void setTdTarget(String tdTarget) {
		this.tdTarget = tdTarget;
	}
	public int getdNo() {
		return dNo;
	}
	public void setdNo(int dNo) {
		this.dNo = dNo;
	}
	public int getdSep() {
		return dSep;
	}
	public void setdSep(int dSep) {
		this.dSep = dSep;
	}
	public String getDsDate() {
		return dsDate;
	}
	public void setDsDate(String dsDate) {
		this.dsDate = dsDate;
	}
	public String getDeDate() {
		return deDate;
	}
	public void setDeDate(String deDate) {
		this.deDate = deDate;
	}
	public String getdTitle() {
		return dTitle;
	}
	public void setdTitle(String dTitle) {
		this.dTitle = dTitle;
	}
	public String getdContent() {
		return dContent;
	}
	public void setdContent(String dContent) {
		this.dContent = dContent;
	}
	public String getdCop() {
		return dCop;
	}
	public void setdCop(String dCop) {
		this.dCop = dCop;
	}
	public String getDtImg() {
		return dtImg;
	}
	public void setDtImg(String dtImg) {
		this.dtImg = dtImg;
	}
	
}

