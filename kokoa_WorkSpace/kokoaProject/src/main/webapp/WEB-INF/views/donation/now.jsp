<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>모금중 : 코코아같이가치</title>
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
				<li class="on">
					<a class="link_tab" href="/donation/now"><span class="txt_tab">모금중</span></a>
				</li>
				<li>
					<a class="link_tab" href="/donation/epilogue"><span class="txt_tab">모금후기</span></a>
				</li>
			</ul>
		</div>
		
 		<div class="group_catelist">
			<h3 class="screen_out">모금함 카테고리</h3>
			<div class="inner_catelist">
			
				<ul class="list_cate">
					<li class="on">
						<a class="link_cate">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" aria-hidden="true">
								<image x="0" y="0" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="//t1.kakaocdn.net/together_image/ico_all.png"></image>
							</svg>
							<span class="text_cate">전체</span>
						</a>
					</li>
					<li>
						<a class="link_cate" id=11>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" aria-hidden="true">
								<image x="0" y="0" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="https://t1.kakaocdn.net/together_image/ico_kidz.png"></image>
							</svg>
							<span class="text_cate">어린이</span>
						</a>
					</li>
					<li>
						<a class="link_cate" id=12>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" aria-hidden="true">
									<image x="0" y="0" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="https://t1.kakaocdn.net/together_image/ico_animal.png"></image>
							</svg>
							<span class="text_cate">동물</span>
						</a>
					</li>
					<li>
						<a class="link_cate" id=13>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" aria-hidden="true">
								<image x="0" y="0" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="https://t1.kakaocdn.net/together_image/ico_culture.png"></image>
							</svg>
							<span class="text_cate">환경</span>
						</a>
					</li>
				</ul>
				
			</div>
		</div>
		
		<div class="group_fundlist">
		
 			<div class="sort_cate">
				<span class="inner_sort_cate">
					<span class="box_sorting sort_on">
						<input type="radio" class="inp_sort" id="sort1" name="sort1">
						<label class="lab_sort" for="sort1">추천순</label>
					</span>
					<span class="box_sorting ">
						<input type="radio" class="inp_sort" id="sort2" name="sort2">
						<label class="lab_sort" for="sort2">최신순</label>
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
	nowList(0,0);
}
</script>
</html>
