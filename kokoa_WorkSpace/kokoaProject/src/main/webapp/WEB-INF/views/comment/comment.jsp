<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<!--Start Body-->
<body>

<div class="wrap_cmt cmt_type3">
<div class="write_cmt">
<div class="inner_write">
<div class="info_append">
<!--Start Insert-->
<span class="txt_heading">코코아 지원 댓글 기부금 </span>
<span class="emph_sign" id="totalMoney">
0원
</span>
</div>

<a class="link_profile" href="#">
<img alt="프로필사진" class="img_thumb" src="https://t1.kakaocdn.net/together_image/common/avatar/avatar05.png">
</a>

<div class="cmt_info">
<div class="txt_cmt">
<fieldset class="fld_cmt">
<textarea name="txtCmt" id="txtCmt" class="tf_cmt ng-untouched ng-pristine ng-valid" onkeyup="writecomCount(this)" placeholder="댓글만 써도 코코아가 대신 기부합니다. 같이가치해요♡" maxlength="500" style="height: 44px; overflow: hidden;">
</textarea>
<div id="together_emoticon_area" class="inp_emot" style="display: none;">
<div class="box_icon">
<img id="together_thumb_emoticon" alt="이모티콘" class="img_thumb" src="">
<a class="ico_together2 btn_del">삭제</a>
</div>
</div>
<button type="button" class="btn_emot">
<span class="ico_together2 ico_emot"></span> 
이모티콘 
</button>
<div class="emoticon_layer">
</div>
<span class="txt_limit">
<span class="num_now"id=nom_now_comment>
0
</span>
/500 
</span>
<button type="button" class="btn_comment" id="btn_comment"> 등록 </button>
</fieldset>
</div>
</div>
</div>
</div>
<div class="wrap_info">
<div class="inner_info">
<!--Start Comment Line-->
<span class="txt_cmt">
댓글 
<span class="emph_sign" id="emph_sign">
0
</span>
</span>
<div class="wrap_sort">
<!-- <input type="checkbox" id="inpSort" name="donatorOnly" class="inp_sort ng-untouched ng-pristine ng-valid"> -->
<!-- <label for="inpSort" class="lab_sort"> -->
<!-- <span class="ico_together ico_sort"> -->
<!-- </span> -->
<!-- 직접기부자만 보기 -->
<!-- </label> -->
</div>
</div>
</div>
<!--Start Comment Ul-->
<ul class="list_cmt" id="list_cmt">

<!--Start Comment Li-->

</comment>
<!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!---->
</ul>
<!---->
<div class="list_more">
<!--Start Show More-->
<button type="button" class="link_round link_other2" id="addbtn"> 더보기 </button>
</div>
</div>
</comments>
<%-- <%@ include file="/WEB-INF/views/underbar/underbar.jsp" %> --%>
</body>
<!--Start Script-->
<script type="text/javascript">
function pageTotalMoney(){
   var bno = ${doForm.dNo}
   $.ajax({
      url:"${contextPath}/pageTotalMoney",
      type:'get',
      data:{'bno':bno},
      success:function(totalMoney){
//          console.log(totalMoney)
         const CTM= totalMoney.toString()
.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         document.getElementById('totalMoney').innerHTML=CTM+"원";
      }
   })
}

function writecomCount(text){
   var str= text.value.length;
   if (str>500){ 
      alert("최대 입력 수를 초과하였습니다")
      text.value.substring(0, 500);
      text.focus();
   }
   document.getElementById('nom_now_comment').innerHTML =text.value.length;
}

