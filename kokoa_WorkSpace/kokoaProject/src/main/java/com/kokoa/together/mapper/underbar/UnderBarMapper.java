package com.kokoa.together.mapper.underbar;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.underbar.dto.UnderBarDTO;



public interface UnderBarMapper {
	public Integer ubform(@Param("bno") int bno, @Param("ubWriter") String ubWriter,@Param("check")int check);
	public int ubinsert(@Param("bno") int bno, @Param("ubWriter") String ubWriter,@Param("check")int check);
	public int ubStart(@Param("bno") int bno, @Param("ubWriter") String ubWriter);
	public List<UnderBarDTO> ubhCheck(@Param("bno") int bno);
	public int ubhCount(@Param("bno") int bno);
	public int ubsCount(@Param("bno") int bno);
}

