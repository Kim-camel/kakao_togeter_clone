<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="shortcut icon" href="../../resources/favicon.ico">
<style type="text/css">

</style>
</head>
<body>
<div id="dkWrap">
<header><%@ include file="../default/header.jsp" %></header>
<div id="contents">
<span id="rootContent">

<div id="dkContent" class="cont_declare">
<div id="mArticle">
<div class="wrap_project wrap_profile">
<div class="cont_thumb">
<div class="file_upload">
<img alt="프로필" class="img_thumb" src="https://t1.kakaocdn.net/together_image/common/avatar/avatar05.png">
</div>
<input type="file" id="profileInput" class="tf_attach" style="display: none;" accept="image/*, .jpg, .jpeg, .png, .gif, .bmp">
</div>
<form name="form1" method="post">
<div class="box_cont">
<dl class="list_write">
 <dt>아이디</dt>
 <dd>
 <div class="group_tf">
 <c:if test="${sessionScope.kakaoN ==null }">
<input type="text" id="subTitle" name="UId" value="${detail.UId }" readonly="readonly" class="tf_write ng-untouched ng-pristine ng-valid">
</c:if>
<c:if test="${sessionScope.kakaoN !=null }">
<input type="text" id="subTitle" name="UId" value="${sessionScope.kakaoN }" readonly="readonly" class="tf_write ng-untouched ng-pristine ng-valid">
</c:if>
</div>
</dd>
<div class="bg_dashline">
</div>

     <dt> 
     이름 
     <!---->
     </dt>
  <dd>
 <div class="group_tf">
<input type="text" name="UName" placeholder="${detail.UName }" value="${detail.UName }"class="tf_write ng-untouched ng-pristine ng-valid" id="mem_name">
<div class="eheck_font" id="name_check"></div>
</div>
</dd>
 <dt> 
  비밀번호
   <!---->
   </dt>
  <dd>
 <div class="group_tf">
<input type="password" name="UPwd" placeholder="암호화된 비밀번호 입니다" value="${detail.UPwd }"class="tf_write ng-untouched ng-pristine ng-valid" id="mem_pw">
<div class="eheck_font" id="pw_check"></div>
</div>
</dd>
<dt> 
연락처
 <!---->
 </dt>
 <dd>
 <div class="group_tf">
<input type="tel" name="UTel" placeholder="0${detail.UTel }"value="0${detail.UTel }"class="tf_write ng-untouched ng-pristine ng-valid" id="mem_phone">
<div class="eheck_font" id="phone_check"></div>
</div>
</dd>
  <dt> 
  이메일
   <!---->
   </dt>
  <dd>
 <div class="group_tf">
<input type="email"  name="UMail" placeholder="${detail.UMail }" value="${detail.UMail }"class="tf_write ng-untouched ng-pristine ng-valid" id="mem_email">
<div class="eheck_font" id="email_check"></div>
</div>
</dd>
     <dt> 
     생년월일 
     <!---->
     </dt>
  <dd>
 <div class="group_tf">
<input type="tel" name="UBirth" placeholder="${detail.UBirth }" value="${detail.UBirth }"class="tf_write ng-untouched ng-pristine ng-valid" id="mem_birth">
<div class="eheck_font" id="birth_check"></div>
</div>
</dd>
<dt> 
성별 
<!---->
</dt>
<dd>
<div class="group_tf group_gender">
<span class="choice_comm choice_btn">
<input type="radio" name="UGen" id="genderChk1" name="genderChk" class="inp_comm ng-untouched ng-pristine ng-valid" value="1">
<label for="genderChk1" class="lab_comm1">
남자
</label>
</span>
<span class="choice_comm choice_btn">
<input type="radio" name="UGen" id="genderChk2" name="genderChk" class="inp_comm ng-untouched ng-pristine ng-valid" value="2">
<label for="genderChk2" class="lab_comm1">
여자
</label>
</span>
</div>
</dd>
<dt> 
지역 
<!---->
</dt>
<dd class="phone_item">
<div class="group_tf">
<input class="tf_write ng-untouched ng-pristine ng-valid" style="width: 40%; display: inline;" name="UPostAddr"placeholder="${detail.UPostAddr }" value="${detail.UPostAddr }" id="mem_oaddress" type="text" readonly="readonly" >
	    <button type="button" class="btn_number" onclick="execPostCode()">
	    <i class="fa fa-search"></i>
	     우편번호 찾기
	     </button>                               
	<div class="form-groupmp">
	    <input class="tf_write ng-untouched ng-pristine ng-valid" name="URoadAddr" placeholder="${detail.URoadAddr }" value="${detail.URoadAddr }"type="text" readonly="readonly" id="mem_address" />
	</div>
	
	<div class="form-groupmp">
	    <input class="tf_write ng-untouched ng-pristine ng-valid" name="UDetailAddr" placeholder="${detail.UDetailAddr }" value="${detail.UDetailAddr }" type="text" id="mem_detailaddress"/>
	</div>
</div>
</dd>

<!-- 폼 종료  -->
</dl>
</div>
</form>
<div class="bg_dashline">
</div>
      <div class="btn_step_type">
      <button type="button" class="link_step link_type3" id="btnUpdate">
       저장하기 
       </button>
       
        <button type="button" class="link_step link_type3" id="btnDelete">
       탈퇴하기 
       </button>
	</div>

