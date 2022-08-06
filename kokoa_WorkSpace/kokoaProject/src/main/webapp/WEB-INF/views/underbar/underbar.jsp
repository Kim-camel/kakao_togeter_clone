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
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>
<body>
<div class="fund_float" id="underbar">
<button type="button" class="btn_g btn_cheer" id="ubheart">
<span class="ico_together ico_cheer">
</span>
<span class="txt_float txt_cheer">
응원
<span class="num_active" id="hcount">
</span>
</span>
</button>
<button type="button" class="btn_g" id="ubshare">
<span class="ico_together ico_share">
</span>
<span class="txt_float txt_share">
공유
<span class="num_active" id="scount">
</span>
</span>
</button>
<button type="button" class="btn_g btn_give">
<span>
<span>
<span class="ico_give">
</span>
<span class="txt_float txt_give">
기부하기
</span>
</span>
</span>
</button>
</div>
<%@ include file="/WEB-INF/views/underbar/direct.jsp" %>
</body>
<script type="text/javascript">

$(function(){
   
   $(window).scroll(function(){
      var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
        if (scrollBottom < $('#ubfooter').height()+200) {
        $("#underbar").addClass('btn_static');
        } else {
        $("#underbar").removeClass('btn_static');
        }
});
   
   underbarStart()
   underbarCount()
   
      $(document).on("click","#ubheart",function(){
      if(${loginUser == null}){
         alert("로그인 먼저 진행해주세요!")
          location.href='${pageContext.request.contextPath}/UserInfo/login'
          return;
      }
//       console.log("underbar heart click success")
      var bno= ${doForm.dNo}
      var ubWriter="${loginUser }";
      var check=1
      var sendData={"bno":bno, "ubWriter":ubWriter, "check":check};
//       console.log(sendData)
      $.ajax({
         url:"${contextPath}/ubform",
         type:'post',
         data:sendData,
         success: function(result){
            $('#ubheart').removeClass('btn_g btn_cheer').addClass('btn_g btn_cheer on');
//             console.log("언더바하트성공")
            alert("응원이 완료 되었습니다.")
            underbarCount()
         },
         error: function(){
//             console.log("언더바하트실패")
         }
      });
   });
   
   $(document).on("click","#ubshare",function(){
      if(${loginUser == null}){
         alert("로그인 먼저 진행해주세요!")
          location.href='${pageContext.request.contextPath}/UserInfo/login'
          return;
      }
      var bno=${doForm.dNo}
      var ubWriter="${loginUser }";
      var check=2
      var sendData={"bno":bno, "ubWriter":ubWriter, "check":check};
      $.ajax({
         url:"${contextPath}/ubform",
         type:'post',
         data:sendData,
         success: function(){
            underbarCount()
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = window.document.location.href;
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
            alert("URL이 복사되었습니다.")
         },
         error: function(){
//             console.log("언더바공유실패")
         }
      });
   });
   
});
function underbarStart(){
   var bno=${doForm.dNo}
   var ubWriter="${loginUser }";
   var sendData={"bno":bno, "ubWriter":ubWriter};
   $.ajax({
      url:"${contextPath}/ubhCheck",
      type:'post',
      data:sendData,
      success: function(result){
//          console.log("언더바체크성공")
//          console.log(result)
         if(result==1){
            $('#ubheart').removeClass('btn_g btn_cheer').addClass('btn_g btn_cheer on');   
//             console.log("언더바체크변환성공")
         }
      },
      error: function(){
//          console.log("언더바체크실패")
      }
   });
}
function underbarCount(){
   var bno=${doForm.dNo}
   $.ajax({
      url:"${contextPath}/ubCount",
      type:'get',
      data:{"bno":bno},
      success:function(data){
         const sc=data.sc
         const hc=data.hc
         document.getElementById('hcount').innerHTML=hc;
         document.getElementById('scount').innerHTML=sc;
      },
      error:function(){
//          console.log("언더바카운트실패")
      }
   })
}

</script>
</html>