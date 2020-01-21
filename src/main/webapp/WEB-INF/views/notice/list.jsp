<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
	function pageGo(pageNum){
		$("input[name='pageNo']").val(pageNum);
		$("form").submit();
	}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>${menu.title }</strong>
					<p>${menu.pageComment }</p>
				</div>
			</div>
			<div class="board_list_wrap">
				<form action="<c:url value="${listUrl }"/>">
					<input type="hidden" name="pageNo" value="${paging.pageNo }"/>
				</form>
				<div class="board_list_type2">
					<c:forEach items="${list }" var="item">
					<div class="item">
						<div class="image">
							<a href="<c:url value="/board/notice/view?id=${item.id }"/>">
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
							<div class="title"><a href="<c:url value="/board/view?id=${item.id }"/>">${item.title }</a></div>
							<div class="etc">
								<span>${item.writerName }</span>
								<span><fmt:formatDate value="${item.wdate}" pattern="yyyy-MM-dd" /></span>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<div class="page_wrap">
					<a href="javascript:pageGo(${paging.firstPageNo})" class="bt first">맨 처음 페이지로 가기</a>
						<a href="javascript:pageGo(${paging.prevPageNo})" class="bt prev">이전 페이지로 가기</a>
						<c:choose>
							<c:when test="${paging.finalPageNo eq 0}">
								<a href="javascript:pageGo(1)" class="num on">1</a>
							</c:when>
							<c:otherwise>
								<c:forEach begin="${paging.startPageNo }" end="${paging.endPageNo}" varStatus="loop">
									<a href="javascript:pageGo(${loop.current })" class="num <c:if test="${loop.current eq paging.pageNo }">on</c:if>">
									${loop.current }
									</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<a href="javascript:pageGo(${paging.nextPageNo})" class="bt next">다음 페이지로 가기</a>
						<a href="javascript:pageGo(${paging.endPageNo})" class="bt last">마지막 페이지로 가기</a>
					</div>
				<div class="bt_wrap">
					<a href="#" class="bt1 on">목록</a>
					<a href="<c:url value="/board/${menu.id }/write"/>" class="bt1">글쓰기</a>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>
