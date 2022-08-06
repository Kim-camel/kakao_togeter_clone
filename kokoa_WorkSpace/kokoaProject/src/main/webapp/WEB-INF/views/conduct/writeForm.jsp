<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"
		 value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 : 코코아같이가치</title>
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
	<form id="wFrmChk" action="coFormRegister" method="post" enctype="multipart/form-data">
		<div id="wrap">
			<table id="proD_Form">
				<tr>
					<th class="text_gnb">카테고리 분류</th>
					<td class="bottom_line">
						<select id="coSep" name="coSep">
							<option value=0>태그 선택</option>
							<option value=11>그린디지털</option>
							<option value=12>에너지절약</option>
							<option value=13>작은가게가치</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="text_gnb"><span>팀명</span></th>
					<td class="bottom_line"><input id="coCop" name="coCop" ></td>
				</tr>
				<tr>
					<th class="text_gnb"><span>제목</span></th>
					<td class="bottom_line"><input type="text" id="coTitle" name="coTitle" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<th class="text_gnb">썸네일 등록</th>
					<td class="bottom_line"><input type="file" id="coImg" name="coImg" onchange="readURL(this)" accept="image/gif, image/jpeg, image/png">
					<img id="preview" src="#" width="100" height="100" alt="선택 이미지 없음"></td>
				</tr>
				<tr>
					<th colspan="2" class="text_gnb">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="bottom_line"><textarea style="height:300px; width: 400px;" id="coContent" name="coContent" placeholder="내용을 입력해주세요">${dForm.pdContent }</textarea>
							<script>CKEDITOR.replace('coContent',{
								 width:'100%',
						         height:'300px',
						         filebrowserUploadUrl: "/donation/fileupload",
						         });
				         </script>
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
	if(document.getElementById("coSep").value==0){
		alert("카테고리를 선택해 주세요.");
		$("#coSep").focus()
		return false;
	}
	if(document.getElementById("coCop").value==0){
		alert("활동 팀명을 입력해 주세요.");
		$("#coCop").focus()
		return false;
	}
	if(document.getElementById("coTitle").value==''){
		alert("제목을 입력해 주세요.");
		$("#coTitle").focus()
		return false;
	}
	if(document.getElementById("coImg").value==''){
		alert("대표 이미지를 넣어주세요.");
		return false;
	}
	document.getElementById('wFrmChk').submit();
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

</script>
</html>