//입력
function commentInsert(){
   
    var bno= ${doForm.dNo}
    var writer='${loginUser }'
    var content =$("#txtCmt").val()
    if   (${loginUser == null}){
       alert("로그인 먼저 진행해주세요!")
       location.href='${pageContext.request.contextPath}/UserInfo/login'
       return;
    }
    if (content.trim().length==0){
        alert("댓글을 입력해주세요!")
        $("#content").focus();
        return;
    }
    var comment = {"bno": bno,"writer":writer,"content" :content};
    $.ajax({
        url:'${pageContext.request.contextPath}/commentInsert',
        method:'POST',
        data : JSON.stringify(comment),
        contentType : 'application/json; charset=UTF-8',
        success: function(){
            $('#txtCmt').val("");
            $('#list_cmt').empty().append();
            startIndex=0;
              searchStep=5;
            init(startIndex,searchStep)
            $("#addbtn").show()
        }
    })
}

    var startIndex=0;
    var searchStep=5;
//입력
$(function(){
$('#btn_comment').on('click',commentInsert);
$('#addbtn').click(function(){
   startIndex+=searchStep;
   init(startIndex,searchStep)
})
   
init(startIndex,searchStep)
})

//첫 1회 실행 ,{once:true})
// function is(){
//    init(startIndex);

//목록출력
function init(startIndex,searchStep){
   pageTotalMoney()
   participateDonation()
   var bno = ${doForm.dNo}
    
   let endIndex=startIndex+searchStep;
    sendData={"bno":bno,
             "startIndex":startIndex,
            "endIndex":endIndex
           },
    $.ajax({
        data : sendData,
        method :'POST',
        url: '${pageContext.request.contextPath}/commentList',
        success : function(data){
           output(data)
//            console.log("data")
//            console.log(data)
        }
    })
}
// }

