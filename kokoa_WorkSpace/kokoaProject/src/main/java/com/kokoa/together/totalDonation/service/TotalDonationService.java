package com.kokoa.together.totalDonation.service;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
@Service
public interface TotalDonationService {
	
	public void totalfMoney(@Param("bno")int bno,@Param("TotalD")int TotalD);
	
	public int TMaDA();
	
}
