package com.kokoa.together.proDForm.service;



import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.donation.service.DonationFileService;
import com.kokoa.together.mapper.proDForm.ProDFormMapper;
import com.kokoa.together.proDForm.dto.ProDFormDTO;

@Service
public class ProDFormServiceImpl implements ProDFormService {
	@Autowired ProDFormMapper dmapper;
	@Autowired DonationFileService df;
	
	public String dFormSave(MultipartHttpServletRequest mul,HttpServletRequest request) {
		ProDFormDTO dto = new ProDFormDTO();
		dto.setPdId(mul.getParameter("pdId"));
		dto.setPdCop(mul.getParameter("pdCop"));
		dto.setPdTitle(mul.getParameter("pdTitle"));
		dto.setPdContent(mul.getParameter("pdContent"));
		dto.setPdsDate(mul.getParameter("pdsDate"));
		dto.setPdeDate(mul.getParameter("pdeDate"));
		dto.setPdtSep(Integer.parseInt(mul.getParameter("pdtSep")));
		
		MultipartFile file1 = mul.getFile("pdtImg");
		dto.setPdtImg(df.saveFile(file1));
		

		int result = 0;
		result = dmapper.dFormSave(dto);
		String msg = null, url = null;
		if (result == 1) {
			msg = "새글이 추가되었습니다";
			url = request.getContextPath() + "/";
		} else {
			msg = "문제가 발생하였습니다";
			url = request.getContextPath() + "/donation/proDForm";
		}
		return df.getMessage(msg, url);
	}
	public void selDForm(Model model,int pdNo) {
		ProDFormDTO dto = new ProDFormDTO();
		dto = dmapper.selDForm(pdNo);
		try {
			SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
			Date pdsDate = fo.parse(dto.getPdsDate());
			Date pdeDate = fo.parse(dto.getPdeDate());
			String fopdsDate = date.format(pdsDate);
			String fopdeDate = date.format(pdeDate);
			dto.setPdsDate(fopdsDate);
			dto.setPdeDate(fopdeDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dForm",dto);
	}
	public void DFormList(Model model, int num) {
		int pageLetter = 10;
		int allCount = dmapper.DFormCount();
		
		int repeat = allCount/pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat",repeat);
		
		model.addAttribute("DFormList",dmapper.DFormList(start,end));
	}
	public void delete(int pdNo) {
		dmapper.delete(pdNo);
	}
}
