package com.kokoa.together.heart.dto;


public class HeartDTO {
	
	// pk값으로 쓸 번호
	private long hno;
	// 게시글 번호
	private long bno;
	// 회원 번호
	private String heartWriter;
	// 좋아요
	public int heart;
	
	private int cno;
	
	@Override
	public String toString() {
		return "HeartDTO [hno=" + hno + ", bno=" + bno + ", heartWriter=" + heartWriter + ", heart=" + heart + ", cno=" + cno + "]";
	}
	public int getCno() {return cno;}
	public void setCno(int cno) {this.cno = cno;}
	
	public long getHno() {return hno;}
	public void setHno(long hno) {this.hno = hno;}
	
	public long getBno() {return bno;}
	public void setBno(long bno) {this.bno = bno;}
	
	
	
	public String getHeartWriter() {
		return heartWriter;
	}
	public void setHeartWriter(String heartWriter) {
		this.heartWriter = heartWriter;
	}
	public int getHeart() {return heart;}
	public void setHeart(int heart) {this.heart = heart;}

}

