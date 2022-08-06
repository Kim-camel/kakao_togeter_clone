package com.kokoa.together.conduct.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.conduct.dto.ConductDTO;
import com.kokoa.together.donation.service.DonationFileService;
import com.kokoa.together.mapper.conduct.ConductMapper;

@Service
public class ConductServiceImpl implements ConductService{
	@Autowired ConductMapper cmapper;
	@Autowired DonationFileService df;
	
	public String coFormSave(MultipartHttpServletRequest mul,HttpServletRequest request) {
		ConductDTO dto = new ConductDTO();
		dto.setCoCop(mul.getParameter("coCop"));
		dto.setCoTitle(mul.getParameter("coTitle"));
		dto.setCoContent(mul.getParameter("coContent"));
		dto.setCoSep(mul.getParameter("coSep"));
		
		MultipartFile file1 = mul.getFile("coImg");
		dto.setCoImg(df.saveFile(file1));
		
		int result = 0;
		result = cmapper.coFormSave(dto);
		String msg = null, url = null;
		if (result == 1) {
			msg = "새글이 추가되었습니다";
			url = request.getContextPath() + "/";
		} else {
			msg = "문제가 발생하였습니다";
			url = request.getContextPath() + "/conduct/conduckForm";
		}
		return df.getMessage(msg, url);
	}
	public void conductList(Model model) {
		model.addAttribute("conductList",cmapper.conductList());
	}
	public void selForm(Model model, int coNo) {
		model.addAttribute("coForm",cmapper.selForm(coNo));
	}
}
