<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href = "/resources/css/font.css">
<link rel="stylesheet" type="text/css" href = "/resources/css/Main.css">

</head>
<body>
	<div id="dkHead">
		<div class="d_head">
			<a href="/" class="link_home">코코아<b>같이가치</b></a>
				<div class="gnb_together">
					<h2 class="screen_out">메인메뉴</h2>
							<a href="/donation/now" class="link_gnb"><span class="txt_gnb">같이기부</span></a>
							<a href="/conduct/project" class="link_gnb"><span class="txt_gnb">모두의행동<span class="ico_new">new</span></span></a>
							<!-- <a href="/notices" class="link_gnb"><span class="txt_gnb">공지사항</span></a> -->
				</div>
			<div class="wrap_util">
			
				<c:choose >
				<c:when test="${loginUser == null}">
					<a href="/UserInfo/login" class="link_util link_fund">제안하기</a>
				</c:when>
				<c:otherwise>
					<c:choose>
					<c:when test="${loginUser == 'admin1'}">
						<a href="/donation/confirm" class="link_util link_fund">제안받기</a>
					</c:when>
					<c:otherwise>
						<a href="/donation/propose" class="link_util link_fund">제안하기</a>
					</c:otherwise>
					</c:choose>
				</c:otherwise>
				</c:choose>
				
				<c:choose >
				<c:when test="${loginUser == null}">
				<a href="/UserInfo/login" class="link_util link_fund">로그인</a>
				</c:when>
				</c:choose>
			
				<c:choose >
				<c:when test="${loginUser !=null }">
				<a href="/UserInfo/mypage" class="link_util link_fund">마이페이지</a>
				</c:when>
				</c:choose>
				
				<c:choose >								
				<c:when test="${loginUser != null}">
				<a href="/UserInfo/logout" class="link_util link_fund">로그아웃</a>
				</c:when>
				</c:choose>
				<button type="button" class="btn_search">
					<span class="ico_together ico_search">검색</span>
				</button>
				
			</div>
		</div>
	</div>
</body>
</html>



