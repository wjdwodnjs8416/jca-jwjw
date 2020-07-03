<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>게시판이름</strong>
					<p>명언</p>
				</div>
			</div>
			<div class="board_list_wrap">
				<form action="<c:url value="${listUrl }"/>">
					<input type="hidden" name="pageNo" value="${paging.pageNo }"/>
				</form>
				<div class="board_list_type2">
					
					<!-- 예시글 1번 -->
					<div class="item">
						<div class="image">
							<a href="<c:url value="/board/notice/view?id=0"/>">
								<img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진">
							</a>
						</div>
						<div class="cont">
							<div class="category">게시판이름1</div>
							<div class="title"><a href="<c:url value="/board/view?id=1"/>">게시글제목1</a></div>
							<div class="etc">
								<span>작성자이름1</span>
								<span></span>
							</div>
						</div>
					</div>
					
					<!-- 예시글 2번 -->
					<div class="item">
						<div class="image">
							<a href="<c:url value="/board/notice/view?id=0"/>">
								<img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진">
							</a>
						</div>
						<div class="cont">
							<div class="category">게시판이름2</div>
							<div class="title"><a href="<c:url value="/board/view?id=1"/>">게시글제목2</a></div>
							<div class="etc">
								<span>작성자이름2</span>
								<span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="page_wrap">
					<a href="javascript:pageGo(${paging.firstPageNo})" class="bt first">맨 처음 페이지로 가기</a>
						<a href="javascript:pageGo(${paging.prevPageNo})" class="bt prev">이전 페이지로 가기</a>
						<a href="javascript:pageGo(1)" class="num on">1</a>
						<a href="javascript:pageGo(2)" class="num">2</a>
						<a href="javascript:pageGo(${paging.nextPageNo})" class="bt next">다음 페이지로 가기</a>
						<a href="javascript:pageGo(${paging.endPageNo})" class="bt last">마지막 페이지로 가기</a>
					</div>
				<div class="bt_wrap">
					<a href="<c:url value="/board/${menu.id }/write"/>" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>
