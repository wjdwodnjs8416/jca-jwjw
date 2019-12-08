// board_list_type3이 PC에서는 type2로, mobile에서는 type3으로 설정
var listType3_fix = function(){
	if ($(window).width() > 800) {
	    $(".board_list_type3").addClass("board_list_type1");
	} else {
	    $(".board_list_type3").removeClass("board_list_type1");
	}
}

$(function(){
    // header, footer 불러오	
	$( "#headerWrap" ).load( "/inc/header" );
    $( "#footerWrap" ).load( "/inc/footer" );
    
    // board_list_type3
    listType3_fix();
});

//board_list_type3
$(window).resize(function(){
	listType3_fix();
});