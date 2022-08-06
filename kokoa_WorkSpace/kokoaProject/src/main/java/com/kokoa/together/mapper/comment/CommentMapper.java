package com.kokoa.together.mapper.comment;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.comment.dto.CommentDTO;


public interface CommentMapper {
	
	public List<CommentDTO> commentList(@Param("bno") int bno) throws Exception;

	// 댓글 등록
	public int commentInsert(CommentDTO dto) throws Exception;

	// 댓글 삭제
	public int commentDelete(int cno);

	public int commentCount();
	
	public int updateCnt(@Param("cnt") int cnt, @Param("bno") int bno);

	public int updateHc(@Param("heartTotal") int heartTotal,@Param("cno")int cno);
//	public List<CommentDTO> heartCount(@Param("bno") int bno) throws Exception;
	public Integer checkMoney(CommentDTO dto);
	
	public List<String> pageTotalMoney(@Param("bno")int bno);
	public String directTotal(@Param("bno")int bno);
	public String commentTotal(@Param("bno")int bno);
	;
}

