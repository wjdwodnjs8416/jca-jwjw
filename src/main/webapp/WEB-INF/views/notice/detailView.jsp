<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
<head>
<c:import url="/inc/head"></c:import>
<script type="text/javascript">
function deleteBoard(boardId){
	window.location.replace("/class/data/delete?id="+boardId);
}
function deleteBoardAsync(boardId){
	var url = "/class/data/delete";
	var param = "id="+boardId
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url : url,
			data: param,
			type: "POST",
			dataType: "json"
		}).done(function(json){
			if(json.result > 0){
				alert("삭제완료");
				window.location.replace("/calss/data/list?boardType="+json.boardType);
			}
		});
	}
}
function updateContentAsync(){
	var origin = $(".cont").text();
	var text = prompt("입력 해주세요.");
	text = origin + text;
	
	$.ajax({
		url : "/class/data/edit",
		type: "POST",
		dataType: "json"
	}).done(function(json){
		$(".cont").text(text);
	});
}
</script>

</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong></strong>
					<p>
						"위대한 일을 해낼 수 없다면 작은 일을 위대하게 행하라." <span>- 마틴 루터 킹</span>
					</p>
				</div>
			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="category"></div>
					<div class="etc">
						<span>${board.writer }</span> <span><fmt:formatDate
								value="${board.wdate}" pattern="yyyy-MM-dd" /></span>
					</div>
					<div class="title">
					${board.title }
						<a href="#"></a>
					</div>

					<div class="cont">${board.content }</div>

					<div class="link">
						<dl>
							<dt>참고링크</dt>
							<dd>
								<ul>
									<li><a href="${board.refLink }" target="_blank">${board.refLink }</a></li>
								</ul>
							</dd>
						</dl>
					</div>

					<div class="file">
						<dl>
							<dt>첨부파일</dt>
							<dd>
								<ul>
									<c:forEach items="" var="item">
										<li><a href="<c:url value="/upload/get/1"/>">첨부파일</a></li>
									</c:forEach>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
				<div class="bt_wrap">
					<a href="<c:url value=""/>" class="bt1 on">목록</a>
					<sec:authorize access="hasRole('ROLE_USER')">
						<a href="javascript:updateContentAsync('${board.id }')" class="bt1">수정</a>
						<a href="javascript:deleteBoardAsync('${board.id}')" class="bt1">삭제</a>
					</sec:authorize>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>
