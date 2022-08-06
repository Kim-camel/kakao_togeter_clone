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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/nowjs.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">

</head>
<body>
<div id="dkWrap">
	<header><%@ include file="default/header.jsp" %></header>
	<div id="contents">
		<div id="dkContent" class="cont_home">
			<div id="mArticle">
				<div class="group_topslide">
					<h3 class="screen_out">같이가치 주요 모금함</h3>
					
					<div class="inner_slide">
						<ul class="list_slide" style="user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							<li class="slide_pannel">
								<a class="link_slide" href="/conduct/mission/1">
									<div class="area_cont dimmed_thumb">
										<span class="tag_slide">모두의행동</span>
										<span class="tit_slide">지구온도는 내리고 
										실내온도는 높여요! (🌡 26도) </span>
										<span class="desc_slide ellipsis_type1">
										사용자들에게 빠르고 정확하게, 
										여름철 안전을 대비하는 콘텐츠를 준비하다 
										</span>
									</div>
									<span class="area_thumb">
										<span class="img_thumb" style="background-image: url('/image/source/con1.jpg');"></span>
									</span>
								</a>
							</li>
							<li class="slide_pannel">
								<a class="link_slide" href="/conduct/events">
									<div class="area_cont dimmed_thumb">
										<span class="tag_slide">모두의행동</span>
										<span class="tit_slide">에너지 절약으로
										지구와 우리 지키기 </span>
										<span class="desc_slide ellipsis_type1">에너지 절약 캠페인으로 돌아온 모두의행동!
										전기 절약 행동을 통해 안전한 여름 나기를 함께해볼까요?
										카카오도 에너지 취약계층을 위해 인증 수만큼 같이 기부해요.
										</span>
									</div>
									<span class="area_thumb">
										<span class="img_thumb" style="background-image: url('https://mud-kage.kakaocdn.net/dn/hEvy7/btrHQJJqUrG/Ky5DT3Hn2oJIeWALZUAsz1/c360.jpg');"></span>
									</span>
								</a>
							</li>
							<li class="slide_pannel">
								<a class="link_slide" href="/donation/fund/2">
									<div class="area_cont dimmed_thumb">
										<span class="tag_slide">학교에 가자 친구야!</span>
										<span class="tit_slide">네팔의 아이들이 학교에서
										 마음껏 공부하고 뛰어 놀 수 있도록!
										</span>
										<span class="desc_slide ellipsis_type1">아이들이 즐거운 마음으로 학교에 가서 
										공부도 더욱 열심히 하고 친구들하고도 마음껏 뛰어놀 수 있도록
									 	아이들에게 책가방과 신발을 선물해 주세요.
										</span>
									</div>
									<span class="area_thumb">
										<span class="img_thumb" style="background-image: url('/image/source/children-5.jpg');"></span>
									</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="group_action_slide">
					<div class="inner_container">
						<div class="box_slide_title">
							<div class="ico_actions">
								<strong>지금은 모두의 행동중</strong>
								<p>모두의행동이 새롭게 오픈했습니다.</p>
							</div>
							<a href="/conduct/project" class="link_round">자세히 보기</a>
						</div>
						<div class="slide_container">
							<div class="inner_slide">
								<ul class="list_slide_items">
									<li class="slide_item">
										<a class="link_action_item" href="/conduct/events">
											<strong class="item_title">더 나은 세상을 위한 행동에 참여해보세요.</strong>
											<div class="item_content">
												<div class="box_thumb">
													<span class="img_thumb" style="background-image: url('https://mud-kage.kakaocdn.net/dn/hEvy7/btrHQJJqUrG/Ky5DT3Hn2oJIeWALZUAsz1/c360.jpg');"></span>
												</div>
												<div class="box_infomation">
													<strong class="tit_action">에너지 절약으로
													지구와 우리 지키기</strong>
													<p class="desc_action">오늘, 효율적인 에너지 사용 하셨나요?</p>
												</div>
											</div>
										</a>
									</li>
									<li class="slide_item">
										<a class="link_action_item" href="/conduct/mission/1">
											<strong class="item_title">더 나은 세상을 위한 행동에 참여해보세요.</strong>
											<div class="item_content">
												<div class="box_thumb">
													<span class="img_thumb" style="background-image: url('/image/source/con1.jpg');"></span>
												</div>
												<div class="box_infomation">
													<strong class="tit_action">지구온도는 내리고 
													실내온도는 높여요! (🌡 26도)</strong>
													<p class="desc_action">전기 절약 행동을 통해 안전한 여름 나기를 함께해볼까요?</p>
												</div>
											</div>
										</a>
									</li>
									<li class="slide_item">
										<a class="link_action_item" href="/conduct/mission/2">
											<strong class="item_title">더 나은 세상을 위한 행동에 참여해보세요.</strong>
											<div class="item_content">
												<div class="box_thumb">
													<span class="img_thumb" style="background-image: url('/image/source/en1.jpg');"></span>
												</div>
												<div class="box_infomation">
													<strong class="tit_action">슬기로운 에너지 생활을 위한 
													'10가지 행동'</strong>
													<p class="desc_action">오늘, 효율적인 에너지 사용 하셨나요?</p>
												</div>
											</div>
										</a>
									</li>
								</ul>
							</div>
 							<div class="slide_control_btns pc_show">
								<button type="button" class="btn_prev">
									<i class="ico_prev">
										<span class="screen_out">이전</span>
									</i>
								</button>
								<button type="button" class="btn_next">
										<i class="ico_next">
											<span class="screen_out">다음</span>
										</i>
								</button>
							</div>						
						</div>
					</div>
				</div>
				
				<div class="group_fund">
					<h3 class="tit_section section_type3">
						<a class="link_main" href="/donation/now">가장 쉬운 나눔</a></h3>
					<ul class="list_fund">
						<!--    -->
					</ul>
					<div class="list_more">
						<button type="button" class="link_round link_other2">더보기 </button>
					</div>
				</div>
				
				<div class="group_banner homemid_banner pc_show">
					<a class="link_banner" href="/conduct/events" >
						<img class="img_banner" src="https://mud-kage.kakaocdn.net/dn/byuMde/btrHNW2sdJg/zFpmnoydN7ratr8KjKIDA0/img.png" alt="">
					</a>
				</div>
				
				
				<div class="info_state">
					<h3 class="screen_out">기부금현황</h3>
					<div class="fund_info">
						<strong class="tit_state">우리가 함께 모은 기부금</strong>
						<span class="total_fund">
							<em class="emph_txt" id="kmoney"></em> 원
						</span>
						<span class="txt_date" id="kdate"></span>
					</div>
					<div id="animate-area" class="chart_fund pack_type2 fund_end">
						<span class="progress_road">
							<span class="mark_point"></span>
						</span>
					</div>
				</div>
		</div>
	</div>
