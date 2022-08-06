package com.kokoa.together.underbar.dto;


public class UnderBarDTO {
	private int bno;
	private int cno;
	private int ubdno;
	private Integer ubdPirce;
	private Integer ubHeart;
	private Integer ubShare;
	private Integer ubDirect;
	private String ubWriter;
	
	@Override
	public String toString() {
		return "UnderBarDTO [bno=" + bno + ", cno=" + cno + ", ubdPirce=" + ubdPirce + ", ubHeart=" + ubHeart
				+ ", ubShare=" + ubShare + ", ubDirect=" + ubDirect + ", ubdno=" + ubdno + ", ubWriter=" + ubWriter
				+ "]";
	}
	
	public int getBno() {return bno;}
	public void setBno(int bno) {this.bno = bno;}
	
	public int getCno() {return cno;}
	public void setCno(int cno) {this.cno = cno;}
	
	public int getUbdno() {return ubdno;}
	public void setUbdno(int ubdno) {this.ubdno = ubdno;}

	
	public Integer getUbdPirce() {return ubdPirce;}
	public void setUbdPirce(int ubdPirce) {this.ubdPirce = ubdPirce;}
	
	public Integer getUbHeart() {return ubHeart;}
	public void setUbHeart(int ubHeart) {this.ubHeart = ubHeart;}
	
	public Integer getUbShare() {return ubShare;}
	public void setUbShare(int ubShare) {this.ubShare = ubShare;}
	
	public Integer getUbDirect() {return ubDirect;}
	public void setUbDirect(int ubDirect) {this.ubDirect = ubDirect;}
	
	
	public String getUbWriter() {return ubWriter;}
	public void setUbWriter(String ubWriter) {this.ubWriter = ubWriter;}
	
	
	
	
}

