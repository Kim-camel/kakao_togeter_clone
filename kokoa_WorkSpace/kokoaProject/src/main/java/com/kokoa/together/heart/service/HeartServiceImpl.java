package com.kokoa.together.heart.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kokoa.together.heart.dto.HeartDTO;
import com.kokoa.together.mapper.heart.HeartMapper;

@Service
public class HeartServiceImpl implements HeartService {
	@Autowired HeartMapper mapper;
	
	public int likeform(Model model,HeartDTO dto) {
		int result=0;
		try {
			if(mapper.likeform(dto)==null) {
				mapper.insert(dto);
				model.addAttribute("heart", dto);
			}else {
				result = mapper.delete(dto);
				model.addAttribute("heart", dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<HeartDTO> heartCount(@Param("bno")int bno)throws Exception {
		List<HeartDTO> heartCount = mapper.heartCount(bno);
		return heartCount;
	}

	@Override
	public int heartCnt(@Param("bno")int bno,@Param("cno")int cno)throws Exception {
//		System.out.println("heartCntSI");
//		System.out.println(bno);
//		System.out.println(cno);
		int hcnt=mapper.heartCnt(bno,cno);
//		System.out.println("HCSIHCNT : "+hcnt);
		return hcnt;
	}




}

