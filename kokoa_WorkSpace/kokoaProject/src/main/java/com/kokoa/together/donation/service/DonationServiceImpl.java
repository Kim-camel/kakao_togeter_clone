package com.kokoa.together.donation.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.donation.dto.DonationDTO;
import com.kokoa.together.mapper.donation.DonationMapper;
import com.kokoa.together.proDForm.service.ProDFormService;

@Service
public class DonationServiceImpl implements DonationService {
	@Autowired DonationMapper mapper;
	@Autowired DonationFileService df;
	@Autowired ProDFormService ps;
	
	public String doFormSave(MultipartHttpServletRequest mul,HttpServletRequest request, int pdNo) {
		DonationDTO dto = new DonationDTO();
		dto.setdCop(mul.getParameter("dCop"));
		dto.setdTitle(mul.getParameter("dTitle"));
		dto.setdContent(mul.getParameter("dContent"));
		dto.setDsDate(mul.getParameter("dsDate"));
		dto.setDeDate(mul.getParameter("deDate"));
		dto.setTdTarget(mul.getParameter("tdTarget"));
		dto.setdSep(Integer.parseInt(mul.getParameter("dSep")));
		
		if(pdNo == 0) {
			MultipartFile file1 = mul.getFile("dtImg");
			dto.setDtImg(df.saveFile(file1));
		} else {
			dto.setDtImg(mul.getParameter("dtImg"));
		}
		
		int result = 0;
		result = mapper.doFormSave(dto);
		String msg = null, url = null;
		if (result == 1) {
			msg = "새글이 추가되었습니다";
			url = request.getContextPath() + "/";
			if(pdNo != 0) {
				ps.delete(pdNo);
			}
		} else {
			msg = "문제가 발생하였습니다";
			url = request.getContextPath() + "/donation/proDForm";
		}
		return df.getMessage(msg, url);
	}
	
	public void selForm(Model model,int dNo) {
		DonationDTO dto = new DonationDTO();
		dto = mapper.selForm(dNo);
		try {
			SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date dsDate = fo.parse(dto.getDsDate());
			Date deDate = fo.parse(dto.getDsDate());
			String fodsDate = date.format(dsDate);
			String fodeDate = date.format(deDate);
			dto.setDsDate(fodsDate);
			dto.setDeDate(fodeDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("doForm",dto);
	}
	public List<DonationDTO> nowList(int sort, int topic){
		System.out.println("sort : "+sort);
		System.out.println("topic : "+topic);
		
		
		return mapper.nowList(sort,topic);
	}
}
