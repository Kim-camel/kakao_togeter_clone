package com.kokoa.together.conduct.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kokoa.together.conduct.service.ConductService;

@Controller
@RequestMapping("conduct")
public class ConductController {
	@Autowired ConductService cs;
	
	@GetMapping("project")
	public String project(Model model) {
			cs.conductList(model);
		return "conduct/project";
	}
	
	@GetMapping("writeForm")
	public String writeForm(HttpSession session) {
		String id = "";
		id = (String)session.getAttribute("loginUser");
		if(id != null && id.equals("admin1")){
			return "conduct/writeForm";
		}
		return "redirect:/";
	}
	
	@PostMapping("coFormRegister")
	public void coFormRegister(MultipartHttpServletRequest mul,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String message = cs.coFormSave(mul, request);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("events")
	public String events() {
		return "conduct/events";
	}
	@RequestMapping(value = "mission/{coNo}", method = RequestMethod.GET)
	public String mission(@PathVariable("coNo") int coNo,Model model ) {
		System.out.println(coNo);
		cs.selForm(model, coNo);
		return "conduct/mission";
	}
}
