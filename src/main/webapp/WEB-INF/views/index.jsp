<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="su" uri="/WEB-INF/tlds/customTags" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="idx_slider_wrap">
				<div class="idx_slider">
					<div class="item item2">
						<div>
							<img src="<c:url value="/resources/img/index/slider2_txt.png"/>" alt="자바 프로그래밍">
							<a href="/curriculum/">자세히 보기</a>
							<a href="http://naver.me/5vR5uJrV" target="_blank">수강신청</a>
						</div>
					</div>
					<div class="item item3">
						<div>
							<img src="<c:url value="/resources/img/index/slider3_txt.png"/>" alt="코딩앤플레이 주니어">
							<a href="/curriculum/">자세히 보기</a>
							<a href="http://naver.me/GmHjG05a" target="_blank">수강신청</a>
						</div>
					</div>
					<div class="item4">
						<a href="http://naver.me/5qOfxbKh" target="_blank"><img src="/resources/img/index/slider4.png" alt="코딩놀이터 신청"></a>
					</div>
				</div>
			</div>
			<div class="m_idx_slider_wrap" style="display: none;">
				<div class="m_idx_slider">
					<div class="item item2">
						<a href="/curriculum/"><img src="<c:url value="/resources/img/index/m_slider2.png"/>" alt="코딩앤플레이 주니어"></a>
					</div>
					<div class="item item1">
						<a href="/curriculum/"><img src="<c:url value="/resources/img/index/m_slider1.png"/>" alt="자바 개강안내"></a>
					</div>
					<div class="item4">
						<a href="http://naver.me/5qOfxbKh" target="_blank"><img src="/resources/img/index/m_slider4.png" alt="코딩놀이터 신청"></a>
					</div>
				</div>
			</div>
			<div class="feed_wrap">
				<c:forEach items="${list }" var="item">
					<div class="item">
						<div class="top">
							<div class="title"><a href="<c:url value="/board/view?id=${item.id }"/>">${item.title }</a></div>
							<div class="info">
								<span>${item.boardName }</span>
								<span><fmt:formatDate value="${item.wdate}" pattern="yyyy-MM-dd" /></span>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty item.thumbnail }">
								<div class="image">
									<a href="<c:url value="/board/view?id=${item.id }"/>">
										<img src="<c:url value="${item.thumbnail }" />"/>
									</a>
								</div>
							</c:when>
						</c:choose>
						<div class="cont">
							<div class="text">
								${item.content }
							</div>
							<a href="<c:url value="/board/view?id=${item.id }"/>" class="more">원문 보기</a>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="board_list_wrap">
				<div class="board_list_type1">
					<c:forEach items="${list }" var="item">
						<div class="item">
							<div class="image">
								<a href="<c:url value="/board/view?id=${item.id }"/>">
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
								<div class="title">
									<a href="<c:url value="/board/view?id=${item.id }"/>">${item.title }</a>
								</div>
								<div class="etc">
									<span>부원장</span>
									<span>
										<fmt:formatDate value="${item.wdate}" pattern="yyyy-MM-dd" />
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<!--
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
						<a href="#" class="bt1">더 보기</a>
					</div>
					-->
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>