</div>
</div>
</div>

</span>
</div>	
<footer><%@ include file="../default/footer.jsp" %></footer>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

var birthJ = false;
var address = $('#mem_detailaddress');
$(document).ready(function() {
	if(${sessionScope.loginUser ==null }){
		alert("로그인 먼저 해주세요!")
		location.href="/index"
	}
	var address = $('#mem_detailaddress');
	 $('#mem_phone').blur(function(){
         if(phoneJ.test($(this).val())){
            console.log(nameJ.test($(this).val()));
            $("#phone_check").text('');
         } else {
            $('#phone_check').text('휴대폰번호를 확인해주세요 ');
            $('#phone_check').css('color', 'red');
         }
      });
	 var birthJ = false;
$('#mem_birth').blur(function(){
   var dateStr = $(this).val();      
    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear(); // 올해 연도 가져옴
   
    if (dateStr.length <=8) {
      // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
       if (year > yearNow || year < 1900 ){
          
          $('#birth_check').text('생년월일을 확인해주세요');
         $('#birth_check').css('color', 'red');
       }  
       else if (month < 1 || month > 12) {
             
          $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red'); 
       
       }else if (day < 1 || day > 31) {
          
          $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red'); 
          
       }else if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
          $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red'); 
       }else if (month == 2) {
             var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
             
           if (day>29 || (day==29 && !isleap)) {
              
              $('#birth_check').text('생년월일을 확인해주세요 ');
            $('#birth_check').css('color', 'red'); 
          
         }else{
            $('#birth_check').text('');
            birthJ = true;
         }
       }else{
          $('#birth_check').text(''); 
         birthJ = true;
      }//end of if
      }else{
         //1.입력된 생년월일이 8자 초과할때 :  auth:false
         $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red');  
      }
   }); 
   
$("#mem_email").blur(function() {
    if (mailJ.test($(this).val())) {
       $("#email_check").text('');
    } else {
       $('#email_check').text('이메일 양식을 확인해주세요.');
       $('#email_check').css('color', 'red');
    }
 });

$('#mem_pw').blur(function() {
    if (pwJ.test($('#mem_pw').val())) {
       console.log('true');
       $('#pw_check').text('');
    } else {
       console.log('false');
       $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
       $('#pw_check').css('color', 'red');
    }
 });
 
$("#mem_name").blur(function() {
    if (nameJ.test($(this).val())) {
       console.log(nameJ.test($(this).val()));
       $("#name_check").text('');
    } else {
       $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
       $('#name_check').css('color', 'red');
    }
 });
	 $(document).ready(function(){
	        $("#btnUpdate").click(function(){
	        	checkfu()
	        	 if(confirm("수정하시겠습니까?")){
	            document.form1.action = "/UserInfo/userUpdate";
	            document.form1.submit();
	        	 }
	        });
	    });
	 
	 $(document).ready(function(){
	        $("#btnDelete").click(function(){
	            if(confirm("삭제하시겠습니까?")){
	                document.form1.action = "/UserInfo/userDelete";
	                document.form1.submit();
	            }
	        });
	    });
});
function checkfu(){
     	var inval_Arr = new Array(6).fill(false);
         if (($('#mem_pw').val())) {
            inval_Arr[0] = true;
         } else {
            inval_Arr[0] = false;
            alert('비밀번호를 확인하세요.');
            return false;
         }
         // 이름 정규식
         if (nameJ.test($('#mem_name').val())) {
            inval_Arr[1] = true;   
         } else {
            inval_Arr[1] = false;
            alert('이름을 확인하세요.');
            return false;
         }
         // 생년월일 정규식
          if (birthJ) {
            console.log(birthJ);
            inval_Arr[2] = true; 
            alert('생년월일을 확인하세요.');x
         } else {
            inval_Arr[2] = false;
            return false;
         } 
         // 이메일 정규식
         if (mailJ.test($('#mem_email').val())){
            console.log(phoneJ.test($('#mem_email').val()));
            inval_Arr[3] = true;
         } else {
        	 
            inval_Arr[3] = false;
            alert('이메일을 확인하세요.');
            return false;
         }
         // 휴대폰번호 정규식
         if (phoneJ.test($('#mem_phone').val())) {
            console.log(phoneJ.test($('#mem_phone').val()));
            inval_Arr[4] = true;
         } else {
            inval_Arr[4] = false;
            alert('휴대폰 번호를 확인하세요.');
            return false;
         }
         //성별 확인
          if(member.mem_gender[0].checked==false&&member.mem_gender[1].checked==false){
                 inval_Arr[5] = false;
               alert('성별을 확인하세요.');
               return false;
             
         } else{
            inval_Arr[5] = true;
         } 
}
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
           $("[name=mem_oaddress]").val(data.zonecode);
           $("[name=mem_address]").val(fullRoadAddr);
           
           document.getElementById('mem_oaddress').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('mem_address').value = fullRoadAddr;

           //document.getElementById('mem_detailaddress').value = data.jibunAddress; 
       }
    }).open();
}

</script>
</html>