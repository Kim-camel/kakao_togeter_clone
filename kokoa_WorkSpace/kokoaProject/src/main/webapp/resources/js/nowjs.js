var sort,topic;
sort = 0;
topic = 0;

var nowList = function(sort, topic) {
	var sendData = {'sort':sort, 'topic':topic};
	console.log(sendData);
	
 	$.ajax({
		url : '/donation/nowList',
		type : "get",
		dataType : "json",
		data : sendData,
		contentType: "application/json",
		timeout: 3000,
		success : function(data) {
			console.log(data.length);
			$(".list_fund").empty();
			var str = "";
			if(data.length != 0){
				data.forEach(function(dto){
					var td = dto.tdTarget.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					str += "<li><a class='link_pack'"+"href=\'/donation/fund/"+dto.dNo+"\'>";
					str += "<span class='box_thumb'>";
					str += "<span class='img_thumb' style="+"\"background-image: url(\'/image/"+dto.dtImg+"\')"+"\"></span>";
					str += "</span><span class='box_together'>";
					str += "<span class='bundle_tit'><strong class='tit_together ellipsis_type1'><span class='tag_bundle'></span>";
					str += dto.dTitle+"</strong><span class='txt_proposer'>";
					str += "</strong><span class='txt_proposer'>";
					str += dto.dCop+"</span></span><span class='wrap_state'></span>";
					str += "<span class='price_goal'>"+td+"</span></span></a></li>";
				})
			}else{
				str += "<div class='fund_txt'>";
				str += "<h3 class='link_gnb'>모금중인 활동이 없어요!!.</h3>";
				str += "</div>";
			}
			$(".list_fund").append(str);
		},
		error: function(e){
			console.log(e);
		}
	});  
}

$(document).ready(function(){
	$(document).on('click', '.list_tab a', function(){
		var href = $(this).attr('href');
		console.log(href);
		if(href == '/donation/epilogue'){
			document.title = '모금후기 : 코코아같이가치';
			sort = 3;
		} else if(href == '/donation/now'){
			document.title = '모금중 : 코코아같이가치';
			sort = 0;
		}
		history.pushState(null, null, href);
		$('#contents').load(href+' #mArticle')
		nowList(sort,0);
		event.preventDefault();
	})
});

$(document).ready(function(){	
	$(document).on("click", '.inp_sort', function(){
		$('.inp_sort').parent('.box_sorting').removeClass('sort_on');
		$(this).parent('.box_sorting').addClass('sort_on');
		var radioCheck = $(this).attr('id'); 
		if(topic == null){
			topic = 0;
		}
		if(radioCheck == 'sort1'){
			nowList(1,topic);
		} else if(radioCheck == 'sort2'){
			nowList(2,topic);
		} else if(radioCheck == 'sort3'){
			nowList(3,topic);
		}
	})
	$(document).on("click", '.list_cate a', function(){
		$('.inp_sort').parent('.box_sorting').removeClass('sort_on');
		$('#sort1').parent('.box_sorting').addClass('sort_on');
		topic = $(this).attr('id');
		if(topic == null){
			topic = 0;
		}
        $('.list_cate a').parent('li').removeClass('on');
		$(this).parent('li').addClass('on');

			console.log()
			nowList(0,topic);
	});
});