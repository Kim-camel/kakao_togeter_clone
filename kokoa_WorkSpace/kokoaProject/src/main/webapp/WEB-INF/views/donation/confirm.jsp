<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안받기 : 코코아같이가치</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">
<style type="text/css">
.pro_write .write_form{
	padding: 0 5px;
}
</style>

</head>
<body>
<div id="dkWrap">
	<header><%@ include file="../default/header.jsp" %>
	</header>
<div id="contents">
	<div id="mArticle">
		<div class="group_official">
			<ul class="list_official">
			<c:if test="${DFormList.size() == 0}">
				<li>
					<a class="link_official">
						<strong class="subject_official">제안 받은 글이 없어요!!.</strong>
						<span class="tit_official"></span>
						<span class="date_official"></span>
					</a>
				</li>
			</c:if>
			<c:forEach var="dform" items="${DFormList }">
				<li>
					<a class="link_official" href="/donation/donationForm?pdNo=${dform.pdNo }">
						<strong class="subject_official">${dform.pdTitle }</strong>
						<span class="tit_official">${dform.pdCop }</span>
					</a>
				</li>
			</c:forEach>
			</ul>
			<div class="pro_write">
				<a href="/donation/donationForm" class="write_form">기부제안</a>
				<a href="/conduct/writeForm" class="write_form">행동제안</a>
				<!-- 두 form select으로 묶기. -->
			</div>
		</div>
	</div>
</div> 
<%@ include file="../default/footer.jsp" %>
</div>
</body>
</html>