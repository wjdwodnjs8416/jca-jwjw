<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script type="text/javascript">
		function deleteBoard(id){
			var url = "/notice/delete";
			var param = "id="+id;
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					url: url,
					data: param,
					type: "POST",
					dataType: "json"
				}).done(function(json){
					if(json.result > 0){
						alert("삭제 완료");
						window.location.replace("/notice/");
					}
				});
			}
		}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
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
                        <span><fmt:formatDate value="${board.wdate }" pattern="yyyy-MM-dd"/></span>
                    </div>
                    <div class="title"><a href="#">${board.title }</a></div>
                    <%--
                    	<div class="image"><a href="#"><img src="<c:url value="/img/temp/1.jpeg"/>" alt="사진"></a></div>
                     --%>
                    <div class="cont">${board.content }</div>
                    <div class="link">
                        <strong>참고링크</strong>
                        <a href="https://www.naver.com" target="_blank">https://www.naver.com</a>
                    </div>
                </div>
                <c:if test="${fn:length(files) ne 0 }">
                	<div class="cont">
	                	<ul>
	                		<c:forEach items="${files }" var="item">
	                			<li>
	                				<a href="<c:url value="/upload/get/${item.id }"/>">${item.name }</a>
	                			</li>
	                		</c:forEach>
	                	</ul>
                	</div>
                </c:if>
				<div class="bt_wrap">
					<a href="<c:url value="${listUrl }"/>" class="bt1 on">목록</a>
					<a href="<c:url value="${listUrl }/edit?id=${board.id }"/>" class="bt1">수정</a>
					<a href="javascript:deleteBoard('${board.id}')" class="bt1">삭제</a>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>
