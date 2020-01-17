<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script>
		function codeMsg() {
			alert("회원코드를 모르시면 학원에 문의하세요. 063-714-2536");
		}
		
		function findPwd() {
	    	// alert("일치하는 정보를 찾을 수 없습니다.");
	    	location.href="/member/newPwd";
		}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>비밀번호 찾기</strong>
					<p>
						"길을 걷다가 돌을 보면 약자는 그것을 걸림돌이라 하고, 강자는 그것을 디딤돌이라고 한다."
						<span>- 토마스 칼라일</span>
					</p>
				</div>
			</div>
			<div class="login_wrap">
				<form class="member_form">
					<dl>
						<dt>이름</dt>
						<dd><input type="text" placeholder="이름 입력"></dd>
					</dl>
					<dl>
						<dt>아이디</dt>
						<dd><input type="text" placeholder="아이디 입력"></dd>
					</dl>
					<dl>
						<dt>회원코드</dt>
						<dd><input type="text" placeholder="회원코드 입력" onclick="codeMsg();"></dd>
					</dl>
					<input type="button" value="비밀번호 찾기" onclick="findPwd();" class="bt3 on">
				</form>
				<a href="/member/signup">사용자 등록</a>
				<a href="/member/login">로그인</a>
				<a href="/member/findId">아이디 찾기</a>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>