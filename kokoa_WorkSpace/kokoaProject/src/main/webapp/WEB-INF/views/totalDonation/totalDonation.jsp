<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="shortcut icon" href="../../resources/favicon.ico">
</head>

<body>
   <div class="info_story">
   </div>
   <div class="info_state">
      <span class="total_fund" id="TD">
0
       <span class="txt_won">
            원 
            </span>
      </span> 
      <span class="txt_goal" id="TG"> 
      </span>
      <div id="animate-area" class="chart_fund pack_type2">
         <span class="progress_road"> 
 <span class="mark_pack"> 
 <span class="inner_mark_pack"> 
 <span class="mark_point"id="perbike1"style="left: 30%;"> 
 <span class="ico_chart txt_result">
                        <span class="num_per" id="PER">
                         
                         </span> 
                         <span class="txt_per">
                           % 
                           </span>
                  </span>
               </span>
            </span>
         </span>
         </span> 
         <span class="graph_road"> 
         <span class="graph_bar"> 
         <span class="inner_graph_bar"> 
         <span class="sign_graph" id="perbike2" style="width: 30%;"> 
         </span>
            </span>
         </span>
         </span>
      </div>
      <dl class="detail_fund">
         <dt class="tit_fund" id="DDP">
         </dt>
         <dd class="txt_fund" id="DDM">
         </dd>
         <dt class="tit_fund" id="PDP">
         </dt>
         <dd class="txt_fund" id="PDM">
         </dd>
      </dl>
      <dl class="detail_fund fund_belong">
         <dt class="tit_fund" id="CDP">
         </dt>
         <dd class="txt_fund" id="CDM">
         </dd>
         <dt class="tit_fund" id="SDP">
         </dt>
         <dd class="txt_fund" id="SDM">
         </dd>
         <dt class="tit_fund" id="COP">
         </dt>
         <dd class="txt_fund" id="COM">
         </dd>
      </dl>
      <dl class="detail_fund">
      </dl>
   </div>
</body>
<script type="text/javascript">
$(function(){
    participateDonation();
});
 
function participateDonation(){
    var bno=${doForm.dNo};
    var donation ={"bno": bno};
    $.ajax({
       url:'${contextPath}/participateDonation',
       method:'POST',
       data : donation,
       success: function(data){
         const TG=${doForm.tdTarget }..toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const TD= data[0].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const DDP= data[1].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const DDM= data[2].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const PDP= data[3].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const PDM= data[4].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const CDP= data[5].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const CDM= data[6].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const SDP= data[7].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const SDM= data[8].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const COP= data[9].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         const COM= data[10].toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
         
         const result=data[0]/ ${doForm.tdTarget }*100
         var PER = Math.trunc(result)
          document.getElementById('TD').innerHTML=TD;
          document.getElementById('TG').innerHTML=TG+'원 목표';
          document.getElementById('PER').innerHTML=PER;

          document.getElementById('DDP').innerHTML='직접기부 ('+DDP+'명)';
          document.getElementById('DDM').innerHTML=DDM+"원";
          
          document.getElementById('PDP').innerHTML='참여기부 ('+PDP+'명)';
          document.getElementById('PDM').innerHTML=PDM+"원";
          
          document.getElementById('CDP').innerHTML='ㄴ 응원기부 ('+CDP+'명)';
          document.getElementById('CDM').innerHTML=CDM+"원";
          
          document.getElementById('SDP').innerHTML='ㄴ 공유기부 ('+SDP+'명)';
          document.getElementById('SDM').innerHTML=SDM+"원";
          
          document.getElementById('COP').innerHTML='ㄴ 댓글기부 ('+COP+'명)';
          document.getElementById('COM').innerHTML=COM+"원";
          console.log(PER)
            document.getElementById('perbike1').style.left = PER+"%";
             document.getElementById('perbike2').style.width =PER+"%"
          }
          
    });
 }
</script>
</html>