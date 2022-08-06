package com.kokoa.together.totalDonation.dto;

public class TotalDonationDTO {
	private int bno;
	private int directDonation;
	private int participateDonation;
	private int cheerDonation;
	private int shareDonation;
	private int commentDonation;
	private int totalDonation;
	
	@Override
	public String toString() {
		return "TotalDonationDTO [bno=" + bno + ", directDonation=" + directDonation + ", participateDonation="
				+ participateDonation + ", cheerDonation=" + cheerDonation + ", shareDonation=" + shareDonation
				+ ", commentDonation=" + commentDonation + ", totalDonation=" + totalDonation + "]";
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getDirectDonation() {
		return directDonation;
	}
	public void setDirectDonation(int directDonation) {
		this.directDonation = directDonation;
	}
	public int getParticipateDonation() {
		return participateDonation;
	}
	public void setParticipateDonation(int participateDonation) {
		this.participateDonation = participateDonation;
	}
	public int getCheerDonation() {
		return cheerDonation;
	}
	public void setCheerDonation(int cheerDonation) {
		this.cheerDonation = cheerDonation;
	}
	public int getShareDonation() {
		return shareDonation;
	}
	public void setShareDonation(int shareDonation) {
		this.shareDonation = shareDonation;
	}
	public int getCommentDonation() {
		return commentDonation;
	}
	public void setCommentDonation(int commentDonation) {
		this.commentDonation = commentDonation;
	}
	public int getTotalDonation() {
		return totalDonation;
	}
	public void setTotalDonation(int totalDonation) {
		this.totalDonation = totalDonation;
	}
}
