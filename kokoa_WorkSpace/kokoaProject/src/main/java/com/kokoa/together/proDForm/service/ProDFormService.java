package com.kokoa.together.proDForm.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface ProDFormService {
	public String dFormSave(MultipartHttpServletRequest mul,HttpServletRequest request);
	public void selDForm(Model model,int pdNo);
	public void DFormList(Model model, int num);
	public void delete(int pdNo);
}

