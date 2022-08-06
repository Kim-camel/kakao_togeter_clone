<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>모두의행동 : 코코아같이가치</title>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/nowjs.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">

</head>
<body>
<div id="dkWrap">
<header><%@ include file="../default/header.jsp" %></header>
<div id="contents">
	<main>
		<h2 class="screen-out__ScreenOut-sc-1g53lol-0 knpbuW">모두의행동</h2>
		<div class="kWprlw">
			<section class="iRzPRt">
				<div class="grbpyJ">
					<h3 class="knpbuW">함께, 할 수 있는 일을 한다.</h3>
				</div>
				<div class="kDNLWm">
					<div class="iDwCGT">
						<i src="https://t1.kakaocdn.net/together_image/common/ico_action_people.png" class="hbMdxp ico"></i>
						<span class="hpKjlv hGnWYG">8,435명 행동중</span>
						<button type="button" class="ebQeWG">
							<span class="hGnWYG">
								<span class="knpbuW">모두의행동</span>소개보기
							</span>
							<i src="https://t1.kakaocdn.net/together_image/common/ico_action_arrow.png" class="cQsVJL ico"></i>
						</button>
					</div>
				</div>
				<span>
					<a href="/conduct/events" class="eEBkuc eVuRMj" src="https://t1.kakaocdn.net/together_action_prod/admin/20220720/3fecd79c082048a4a12077b9a05facd4">
					</a>
				</span>
			</section>
			
			<section class="irIICp cdslGQ">
				<h3 class="knpbuW">진행중/오픈예정 행동 리스트</h3>
				<c:if test="${conductList.size() == 0}">
					<div class="fIbqNo card false">
						<strong class="subject_official">제안 받은 글이 없어요!!.</strong>
					</div>
				</c:if>
				<c:forEach var="dto" items="${conductList }">
					<div class="fIbqNo card false">
						<div class="krglCC card_header">
							<div style="background: url('/image/${dto.coImg }'); background-size: cover;" class="hXuXoP"></div>
							<!-- src img 넣기 -->
						</div>
						<div class="iCdays card_content">
							<h4 class="bZjEae kClTvG card_title" size="20" color="white">${dto.coTitle }</h4>
							<!--  -->
							<div class="cwoYlD jexknv">
								<a type="tag" class="hilEQG joclVV label"><c:if test="${dto.coSep == 11}"># 그린디지털</c:if><c:if test="${dto.coSep == 12}"># 에너지절약</c:if><c:if test="${dto.coSep == 13}"># 작은가게가치</c:if></a>
							</div>
							<div class=" fVzkPS description">
								<div class="eFaYnx">
									<span class=" knpbuW">제안자 이름</span>
									<strong size="15" class="jJVmAz liHQmW">${dto.coCop }</strong>
								</div>
							</div>
						</div>
						<button type="button" role="link" value="${dto.coNo }" class="eEuUYg"></button>
					</div>
				</c:forEach>
			</section>
		</div>
	</main>
</div>
<%@ include file="../default/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
window.onload=function(){
	$('.fIbqNo button').on('click',function(){
		var coNo = $(this).val();
		console.log(coNo);
		location.href='/conduct/mission/'+coNo;
	})
}
</script>
</html>
