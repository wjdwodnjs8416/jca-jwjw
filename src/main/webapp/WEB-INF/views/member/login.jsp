<%@page contentType="text/html" pageEncoding="utf-8"%>
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
					<strong>로그인</strong>
					<p>
						"평범한 날이여, 그대의 귀한 가치를 깨닫게 하여라."
						<span>- 매리 J. 아이리언</span>
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
					<input type="button" value="로그인" class="bt3 on" id="kakao-login-btn">
				</form>
				<a href="/member/signup">사용자 등록</a>
				<a href="/member/findId">아이디 찾기</a>
				<a href="/member/findPwd">비밀번호 찾기</a>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('${apiKey}');
	
	Kakao.Auth.createLoginButton({ 
		container : '#kakao-login-btn',
		success : function(authObj) {
			console.log(authObj);
			var url = "/member/signup";
			var param = JSON.stringify(authObj);
			
			$.ajax({
				url : url,
				data: param,
				type: "POST",
				dataType: "json",
				contentType: 'application/json; charset=utf-8'
			}).done(function(json){
				console.log(json);
				
				if(json.user.id > 0){
					window.location.replace("/");
				}
			});
		},
		fail : function(err) {
			alert("로그인에 실패했습니다.");
		}
	});
</script>
</html>