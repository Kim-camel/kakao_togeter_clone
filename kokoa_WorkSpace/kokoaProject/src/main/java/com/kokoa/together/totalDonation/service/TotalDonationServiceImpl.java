package com.kokoa.together.totalDonation.service;

import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kokoa.together.mapper.totalDonation.TotalDonationMapper;

@Service
public class TotalDonationServiceImpl implements TotalDonationService {
@Autowired
TotalDonationMapper tdm;

@Override
public void totalfMoney(@Param("bno")int bno,@Param("TotalD")int TotalD) {
	if(TotalD==0) {
		tdm.totalfMoney(bno,TotalD);
		
	}else {
		tdm.totalUMoney(bno,TotalD);
	}
}

@Override
public int TMaDA() {
	List<Integer> TMaDa=tdm.TMaDa();
	List<Integer> NTMaDa=TMaDa.stream().distinct().collect(Collectors.toList());
	int result=NTMaDa.stream().mapToInt(Integer::intValue).sum();
	System.out.println("인덱스 떠라! "+result);
	
	return result;
}
}
