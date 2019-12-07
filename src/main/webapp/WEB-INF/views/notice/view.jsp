<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
	<title>전주코딩학원</title>
	<link rel="icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">
	<link rel=" shortcut icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/css.css"/>">
    <script src="<c:url value="/resources/js/jquery-1.12.1.min.js"/>"></script>
	<script>$(function(){ $( "#headerWrap" ).load( "/inc/head.html" ); });</script>
</head>
<body>
	<div id="wrap">
		<div id="headerWrap"></div>
		<div id="containerWrap">
            <div class="contTitle">
                <div>
                    <strong>학원소식</strong>
                    <p>
                        "위대한 일을 해낼 수 없다면 작은 일을 위대하게 행하라."
                        <span>- 마틴 루터 킹</span>
                    </p>
                </div>
            </div>
			<div class="board_view_wrap">
                <div class="board_view">
                    <div class="category">학원소식</div>
                    <div class="etc">
                        <span>${board.writer }</span>
                        <span>${board.wdate }</span>
                    </div>
                    <div class="title"><a href="#">${board.title }</a></div>
                    <div class="image"><a href="#"><img src="<c:url value="/img/temp/1.jpeg"/>" alt="사진"></a></div>
                    <div class="cont">${board.content }</div>
                    <div class="link">
                        <strong>참고링크</strong>
                        <a href="https://www.naver.com" target="_blank">https://www.naver.com</a>
                    </div>
                </div>
				<div class="bt_wrap">
					<a href="<c:url value="/notice/"/>" class="bt1 on">목록</a>
					<a href="<c:url value="/board/edit"/>" class="bt1">수정</a>
					<a href="<c:url value="/board/write"/>" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>
