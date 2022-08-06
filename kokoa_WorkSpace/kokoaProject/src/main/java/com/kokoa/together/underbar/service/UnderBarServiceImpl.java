package com.kokoa.together.underbar.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kokoa.together.mapper.underbar.UnderBarMapper;
import com.kokoa.together.totalDonation.dto.TotalDonationDTO;
import com.kokoa.together.underbar.dto.UnderBarDTO;

@Service
public class UnderBarServiceImpl implements UnderBarService {
@Autowired 
UnderBarMapper ubm;

@Override
public int ubform(@Param("bno") int bno, @Param("ubWriter") String ubWriter,@Param("check")int check) throws Exception {
	Integer result=0;
	
	// check 1 == heart
	// check 2 == share
	// check 3 == main
	if(ubm.ubform(bno,ubWriter,check)==null){
		ubm.ubStart(bno,ubWriter);
	}
//	ubm.ubform(bno,ubWriter,check);
//	check 에 맞는 select문 결과 1 or 0 이  담김
	
	if(ubm.ubform(bno,ubWriter,check)==0) {
		result=ubm.ubinsert(bno,ubWriter,check);
	}else if(ubm.ubform(bno,ubWriter, check)==1) {
		result=0;
	}
	
	
	return result;
}

@Override
public List<UnderBarDTO> ubhCheck(@Param("bno")int bno) {
	List<UnderBarDTO> ubhCheck=ubm.ubhCheck(bno);
	return ubhCheck;
}

@Override
public Map<String, Integer> ubCount(@Param("bno")int bno) {
	Map<String, Integer> ubCount= new HashMap<String, Integer>();	
	
	ubCount.put("hc", ubm.ubhCount(bno));
	ubCount.put("sc", ubm.ubsCount(bno));
	return ubCount;
}

@Override
public TotalDonationDTO participateDonation(@Param("bno") int bno) {
	TotalDonationDTO dto= new TotalDonationDTO();
	Integer ubcd= ubm.ubhCount(bno);
	Integer ubsd= ubm.ubsCount(bno);
	dto.setCheerDonation(ubcd);
	dto.setShareDonation(ubsd);
	return dto;
}
}
