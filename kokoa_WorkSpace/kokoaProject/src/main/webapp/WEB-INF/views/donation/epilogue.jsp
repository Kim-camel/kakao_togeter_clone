<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>모금후기 : 코코아같이가치</title>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/nowjs.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>
<div id="dkWrap">
	<header><%@ include file="../default/header.jsp" %></header>
<div id="contents">
	<div id="mArticle">
		<div class="wrap_tab">
			<ul class="list_tab">
				<li>
					<a class="link_tab" href="/donation/now"><span class="txt_tab">모금중</span></a>
				</li>
				<li class="on">
					<a class="link_tab" href="/donation/epilogue"><span class="txt_tab">모금후기</span></a>
				</li>
			</ul>
		</div>
		<div class="group_givetop">
			<strong class="tit_givetop"> 응원, 공유하면 기부되는 가장 쉬운 나눔 </strong>
		</div>
		
		<div class="group_fundlist">
		
 			 <div class="sort_cate">
				<span class="inner_sort_cate">
					<span class="box_sorting sort_on">
						<input type="radio" class="inp_sort" id="sort3" name="sort3">
						<label class="lab_sort" for="sort3">모금후기</label>
					</span>
				</span>
			</div>
			
			<ul class="list_fund">
				<!-- list 받기  -->
			</ul> 
		</div>
	</div>
</div> 
<%@ include file="../default/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
window.onload = function(){
	nowList(3,0);
}
</script>

</html>