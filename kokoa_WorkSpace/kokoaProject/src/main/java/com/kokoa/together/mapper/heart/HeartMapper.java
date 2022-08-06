package com.kokoa.together.mapper.heart;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.heart.dto.HeartDTO;

public interface HeartMapper {
	public HeartDTO likeform(HeartDTO dto);
	public int delete(HeartDTO dto);
	public int insert(HeartDTO dto);
	public List<HeartDTO> heartCount(@Param("bno") int bno) throws Exception;
	public int heartCnt(@Param("bno") int bno,@Param("cno") int cno) throws Exception;
}

