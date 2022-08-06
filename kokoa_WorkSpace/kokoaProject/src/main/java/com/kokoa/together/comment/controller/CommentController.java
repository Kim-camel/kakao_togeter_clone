package com.kokoa.together.comment.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kokoa.together.comment.dto.CommentDTO;
import com.kokoa.together.comment.service.CommentService;
import com.kokoa.together.heart.dto.HeartDTO;
import com.kokoa.together.heart.service.HeartService;

@RestController
public class CommentController {
	@Autowired
	CommentService cs;
	@Autowired
	HeartService hs;
	
	@RequestMapping(value="commentList", method=RequestMethod.POST)
	public List<CommentDTO> commentList(int bno,@RequestParam Map<String,Integer> param,HttpSession session) throws Exception{
		
		int cnt=cs.commentCount();
//		System.out.println("cnt:"+cnt);
		int result=cs.updateCnt(cnt,bno);
		if(result!=0) {
			System.out.println("CNT수정성공");
		}else {
			System.out.println("CNT수정실패");
		}
		int startIndex = Integer.parseInt(String.valueOf(param.get("startIndex")));
		int endIndex = Integer.parseInt(String.valueOf(param.get("endIndex")));
//		System.out.println("starIndex:" +startIndex);
//		System.out.println("endIndex:"+endIndex);
		List<HeartDTO> heartCount = hs.heartCount(bno);
//		System.out.println("heartCount"+heartCount);
		List<CommentDTO> commentList = cs.commentList(bno);
		List<CommentDTO> listMore = new ArrayList<CommentDTO>();
		List<CommentDTO> listList = new ArrayList<CommentDTO>();
		for (CommentDTO dto : commentList) {
			for(HeartDTO hdto : heartCount) {
				if(dto.getCno()==hdto.getCno()&&hdto.getHeartWriter().equals((String)session.getAttribute("loginUser"))) {
					dto.setReHeart(1);
					break;
				} else {
					dto.setReHeart(0);
				}
			}
			listMore.add(dto);
		}
		
		if(endIndex<=cnt) {
			for(; startIndex<endIndex;startIndex++) {
				listList.add(listMore.get(startIndex));
			}
			
		}else if(endIndex>cnt) {
			
			for(; startIndex<cnt;startIndex++) {
				listList.add(listMore.get(startIndex));
			}
			System.out.println("후기식");
			System.out.println(listList);
			return listList;
		}
		System.out.println("전기식");
		System.out.println(listList);
	    return listList;	
	}
	
	@RequestMapping(value="heartTotal", method = RequestMethod.GET)
	public int heartTotal(@Param("cno")int cno,@Param("bno")int bno) throws Exception {
		int heartTotal= hs.heartCnt(bno,cno);
//		System.out.println("heartTotal: "+heartTotal);
		cs.updateHc(heartTotal,cno);
		return heartTotal;
	}
	@RequestMapping(value="commentInsert", method=RequestMethod.POST)
	public String commentInsert(@RequestBody CommentDTO dto) throws Exception {
//		System.out.println("dtomoney" +dto.getMoney());
		Integer checkMoney=cs.checkMoney(dto);
//		System.out.println("checkMoney"+checkMoney);
		
		if(checkMoney==0&&dto.getMoney()==null) {
			dto.setMoney("100");
		}else if(checkMoney!=0&&dto.getMoney()==null) {
			dto.setMoney("0");
		}
		
//		System.out.println("getmoney"+dto.getMoney());
		Date date = new Date();
//		System.out.println(date);
		dto.setCommentDate(date);
	    String message=null;
	    int result =cs.commentInsert(dto);
	    if(result==1) {//사용할 수 있다. db에서 찾았는데없으니까
	    	message ="success";
	    	System.out.println("입력성공");
	    }else {
	        message ="fail";
	        System.out.println("입력실패");
	    }
	    
	    return message;
	}
	
	@RequestMapping(value="pageTotalMoney",method=RequestMethod.GET)
	public int pageTotalMoney(@RequestParam("bno")int bno) {
		int totalMoney=cs.pageTotalMoney(bno);
//		System.out.println("PTM CONTROLLER : "+totalMoney);
		return totalMoney;
	}
	@RequestMapping(value="commentDelete", method=RequestMethod.GET)
	public String commentDelete(int cno) {
	    int result =cs.commentDelete(cno);
//	    System.out.println(cno);
	    String message=null;
	    if(result==1) {//사용할 수 있다. db에서 찾았는데없으니까
	        message = "success";
	        System.out.println("삭제성공");
	    }else {//사용할 수 없다.
	        message ="fail";
	        System.out.println("삭제실패");
	    }
	    return message;
	}
//        return cs.commentDelete(cno) == 1 ?
//                new ResponseEntity<>(new String("delete success".getBytes(), "UTF-8"), HttpStatus.OK) :
//                new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

}
