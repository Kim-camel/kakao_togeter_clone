package com.kokoa.together.mapper.conduct;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.conduct.dto.ConductDTO;

public interface ConductMapper {
	public int coFormSave(ConductDTO dto);
	public List<ConductDTO> conductList();
	public ConductDTO selForm(@Param("coNo") int coNo);
}
