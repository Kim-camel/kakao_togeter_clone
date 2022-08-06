package com.kokoa.together.mapper.donation;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kokoa.together.donation.dto.DonationDTO;

public interface DonationMapper {
	public int doFormSave(DonationDTO dto);
	public DonationDTO selForm(int dNo);
	public List<DonationDTO> nowList(@Param("sort") int sort, @Param("dSep") int dSep);
}
