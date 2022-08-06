package com.kokoa.together.underbar.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kokoa.together.underbar.dto.UnderBarDTO;
import com.kokoa.together.underbar.service.UnderBarService;



@RestController
public class UnderBarController {
	@Autowired
	UnderBarService ubs;
	
	@GetMapping(value="ubCount",produces = "application/json; charset=utf-8")
	public Map<String, Integer> ubCount(@RequestParam("bno")int bno) {
		Map<String, Integer> ubCount=ubs.ubCount(bno);	
		return ubCount;
	}
	@PostMapping(value="ubhCheck",produces = "application/json; charset=utf-8")
	public int ubhCheck(@RequestParam("bno")int bno,@RequestParam("ubWriter") String ubWriter) {
		int result=0;
				List<UnderBarDTO> ubhCheck=ubs.ubhCheck(bno);
				for(int i=0; i<ubhCheck.size(); i++) {
					if(ubWriter.equals(ubhCheck.get(i).getUbWriter()) && ubhCheck.get(i).getUbHeart()==1) {
						result=1;
						return result;
					}else {
						result=0;
					}
				}
		return result;
	}
	@PostMapping(value="ubform",produces = "application/json; charset=utf-8" )
	public int ubform(@RequestParam("bno") int bno, @RequestParam("ubWriter") String ubWriter , @RequestParam("check") int check) throws Exception{
		String message=null;
		
		Integer result = ubs.ubform(bno,ubWriter,check);
		if(result==1) {
			message="이벤트에 참여 하셨습니다";
		}else if(result==0) {
			message="이미 진행된 이벤트입니다";
		}
		
		System.out.println("ubform : "+message);
		//0	==> 값이 있어 그냥 반환
		//1 == > 값이 없어 입력성공
		return result;
	}
	
}

