<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
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
					<c:forEach items="${list }" var="item">
					<div class="item">
						<div class="image">
							<a href="<c:url value="/notice/view?id=${item.id }"/>">
								<c:choose>
									<c:when test="${not empty item.thumbnail }">
										<img src="<c:url value="${item.thumbnail }" />"/>
									</c:when>
									<c:otherwise>
										<img src="<c:url value="/resources/img/temp/1.jpeg"/>" alt="사진">
									</c:otherwise>
								</c:choose>
								
							</a>
						</div>
						<div class="cont">
							<div class="category">${item.boardName }</div>
							<div class="title"><a href="<c:url value="/notice/view?id=${item.id }"/>">${item.title }</a></div>
							<div class="etc">
								<span>부원장</span>
								<span><fmt:formatDate value="${item.wdate}" pattern="yyyy-MM-dd" /></span>
							</div>
						</div>
					</div>
					</c:forEach>
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
					<a href="<c:url value="/notice/write"/>" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>
