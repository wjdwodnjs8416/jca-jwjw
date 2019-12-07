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
	<script type="text/javascript">
		$(function(){ $( "#headerWrap" ).load( "/inc/head" ); });
		function insertBoard(){
			var url = $("form").attr("action");
			var param = $("form").serialize();
			
			$.ajax({
				url : url,
				data: param,
				type: "POST",
				dataType: "json"
			}).done(function(json){
				if(json.result > 0){
					alert("작성 완료!");
					window.location.replace("/notice");
				}
			});
		}
	</script>
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
			<div class="board_write_wrap">
                <div class="board_write">
                    <form action="<c:url value="/notice/write"/>" method="post">
                        <dl>
                            <dt>카테고리</dt>
                            <dd>
                                <select name="boardType">
                                    <option value="1">학원소식</option>
                                    <option value="2">공지사항</option>
                                    <option value="3">개강안내</option>
                                </select>
                            </dd>
                        </dl>
                        <dl class="title">
                            <dt>제목</dt>
                            <dd><input type="text" placeholder="제목 입력" name="title"></dd>
                        </dl>
                        <dl>
                            <dt>내용</dt>
                            <dd><textarea placeholder="내용 입력" name="content"></textarea></dd>
                        </dl>
                        <dl class="link">
                            <dt>참고링크</dt>
                            <dd><input type="text" placeholder="링크 입력"></dd>
                        </dl>
                        <dl class="image">
                            <dt>사진</dt>
                            <dd>
                                <input type="button" value="사진 등록" class="bt2">
                                <ul>
                                    <li>
                                        <span>파일명.jpg</span>
                                        <input type="button" value="삭제" class="bt_del">
                                    </li>
                                </ul>
                            </dd>
                        </dl>
                    </form>
                </div>
				<div class="bt_wrap">
					<a href="javascript:insertBoard();" class="bt1 on">글쓰기</a>
					<a href="#" class="bt1">취소</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
</body>
</html>
