package com.kokoa.together.heart.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.kokoa.together.heart.dto.HeartDTO;

public interface HeartService {
	public int likeform(Model model, HeartDTO dto);
	public int heartCnt(@Param("bno")int bno,@Param("cno")int cno)throws Exception;
	public List<HeartDTO>heartCount(@Param("bno")int bno) throws Exception;
}

