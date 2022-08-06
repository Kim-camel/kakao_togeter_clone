package com.kokoa.together.mapper.proDForm;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.proDForm.dto.ProDFormDTO;

public interface ProDFormMapper {
	public int dFormSave(ProDFormDTO dto);
	public ProDFormDTO selDForm(int pdNo);
	public List<ProDFormDTO> DFormList(@Param("s") int start, @Param("e") int end);
	public int DFormCount();
	public void delete(int pdNo);
}
