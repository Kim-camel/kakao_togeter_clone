package com.kokoa.together.comment.dto;

import java.util.Date;

public class CommentDTO {
	private int cno;
	private int bno;
	private String writer;
	private String content;
	private Date commentDate;
	private int cnt;
	private int reHeart;
	private int heartTotal;
	private String money;

	
	@Override
	public String toString() {
		return "CommentDTO [cno=" + cno + ", bno=" + bno + ", writer=" + writer + ", content=" + content
				+ ", commentDate=" + commentDate + ", cnt=" + cnt + ", reHeart=" + reHeart + ", heartTotal="
				+ heartTotal + ", money=" + money + "]";
	}
	
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public int getReHeart() {
		return reHeart;
	}
	public void setReHeart(int reHeart) {
		this.reHeart = reHeart;
	}
	public int getHeartTotal() {
		return heartTotal;
	}
	public void setHeartTotal(int heartTotal) {
		this.heartTotal = heartTotal;
	}
	public int getCnt() {return cnt;}
	public void setCnt(int cnt) {this.cnt = cnt;}
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}

