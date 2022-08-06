<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>${coForm.coTitle}</title>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>
<div id="dkWrap">
	<header><%@ include file="../default/header.jsp" %></header>
	<div id="dkcontents">
		<div id="mArticle">
			<div class="wrap_visual">
					<div class="cont_visual" style="background-size: cover; background-color: rgb(59, 56, 32); background-image: url('/image/${coForm.coImg }');">
						<div class="front_pack">
							<h4 class="tit_visual ellipsis_type1">${coForm.coTitle }</h4>
							<span class="txt_sponsor ellipsis_g">by ${coForm.coCop }</span>
						</div>
					</div>
			</div>
			<div><!----></div>
			
			<div class="wrap_subject">
				<div class="cont_subject #content">
					${coForm.coContent }
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
window.onload = function(){
	$('.wrap_subject .cont_subject img').removeAttr( 'style' );;
}
</script>
</html>