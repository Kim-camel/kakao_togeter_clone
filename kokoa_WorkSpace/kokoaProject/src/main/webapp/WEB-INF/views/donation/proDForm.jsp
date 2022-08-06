<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제안하기 : 코코아같이가치</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/ckeditor/ckeditor.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">

</head>
<body>
<div id="dkWrap">
<header><%@ include file="../default/header.jsp" %></header>
<div id="contents">
	<div class="table">
	<form id="dFrmChk" action="dFormRegister" method="post" enctype="multipart/form-data">
		<div id="wrap">
			<table id="proD_Form">
				<tr>
					<th class="text_gnb"><span>작성자</span></th>
					<td class="bottom_line"><input readonly="readonly" id="pdId" name="pdId" value="${loginUser}"></td>
				</tr>
				<tr>
					<th class="text_gnb"><span>팀명</span></th>
					<td class="bottom_line"><input id="pdCop" name="pdCop" ></td>
				</tr>
				<tr>
					<th class="text_gnb">카테고리 분류</th>
					<td class="bottom_line" style="width: 30%">
						<select id="pdtSep" name="pdtSep">
							<option value=0>주제 선택</option>
							<option value=11>어린이</option>
							<option value=12>동물</option>
							<option value=13>환경</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="text_gnb"><span>제목</span></th>
					<td class="bottom_line"><input type="text" id="pdTitle" name="pdTitle" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<th class="text_gnb">썸네일 등록</th>
					<td class="bottom_line"><input type="file" id="pdtImg" name="pdtImg" onchange="readURL(this)" accept="image/gif, image/jpeg, image/png">
					<img id="preview" src="#" width="100" height="100" alt="선택 이미지 없음"></td>
				</tr>
				<tr>
					<th colspan="2" class="text_gnb">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="bottom_line"><textarea style="height:300px; width: 400px;" id="pdContent" name="pdContent" placeholder="내용을 입력해주세요">${dForm.pdContent }</textarea>
							<script>CKEDITOR.replace('pdContent',{
								 width:'100%',
						         height:'300px',
						         filebrowserUploadUrl: "/donation/fileupload",
						         });
				         </script>
					</td>
				</tr>
				<tr>
					<th class="text_gnb">시작일</th>
					<td class="bottom_line">
						<input type="text" id="pdsDate" name="pdsDate" placeholder="날짜를 선택해 주세요.">
					</td>
				</tr>
				<tr>
					<th class="text_gnb">종료일</th>
					<td class="bottom_line">
						<input type="text" id="pdeDate" name="pdeDate" placeholder="날짜를 선택해 주세요.">
					</td>
				</tr>
		
			</table>
			
			<div class="submit_box">
				<a href="#" onclick="return chk_form()" class="link_gnb">
					<b>등록하기</b>
				</a>
				<a class="link_gnb" href="javascript:history.back();">
					<b>취소하기</b>
				</a>
			</div>
		</div>
	</form>
	</div>
</div>
<%@ include file="../default/footer.jsp" %>
</div>
</body>
<script>

function chk_form() {
	if(document.getElementById("pdCop").value==0){
		alert("활동 팀명을 입력해 주세요.");
		$("#pdCop").focus()
		return false;
	}
	if(document.getElementById("pdtSep").value==0){
		alert("카테고리를 선택해 주세요.");
		$("#pdtSep").focus()
		return false;
	}
	if(document.getElementById("pdTitle").value==''){
		alert("제목을 입력해 주세요.");
		$("#pdTitle").focus()
		return false;
	}
	if(document.getElementById("pdtImg").value==''){
		alert("대표 이미지를 넣어주세요.");
		return false;
	} 
	
	if(document.getElementById("pdsDate").value==''){
		alert("날짜를 선택해 주세요.");
		$("#pdsDate").focus()
		return false;
	}
	if(document.getElementById("pdeDate").value==''){
		alert("날짜를 선택해 주세요.");
		$("#pdeDate").focus()
		return false;
	}

	
	document.getElementById('dFrmChk').submit();
}
function readURL(input){
	let file = input.files[0]
	console.log(file)
	if(file != ""){
	let reader = new FileReader();	
	reader.readAsDataURL(file);
	reader.onload = function(e){ 
		$("#preview").attr('src', e.target.result);
	}
	}
}

$(document).ready(function () {            
$.datepicker.setDefaults($.datepicker.regional['ko']);
$( "#pdsDate" ).datepicker({                 
	changeMonth: true,                  
	changeYear: true,
	nextText: '다음 달',
	prevText: '이전 달',
	dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	dateFormat: "yy-mm-dd",
	minDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	onClose: function( selectedDate ) { //시작일(startDate) datepicker가 닫힐때
	//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
	$("#pdeDate").datepicker( "option", "minDate", selectedDate );
	}
	});
	$( "#pdeDate" ).datepicker({
		changeMonth: true,
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dateFormat: "yy-mm-dd",
		maxDate: 732, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
		onClose: function( selectedDate ) { // 종료일(endDate) datepicker가 닫힐때 
			// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
		$("#pdsDate").datepicker( "option", "maxDate", selectedDate );
		}
	});
});

</script>
</html>