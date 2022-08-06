package com.kokoa.together.totalDonation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kokoa.together.comment.service.CommentService;
import com.kokoa.together.totalDonation.dto.TotalDonationDTO;
import com.kokoa.together.totalDonation.service.TotalDonationService;
import com.kokoa.together.underbar.service.UnderBarService;

@RestController
public class TotalDonationController {
	@Autowired
	UnderBarService ubs;
	@Autowired
	CommentService cs;
	@Autowired
	TotalDonationService tds;
	
	@RequestMapping(value="participateDonation",method=RequestMethod.POST)
	public List<Integer> participateDonation(@RequestParam("bno")int bno) {
		System.out.println("participateDonation bno : "+bno);
		
		TotalDonationDTO ubdto = ubs.participateDonation(bno);
		List<Integer> csdto = cs.participateDonation(bno);
		ubdto.setCommentDonation(csdto.get(1));
		ubdto.setBno(bno);
		int TotalcMoney=csdto.get(2);
		int DirectD=TotalcMoney-(ubdto.getCommentDonation()*100);
		int ParticipateD=((ubdto.getCheerDonation()+ubdto.getCommentDonation()+ubdto.getShareDonation())*100);
		
		int TotalD=	(ParticipateD+DirectD);
		System.out.println("TOTALPCD : "+TotalD);
		ubdto.setDirectDonation(DirectD);
		ubdto.setParticipateDonation(ParticipateD);
		ubdto.setTotalDonation(TotalD);
		int DirectP=(csdto.get(0));
		int participateP=(ubdto.getCommentDonation()+ubdto.getShareDonation()+ubdto.getCheerDonation());
		tds.totalfMoney(bno,TotalD);
		List<Integer> sendDonation = new ArrayList<Integer>();

		sendDonation.add(0, TotalD);
		sendDonation.add(1, DirectP);
		sendDonation.add(2, DirectD);
		sendDonation.add(3, participateP);
		sendDonation.add(4, ParticipateD);
		sendDonation.add(5, ubdto.getCheerDonation());
		sendDonation.add(6, ubdto.getCheerDonation()*100);
		sendDonation.add(7, ubdto.getShareDonation());
		sendDonation.add(8, ubdto.getShareDonation()*100);
		sendDonation.add(9, csdto.get(1));
		sendDonation.add(10, csdto.get(1)*100);
		
		System.out.println(sendDonation);
		return sendDonation;
		
		
	}
	
	@RequestMapping(value="TMaDA",method=RequestMethod.POST)
	public int TMaDA(){
		int result=tds.TMaDA();
		System.out.println("자러가자  "+result);
		return result;
		
	}
	
}
