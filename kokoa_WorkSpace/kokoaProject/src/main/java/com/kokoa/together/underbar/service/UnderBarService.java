package com.kokoa.together.underbar.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.totalDonation.dto.TotalDonationDTO;
import com.kokoa.together.underbar.dto.UnderBarDTO;



public interface UnderBarService {
	public int ubform(@Param("bno") int bno, @Param("ubWriter") String ubWriter,@Param("check")int check) throws Exception;
	public List<UnderBarDTO> ubhCheck(@Param("bno")int bno);
	public Map<String, Integer> ubCount(@Param("bno")int bno);
	public TotalDonationDTO participateDonation(@Param("bno") int bno);
}