</div>
<%@ include file="default/footer.jsp" %>
</div>
</body>
<script type="text/javascript">
window.onload = function(){
	nowList(4,0);
}

$(document).ready(function(){
	$('.list_more button').on('click',function(){
		location.href='/donation/now/';
	})
	TMaDA()
})
$(function(){
 	function sliderSet(slickfor,slicknav){
 		slickfor.slick({
 			slide: 'li',        //슬라이드 되어야 할 태그
 			infinite : true,     //무한 반복 옵션     
 			slidesToShow : 1,        // 한 화면에 보여질 컨텐츠 개수
 			slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
 			speed : 1000,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
 			arrows : false,         // 옆으로 이동하는 화살표 표시 여부
 			dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
 			autoplay : true,            // 자동 스크롤 사용 여부
 			autoplaySpeed : 5000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
 			pauseOnHover : false,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
 			vertical : false,        // 세로 방향 슬라이드 옵션
 			draggable : false,     //드래그 가능 여부 
 	    });
 		slicknav.slick({
 			slide: 'li',
 			infinite : true,  
 			slidesToShow : 1,
 			slidesToScroll : 1,
 			speed : 1000,
 			arrows : true,
 			dots : false,
 			autoplay : true,
 			autoplaySpeed : 4000,
 			pauseOnHover : false,
 			vertical : false,
 			prevArrow : $('.btn_prev'),
 			nextArrow : $('.btn_next'),
 			draggable : false,
 	    });
	}
	$('#contents').each(function(i,slide){
		i+=1;	
		var slickfor = $(slide).find('.list_slide').addClass('for'+ i)
		var slicknav = $(slide).find('.list_slide_items').addClass('nav'+ i)
		sliderSet(slickfor,slicknav);
	})
});

function TMaDA(){
	$.ajax({
		method:'POST',
		url : '${contextPath}/TMaDA',
		success:function(data){
			const kmoney=data.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			console.log(kmoney)
			const today = new Date();   
			const months = ["1.", "2.", "3.","4.", "5.", "6.", "7.", "8.", "9.", "10.", "11.", "12."];
			const date =today.getFullYear()+"."+months[today.getMonth()]+today.getDate()+"기준"
			console.log(date)
			document.getElementById('kmoney').innerHTML=kmoney;
	          document.getElementById('kdate').innerHTML=date;
		}
	})
}
</script>
</html>