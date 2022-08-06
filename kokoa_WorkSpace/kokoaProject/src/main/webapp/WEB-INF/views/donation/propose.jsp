<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코코아같이가치</title>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>

<div id="dkWrap">
	<header><%@ include file="../default/header.jsp" %></header>
<div id="contents">
	<div id="mArticle">
			<div class="wrap_fundmake">
				<div class="inner_fundmake">
					<div class="suggest_fundmake suggest_project">
						<span class="ico_together2 ico_project"></span>
						<strong class="tit_fundmake"> 프로젝트 모금함 </strong>
						<p class="desc_fundmake"> 직접 기획한 프로젝트에 기부금을 사용할 수 있어요. </p>
						<ul class="list_fundmake">
							<li>전문기관의 심사를 받습니다.</li>
							<li>모금 후 결과보고는 필수!</li>
							<li><a routerlink="/notices/116" class="link_guide" href="/notices/116">모금 제안 가이드</a></li>
							<!-- notice 이동 페이지 만들기 -->
						</ul>
						<a href="/donation/proDForm" class="link_fundmake">
							<span class="txt_start">모금하기</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../default/footer.jsp" %>
</div> 
</body>
</html>