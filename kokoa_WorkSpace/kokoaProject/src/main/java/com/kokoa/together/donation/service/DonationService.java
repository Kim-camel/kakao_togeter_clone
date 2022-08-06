package com.kokoa.together.donation.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.donation.dto.DonationDTO;



public interface DonationService {
	public String doFormSave(MultipartHttpServletRequest mul,HttpServletRequest request,int pdNo);
	public void selForm(Model model,int dNo);
	public List<DonationDTO> nowList(int sort, int topic);
}

