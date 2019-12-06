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
					<strong>추천도서</strong>
					<p>
						"책은 위대한 천재가 인류에게 남긴 유산이다."
						<span>- 에디슨</span>
					</p>
				</div>
			</div>
			<div class="board_list_wrap">
				<div class="board_list_type1">
					<div class="item">
						<div class="image"><a href="#"><img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="#">충주 대미초등학교에 다녀왔어요. 충주 대미초등학교에 다녀왔어요.</a></div>
							<div class="etc">
								<span>부원장</span>
								<span>2019.11.12</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="image"><a href="#"><img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="#">충주 대미초등학교에 다녀왔어요.</a></div>
							<div class="etc">
								<span>부원장</span>
								<span>2019.11.12</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="image"><a href="#"><img src="<c:url value="/resources/img/comm/noImg.gif"/>" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="#">충주 대미초등학교에 다녀왔어요.</a></div>
							<div class="etc">
								<span>부원장</span>
								<span>2019.11.12</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="image"><a href="#"><img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="#">충주 대미초등학교에 다녀왔어요.</a></div>
							<div class="etc">
								<span>부원장</span>
								<span>2019.11.12</span>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="image"><a href="#"><img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진"></a></div>
						<div class="cont">
							<div class="category">학원소식</div>
							<div class="title"><a href="#">충주 대미초등학교에 다녀왔어요.</a></div>
							<div class="etc">
								<span>부원장</span>
								<span>2019.11.12</span>
							</div>
						</div>
					</div>
				</div>
				<div class="page_wrap">
					<a href="javascript:pageGo(1)" class="bt first">맨 처음 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="bt prev">이전 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="num on">1</a>
					<a href="javascript:pageGo(1)" class="num">2</a>
					<a href="javascript:pageGo(1)" class="num">3</a>
					<a href="javascript:pageGo(1)" class="bt next">다음 페이지로 가기</a>
					<a href="javascript:pageGo(1)" class="bt last">마지막 페이지로 가기</a>
				</div>
				<div class="bt_wrap">
					<a href="#" class="bt1 on">목록</a>
					<a href="#" class="bt1">수정</a>
					<a href="#" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>
