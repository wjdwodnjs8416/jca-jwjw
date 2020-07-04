<%@ page session="false" contentType="text/html; charset=UTF-8"%>
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
                    <strong></strong>
                    <p>
                        "위대한 일을 해낼 수 없다면 작은 일을 위대하게 행하라."
                        <span>- 마틴 루터 킹</span>
                    </p>
                </div>
            </div>
			<div class="board_view_wrap">
                <div class="board_view">
                    <div class="category"></div>
                    <div class="etc">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="title"><a href="#"></a></div>
                    
                    <div class="cont"></div>
                    
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
				                		<c:forEach items="${ }" var="item">
				                			<li>
				                				<a href="<c:url value="/upload/get/1"/>">첨부파일</a>
				                			</li>
				                		</c:forEach>
									</ul>
								</dd>
							</dl>
						</div>
                </div>
				<div class="bt_wrap">
					<a href="<c:url value=""/>" class="bt1 on">목록</a>
					<a href="<c:url value="/board/edit?id=${board.id }"/>" class="bt1">수정</a>
					<a href="javascript:deleteBoard('${board.id}')" class="bt1">삭제</a>
				</div>
			</div>
		</div>
		<c:import url="/inc/footer"></c:import>
	</div>
</body>
</html>
