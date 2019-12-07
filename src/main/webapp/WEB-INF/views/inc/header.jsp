<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
    $(function(){
        // gnb.html 불러오기
        $( "#gnbWrap > ul, .m_gnb > ul" ).load( "<c:url value='/inc/gnb'/>" );
        
        // m_gnbWrap 열기
        $(".menu_opener").click(function(){
            $("#m_gnbWrap").addClass("on");
            $("html, body").css({
                "height" : "100%",
                "overflow" : "hidden",
            });
        });

        // m_gnbWrap 닫기
        $("#m_gnbWrap .bg").click(function(){
            $("#m_gnbWrap").removeClass("on");
            $(".m_gnb > ul > li").removeClass("on");
            $("html, body").css({
                "height" : "auto",
                "overflow" : "unset",
            });
        });

        // 글씨 크게
        $(".bt_font_bigger").click(function(){
            var fs = parseInt($("html").css('font-size'), 10);
            if (fs < 15) {
                var newFs = fs+1+"px";
                $("html").css("font-size",newFs);
            }
        });

        // 글씨 작게
        $(".bt_font_smaller").click(function(){
            var fs = parseInt($("html").css('font-size'), 10);
            if (fs > 10) {
                var newFs = fs-1+"px";
                $("html").css("font-size",newFs);
            }
        });
    });
</script>
<div class="top">
	<div>
		<a href="#" style="color: blue;">현재 사이트 제작 중</a>
		<a href="#">등록</a>
		<a href="#">로그인</a>
		<a href="#">로그아웃</a>
	</div>
</div>
<div id="header">
    <h1 class="logo"><a href="/"><img src="<c:url value="/resources/img/comm/logo.png"/>" alt="전주코딩학원"></a></h1>
    <div id="gnbWrap">
        <ul></ul>
        <a href="https://pf.kakao.com/_ipZxeT" target="_blank" title="카카오톡 문의하기"><img src="<c:url value="/resources/img/comm/header_talk.png"/>" alt="문의하기"></a>
        <a href="http://kko.to/jYMXx4Njp" target="_blank" title="전주코딩학원 지도보기"><img src="<c:url value="/resources/img/comm/header_location.png"/>" alt="위치"></a>
        <a href="javascript:void(0)" title="글씨 크게" class="bt_font_bigger"><img src="<c:url value="/resources/img/comm/bt_font+.png"/>" alt="글씨 크게"></a>
        <a href="javascript:void(0)" title="글씨 작게" class="bt_font_smaller"><img src="<c:url value="/resources/img/comm/bt_font-.png"/>" alt="글씨 작게"></a>
        <a href="javascript:void(0)" title="메뉴 열기" class="menu_opener"><img src="<c:url value="/resources/img/comm/header_menu.png"/>" alt="메뉴 열기"></a>
    </div>
    <div id="m_gnbWrap">
        <div class="bg"></div>
        <div class="m_gnb">
            <div class="title">
                <a href="/"><img src="<c:url value="/resources/img/comm/logo.png"/>" alt="전주코딩학원"></a>
            </div>
            <ul></ul>
        </div>
    </div>
</div>