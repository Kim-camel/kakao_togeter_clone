package com.kokoa.together.comment.service;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kokoa.together.comment.dto.CommentDTO;
import com.kokoa.together.mapper.comment.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	CommentMapper cm;

	@Override
	public int updateCnt(@Param("cnt") int cnt, @Param("bno") int bno) {
		int result=cm.updateCnt(cnt,bno);
		return result;
	}
	@Override
	public List<CommentDTO> commentList(@Param("bno") int bno) throws Exception {
		List<CommentDTO> commentList = cm.commentList(bno);
		return commentList;
	}

	@Override
	public int commentInsert(CommentDTO dto) throws Exception {
		int result=cm.commentInsert(dto);
	    return result;
	}
	@Override
	public int commentDelete(int cno) {
		int result = cm.commentDelete(cno);
	    return result;
	}

	@Override
	public int commentCount() {
		 int cnt= cm.commentCount();
		return cnt;
	}
	@Override
	public int updateHc(@Param("heartTotal") int heartTotal,@Param("cno")int cno) {
		int resultHt = cm.updateHc(heartTotal,cno);
		return resultHt;
	}
	@Override
	public Integer checkMoney(CommentDTO dto) {
//		System.out.println("CMSI : "+ dto.getMoney());
		Integer checkMoney = cm.checkMoney(dto);
		return checkMoney;
	}
	@Override
	public int pageTotalMoney(int bno) {
		List<String> result=cm.pageTotalMoney(bno);
		List<String> number =new ArrayList<String>();
		
		for(int i=0;i<result.size();i++) {
			number.add(i, result.get(i).replace(",", ""));
		}
		
		List<Integer> money=number.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		int totalMoney=money.stream().mapToInt(Integer::intValue).sum();
//		System.out.println("PTMMONEY : "+money);
		return totalMoney;
	}
	@Override
	public List<Integer> participateDonation(@Param("bno")int bno) {
		List<String> result=cm.pageTotalMoney(bno);
		List<String> number =new ArrayList<String>();
		
		for(int i=0;i<result.size();i++) {
			number.add(i, result.get(i).replace(",", ""));
		}
		
		List<Integer> money=number.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
		int totalMoney=money.stream().mapToInt(Integer::intValue).sum();
		int directTotal=Integer.parseInt(cm.directTotal(bno));
		int commentTotal=Integer.parseInt(cm.commentTotal(bno));
		System.out.println("participateDonation directTotal: "+directTotal+"명 0번");
		System.out.println("participateDonation commentTotal: "+commentTotal+"명 1번");
		System.out.println("participateDonation PTMMONEY : "+totalMoney);
		List<Integer> Todo = new ArrayList<Integer>();
		Todo.add(0, directTotal);
		Todo.add(1,commentTotal);
		Todo.add(2,totalMoney);
		return Todo;
	}
	
}

