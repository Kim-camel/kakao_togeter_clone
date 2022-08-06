<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${doForm.dTitle}</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>
<div id="dkWrap">
	<header><%@ include file="../default/header.jsp" %></header>
	<div id="dkcontents">
		<div id="mArticle">
			<div class="wrap_visual">
					<div class="cont_visual" style="background-size: cover; background-color: rgb(59, 56, 32); background-image: url('/image/${doForm.dtImg }');">
						<div class="front_pack">
							<h4 class="tit_visual ellipsis_type1">${doForm.dTitle }</h4>
							<span class="txt_sponsor ellipsis_g">by ${doForm.dCop }</span>
						</div>
					</div>
			</div>
			<div><!----></div>
			
			<div class="wrap_subject">
				<div class="cont_subject #content">
					${doForm.dContent }
				</div>
				
				<div class="cont_project info_state">
				<%@ include file="../totalDonation/totalDonation.jsp" %>
					<!--  -->
				</div>
				<%@ include file="../comment/comment.jsp" %>
				
			</div>
		</div>
		<%@ include file="/WEB-INF/views/underbar/underbar.jsp" %>
	</div>
	<footer id="ubfooter"><%@ include file="../default/footer.jsp" %></footer>
	
</div>
</body>
<script type="text/javascript">
window.onload = function(){
	$('.wrap_subject .cont_subject img').removeAttr( 'style' );;
}
</script>
</html>