function output(data){
         var cnt='';
         if(data.length!=0){
            cnt+=(data[0].cnt);
            $("#emph_sign").empty().append(cnt);
         }
//          console.log(cnt)
           var result ='';
//            console.log(data)
           if(cnt==0)
                result +="<div class='nontxt'><b>댓글이없습니다</b><div>"
            $.each(data,function(index, item){
               const currentTime = new Date().getTime();
                  const inputTime = item['commentDate'];
                  const diffTime = (currentTime - inputTime)/1000;
                  var postTime;
//              console.log('현재시간')
//             console.log(currentTime)
//             console.log('입력시간')
//             console.log(inputTime)
//             console.log('결과시간')
//             console.log(diffTime)
                  switch(true) {
                  case diffTime < 60:
                  postTime = '방금전'; 
                  break;
                  case diffTime < 3600:
                  postTime = parseInt(diffTime/60) +'분 전';
                  break;
                  case diffTime < 86400:
                  postTime = parseInt(diffTime/3600) + '시간 전';
                  break;
                  case diffTime < 604800:
                  postTime = parseInt(diffTime/86400) + '일 전';
                  break;
                  case diffTime > 604800:
                  const unixTime=item['commentdate'];
                const date = new Date(unixTime);
                const months = ["1월", "2월", "3월","4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
                const formatDate = (date)=>{
                    const formatted_date =date.getFullYear()+"년"+" "+months[date.getMonth()]+" "+date.getDate()+"일"
                    return formatted_date;
                }
                  postTime = formatDate(date);
                  break;
                  return postTime;
                  }
                  var name = item["writer"];
                  writer = name.replace(/(?<=.{3})./gi, "*");
           result +='<li>'
           result +='<button type="button" class="link_profile">'
           result +='<img class="img_thumb" src="https://t1.kakaocdn.net/together_image/common/avatar/avatar05.png" alt="프로필">'
           result +='</button>'
           
           result +='<div class="cmt_info">'
           result +='<span class="info_append">'
           result +='<strong class="tit_nickname">'
           result +='<a href="#" class="link_nickname">'
           result +=writer //아이디 
           result +='</a>'
           result +='</strong>'
           result +='<span class="txt_money">'   
           if(item["money"]==0){
         result +='&nbsp; 댓글 기부 참여 완료!'              
           }else{
           result +='&nbsp;'+item["money"]+'원 기부'   // 기부금액
           }
           result +='</span>'   
           result +='</span>'   
           
           result +='<span class="txt_cmt">'   
           result +='<span class="desc_cmt">'   
           result +=item["content"]   //텍스트 내용
           result +='</span>'   
           result +='<span class="emoticon_pack">'   
           result +='</span>'   
           result +='</span>'   
           
           result +='<span class="info_append">'   
           result +='<span class="txt_time">'   
           result +=postTime   //시간
           result +='</span>'   
           
           result +='<like-comment>'   
           
           <c:if test="${not empty sessionScope.loginUser}">
            if(item['reHeart']==1){
           result += "<button type = 'button' class='btn_like on taa' id='heartImg"+item['cno']+"' data-cre='"+item['cno']+"'value= '"+item['cno']+"'>"
             }else if(item['reHeart']==0){
            result += "<button type = 'button' class='btn_like taa' id='heartImg"+item['cno']+"' data-cre='"+item['cno']+"'value= '"+item['cno']+"'>"
             }
            </c:if>
            <c:if test="${empty sessionScope.loginUser}">
               result += "<button type = 'button' class='btn_like nl'>"
            </c:if>
               
           result +='<span class="ico_together ico_like">'    //좋아요 버튼
           result +='</span>'   
           result +='&nbsp;좋아요&nbsp;'   
           result +='<span class="num_like" id="hcnt'+item["cno"]+'">'   
           result +=item["heartTotal"]
           result +='</span>'   
           result +='</button>'   
           result +='</like-comment>'   
           
           if("${sessionScope.loginUser}" == item["writer"]){
            result +="<button type = 'button' class='btn_delete' data-del= '"+item['cno']+"'>"
            result +='삭제'
            result +='</button>'
            }else{
            result +="<button type = 'button' class='btn_report'>"
            result +='신고'
            result +='</button>'
            }
           result +='</span>'   
           result +='</div>'   
           result +='</li>'   
           result +='</comment>'   
            });
                
            $("#list_cmt").append(result);
            $("button:button.btn_delete").on('click',commentDelete)
             if(data.length<5){
               $("#addbtn").hide();
            
             }
           
        }
//삭제

function commentDelete(){
    var cno = $(this).attr("data-del");
    var sendData = {"cno": cno}
//       console.log("Delete")
//     console.log(cno)
    $.ajax({
        method: 'GET',
        url : '${pageContext.request.contextPath}/commentDelete',
        data : sendData,
        success:function(){
           var startIndex=0;
           var searchStep=5;
           $('#list_cmt').empty()
           startIndex=0;
              searchStep=5;
           init(startIndex,searchStep)
           $("#addbtn").show()
        }
           
    })
}
$(document).on("click",".nl",function(){
   alert("로그인 먼저 하세요")
   location.href = '${pageContext.request.contextPath}'
})

$(function() {
$(document).on("click",".taa", function() {
//          console.log('클릭성공')
   var cno = $(this).attr("data-cre");
//          console.log(cno)
//          console.log('#heartImg'+cno)
   var bno = ${doForm.dNo}
   $.ajax({
      url: "${pageContext.request.contextPath}/like",
      type: 'get',
      data: { 'bno':bno, 'heartWriter':'${loginUser }', 'cno':cno}, 
      
      success: function (heresult) {
//              console.log(heresult)
             heartTotal()
             if (heresult != 1) {
             $('#heartImg'+cno).removeClass('btn_like taa').addClass('btn_like on taa');
             
          } else {

               $('#heartImg'+cno).removeClass('btn_like on taa').addClass('btn_like taa');
             
          } 
      }, error: function () {
//           console.log('클릭실패')
      }
  });     
        function heartTotal(){
           
        
         $.ajax({
            url: "${pageContext.request.contextPath}/heartTotal",
            type: 'get',
            data: {'cno':cno, 'bno':bno}, 
            success: function (heartTotal) {
//                console.log("heartTotal")
//                console.log(heartTotal)
            $('#hcnt'+cno).empty().append(heartTotal);
            }, error: function () {
//             console.log('갯수불러오기 실패')
            }
            });             
        }
         
  });
});
// $(document).on("click",".taa", function() {
//      console.log('클릭성공')
// var cno = $(this).attr("data-cre");
 
// });


</script>

</html>