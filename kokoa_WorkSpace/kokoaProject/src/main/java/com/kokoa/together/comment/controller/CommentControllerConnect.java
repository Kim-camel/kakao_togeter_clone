package com.kokoa.together.comment.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentControllerConnect {

	  @RequestMapping("/comment") 
	  public String commentCssTest() {
		  return "/comment/comment"; 
	  }
}

