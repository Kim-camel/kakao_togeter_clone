package com.kokoa.together.proDForm.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.proDForm.service.ProDFormService;

@Controller
@RequestMapping("/donation")
public class ProDFormController {
	@Autowired ProDFormService dfs;
	
	@GetMapping("proDForm")
	public String proDForm(HttpSession session) {
		String id = "";
		id = (String)session.getAttribute("loginUser");
		if(id == null) {
			return "redirect:/";
		}
		return "donation/proDForm";
	}


	@PostMapping("dFormRegister")
	public void dRegister(MultipartHttpServletRequest mul,HttpServletRequest request, HttpServletResponse response) throws Exception{
//		System.out.println(mul.getParameter("pdCop"));
		String message = dfs.dFormSave(mul, request);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	} 
	
	@GetMapping("confirm")
	public String confirm(Model model,
			@RequestParam(value="num",
			required = false, 
			defaultValue = "1") int num,HttpSession session) {
		String id = "";
		id = (String)session.getAttribute("loginUser");
		if(id != null && id.equals("admin1")){
			dfs.DFormList(model, num);
		}else {
			return "redirect:/";
		}
		return "donation/confirm";
	}
	
	@GetMapping("donationForm")
	public String donationForm(@RequestParam(required = false,defaultValue = "0" ) int pdNo,Model model) {
		if(pdNo != 0) {
			dfs.selDForm(model, pdNo);
		}
		return "donation/donationForm";
	}

}
