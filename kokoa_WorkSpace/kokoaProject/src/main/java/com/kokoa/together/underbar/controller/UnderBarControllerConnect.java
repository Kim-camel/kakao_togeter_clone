package com.kokoa.together.underbar.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/underbar")
public class UnderBarControllerConnect {
	
	
	@RequestMapping("/underbar")
	public String underbar() {
		return "/underbar/underbar";
	}
	@RequestMapping("/direct")
	public String direct() {
		return "/underbar/direct";
	}
}

