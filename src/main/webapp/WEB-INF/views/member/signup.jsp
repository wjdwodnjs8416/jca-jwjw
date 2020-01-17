<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
    <script>

    </script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>사용자 등록</strong>
					<p>
						"길을 걷다가 돌을 보면 약자는 그것을 걸림돌이라 하고, 강자는 그것을 디딤돌이라고 한다."
						<span>- 토마스 칼라일</span>
					</p>
				</div>
			</div>
			<div class="login_wrap">
				<form class="member_form">
					<dl>
						<dt>아이디</dt>
						<dd><input type="text" placeholder="아이디 입력"></dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd><input type="password" placeholder="비밀번호 입력"></dd>
					</dl>
					<dl>
						<dt>이름</dt>
						<dd><input type="text" placeholder="이름 입력"></dd>
					</dl>
					<dl>
						<dt>연락처</dt>
						<dd><input type="text" placeholder="연락처 입력" onkeypress="inNumber();"></dd>
					</dl>
					<input type="button" value="등록" class="bt3 on" onclick="findId();">
				</form>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>