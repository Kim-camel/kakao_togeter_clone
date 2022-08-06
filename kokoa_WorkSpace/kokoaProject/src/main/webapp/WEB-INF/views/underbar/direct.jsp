<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>
<donation-modal>
<modal>
<div tabindex="0" role="dialog" class="ngdialog-content off_modal" id="modal" >
<!-- <div tabindex="0" role="dialog" class="ngdialog-content opened_modal" id="modalON" > -->
<modal-content>
<div class="inner_together_layer inner_together_layer6">
<div class="layer_head">
</div>
<div class="layer_body">
<form novalidate="" name="form" class="form_manage ng-untouched ng-pristine ng-valid">
<fieldset>
<div class="wrap_fund">
<!---->
<dl class="list_pay">
<dt class="cate_write cate_fund">
<span>
기부금 결제
</span>
</dt>
<!---->
<dd class="info_write info_fund">
<p class="txt_info"> 무통장은 3천원, 기타 결제는 1천원부터 가능합니다. </p>
<!---->
<div class="box_digit">
<button type="button" data-money=100 class="btn_digit dmoney">
 + 1백원
 </button>
 <button type="button" data-money=1000 class="btn_digit dmoney">
  + 1천원
  </button>
  <button type="button" data-money=5000 class="btn_digit dmoney">
   + 5천원
   </button>
   <button type="button" data-money=10000 class="btn_digit dmoney">
    + 1만원
    </button>
    <button type="button" data-money=50000 class="btn_digit dmoney">
     + 5만원
     </button>
     <button type="button" data-money=100000 class="btn_digit dmoney">
      + 10만원
      </button>
      <button type="button" data-money=500000 class="btn_digit dmoney">
       + 50만원
       </button>
       <button type="button" data-money=0 class="btn_modify dmoney" > 
       다시 입력 
       </button>
       </div>
<div class="wrap_tf">
<em class="num_point" id=dPrice>
0
</em>
원 
</div>
<!---->
</dd>
<!---->
<dt class="cate_write cate_reply">
<label for="tfReply">
응원댓글 쓰기
</label>
</dt>
<dd class="info_write info_reply">
<div class="wrap_tf">
<textarea id="tfReply" cols="30" rows="10" name="comment" onkeyup="writedirCount(this)"placeholder="따뜻한 한마디를 남겨주세요." class="tf_write tf_reply ng-untouched ng-pristine ng-valid">
</textarea>
<span class="txt_limit">
<span class="num_now" id="num_now_direct">
0
</span>
/300 
</span>
</div>
</dd>
</dl>
<div class="box_select">
<span class="choice_comm choice_checkbox">
<label for="checkAnonymous" class="lab_comm">
응원에 감사합니다♡
</label>
</span>
<span class="choice_comm choice_checkbox">
</span>
</div>
<p class="txt_msg"> 
결제 수수료는 카카오가 대신 부담합니다. 
<br>
결제완료 알림은 카카오톡으로 발송해드려요. 
</p>
<!---->
<!---->
<!---->
</div>
<div class="wrap_btn wrap_btn_type">
<button type="button" class="btn_set btn_type1" id=dirinsert>
 결제하기 
 </button>
 </div>
 </fieldset>
 </form>
 </div>
 <div class="layer_foot">
 <button type="button" class="btn_close">
 <span class="ico_together">
 닫기
 </span>
 </button>
 </div>
 </div>
 </modal-content>
 </div>
 </modal>
 </donation-modal>
<!--  <div class="dimmed_layer on" style="height: 100%; position: fixed; top: 0px; left: 0px; right: 0px; display: block;"></div> -->
</body>
<script type="text/javascript">
$(function(){
	
	$('#dirinsert').on('click',directInsert);
	
	$(document).on("click",".btn_give", function() {
		$('#modal').removeClass('ngdialog-content off_modal').addClass('ngdialog-content opened_modal emphasized');
	});
	$(document).on("click",".btn_close", function() {
		$('#modal').removeClass('ngdialog-content opened_modal').addClass('ngdialog-content off_modal');
	});
	
	var changePrice=0;
	$(document).on("click",".dmoney",function(){
	var count=$(this).attr("data-money")
	if(count==100){
		changePrice+= 100;
	}else if(count==1000){
		changePrice+= 1000;
	}else if(count==5000){
		changePrice+= 5000;
	}else if(count==10000){
		changePrice+= 10000;
	}else if(count==50000){
		changePrice+= 50000;
	}else if(count==100000){
		changePrice+= 100000;
	}else if(count==500000){
		changePrice+= 500000;
	}else if(count==0){
		changePrice= 0;
	}
	changePrice;
// 	console.log(changePrice)
const commamoney = changePrice.toString()
.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

	document.getElementById('dPrice').innerHTML=commamoney;
	
	})
	
})

function directInsert(){
	var money=$('#dPrice').text();
// 	console.log(money)
	    var bno= ${doForm.dNo}
	    var writer='${loginUser }'
	    var content =$("#tfReply").val()
	    if (money==0){
	        alert("금액을 선택해주세요!")
	        $("#content").focus();
	        return;
	    }
	    if (content.trim().length==0){
	        alert("댓글을 입력해주세요!")
	        $("#content").focus();
	        return;
	    }
	   
	    var comment = {"bno": bno,"writer":writer,"content" :content, "money":money};
	    $.ajax({
	        url:'${pageContext.request.contextPath}/commentInsert',
	        method:'POST',
	        data : JSON.stringify(comment),
	        contentType : 'application/json; charset=UTF-8',
	        success: function(){
	        	participateDonation()
	            $('#tfReply').val("");
	            $('#list_cmt').empty().append();
	            $('#modal').removeClass('ngdialog-content opened_modal').addClass('ngdialog-content off_modal');
	            document.getElementById('dPrice').innerHTML=0;
	            startIndex=0;
	       	 	searchStep=5;
	            init(startIndex,searchStep)
	            $("#addbtn").show()
	        }
	    })
	}

function writedirCount(text){
	var str= text.value.length;
	if (str>300){ 
		alert("최대 입력 수를 초과하였습니다")
		text.value.substring(0, 300);
		text.focus();
	}
	document.getElementById('num_now_direct').innerHTML =text.value.length;
}
</script>
</html>