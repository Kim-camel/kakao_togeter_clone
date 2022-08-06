package com.kokoa.together.comment.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.comment.dto.CommentDTO;

public interface CommentService {
	
	public List<CommentDTO> commentList(@Param("bno") int bno) throws Exception;
	
	public int commentInsert(CommentDTO dto) throws Exception;
	
	public int commentDelete(int cno);

	public int commentCount();

	public int updateCnt(@Param("cnt") int cnt, @Param("bno") int bno);
	
	public int updateHc(@Param("heartTotal") int heartTotal,@Param("cno")int cno);
	
	public Integer checkMoney(CommentDTO dto);
	
	public int pageTotalMoney(@Param("bno")int bno);
	
	public List<Integer> participateDonation(@Param("bno")int bno);
}
