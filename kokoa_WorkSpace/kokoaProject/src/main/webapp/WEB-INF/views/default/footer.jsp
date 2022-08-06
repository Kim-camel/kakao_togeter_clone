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

</head>
<body>
<div id="dkFoot" class="d_foot">
	<div class="inner_foot">
		<a href="/" class="link_home">코코아<b>같이가치</b></a>
		<div class="info_link">
			<a href="#" class="link_info">도움말</a>
			<a href="#" class="link_info">문의하기</a>
		</div>
		
		<div class="info_suggest">
			<strong class="tit_suggest">
				<a href="/donation/propose" class="link_suggest">제안하기</a>
			</strong>
				<p class="desc_suggest">
					"당신의 착한 마음을 응원합니다."
					<br>
					"더 좋은 세상을 꿈꾼다면 지금 시작해보세요."	
				</p>
		</div>
		
		<div class="info_sns">
			<a href="#" class="link_sns">
				<span class="ico_together2 ico_kakaotalk">카카오톡</span>
			</a>
		</div>
		
		<small class="copr_info">
			<a href="#" class="link_daumcorp">© Kokoa Corp.</a>
		</small>
	</div>
</div>
</body>
</html>

