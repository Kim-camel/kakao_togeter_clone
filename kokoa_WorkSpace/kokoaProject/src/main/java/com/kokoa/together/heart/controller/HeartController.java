package com.kokoa.together.heart.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kokoa.together.heart.dto.HeartDTO;
import com.kokoa.together.heart.service.HeartService;

@Controller

public class HeartController {
	@Autowired HeartService hs;
	
	@GetMapping("heart")
	public String heart(HttpSession session) {
		
		return "heart/heart";
	}
	
	@GetMapping(value="like",produces="application/json; charset=utf-8")
	@ResponseBody
	public int like(@RequestParam("bno") int bno, @RequestParam("heartWriter") String heartWriter, Model model,@RequestParam("cno")int cno) {
		HeartDTO dto = new HeartDTO();
//		System.out.println("HEART LIKE CONTROLLER");
//		System.out.println("cno : "+cno+ " heartWriter : "+heartWriter);
		dto.setBno(bno);
		dto.setHeartWriter(heartWriter);
		dto.setCno(cno);
//		System.out.println(dto);
		int result = hs.likeform(model,dto); // 0  하트 눌림  1 삭제됨 
		
//		System.out.println("HLC RESULT :"+result);
		return result;
	}
}
