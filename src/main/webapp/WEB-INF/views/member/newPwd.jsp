<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
	<c:import url="/inc/head"></c:import>
	<script>
		function newPwd() {
			alert("변경 완료!");
			// 확인 누르면 home으로 이동
		}
	</script>
</head>
<body>
	<div id="wrap">
		<c:import url="/inc/header"></c:import>
		<div id="containerWrap">
			<div class="contTitle">
				<div>
					<strong>비밀번호 변경</strong>
					<p>
						"길을 걷다가 돌을 보면 약자는 그것을 걸림돌이라 하고, 강자는 그것을 디딤돌이라고 한다."
						<span>- 토마스 칼라일</span>
					</p>
				</div>
			</div>
			<div class="login_wrap">
				<form class="member_form">
					<dl>
						<dt>새 비밀번호</dt>
						<dd><input type="password" placeholder="새 비밀번호 입력"></dd>
					</dl>
					<input type="button" value="비밀번호 변경" onclick="newPwd();" class="bt3 on">
				</form>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>