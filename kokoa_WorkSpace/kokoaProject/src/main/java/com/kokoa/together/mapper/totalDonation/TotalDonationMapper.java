package com.kokoa.together.mapper.totalDonation;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TotalDonationMapper {
	public int totalfMoney(@Param("bno")int bno,@Param("TotalD")int TotalD);
	
	public int totalUMoney(@Param("bno")int bno,@Param("TotalD")int TotalD);
	
	public List<Integer> TMaDa();
}
