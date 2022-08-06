package com.kokoa.together.conduct.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ConductService{
	public String coFormSave(MultipartHttpServletRequest mul,HttpServletRequest request);
	public void conductList(Model model);
	public void selForm(Model model, int coNo);
}
