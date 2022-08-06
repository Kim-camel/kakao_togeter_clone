package com.kokoa.together.totalDonation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/totalDonation")
public class TotalDonationControllerConnect {

	@RequestMapping("/totalDonation")
	public String TotalDonation() {
		return "/totalDonation/totalDonation";
	}
	
}
