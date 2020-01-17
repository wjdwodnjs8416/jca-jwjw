// 숫자만 입력
function inNumber(){
    if(event.keyCode<48 || event.keyCode>57){
       event.returnValue=false;
    }
}

$(function(){
	// header, footer 불러오기
	/*
	$( "#headerWrap" ).load( "/inc/header" );
	$( "#footerWrap" ).load( "/inc/footer" );
	**/
	
	// youtube 자동 높이조절
	var video_width = $(".video_wrap").width();
	$(".video_wrap iframe").height(video_width / 16 * 9);
	
	// 탭메뉴
	$(".tab_wrap > a").click(function(){
		var idx = $(this).index();
		$(".tab_wrap > a").removeClass("on");
		$(this).addClass("on");
		$(".tab_cont > div").hide();
		$(".tab_cont > div:eq(" + idx + ")").show();
	});
	

});