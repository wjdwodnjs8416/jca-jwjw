<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<input type="button" value="로그인" id="kakao-login-btn">
</body>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('${apiKey}');
	
	Kakao.Auth.createLoginButton({ 
		container : '#kakao-login-btn',
		success : function(authObj) {
			console.log(authObj);
		},
		fail : function(err) {
			alert("로그인에 실패했습니다.");
		}
	});
</script>
</html>