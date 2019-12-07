<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
	<title>전주코딩학원</title>
	<c:import url="/inc/head"></c:import>
	<link rel="icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">
	<link rel=" shortcut icon" href="<c:url value="/resources/img/comm/favicon.ico"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/css.css"/>">
    
    <script type="text/javascript" src="<c:url value="/resources/js/service/HuskyEZCreator.js"/>" charset="utf-8"></script>
	<script type="text/javascript">
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
                        <dl class="content">
                            <dd>
                            	<textarea name="content" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
                            </dd>
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
                        <dl class="file">
                            <dt>첨부파</dt>
                            <dd>
                                <input type="button" value="파일 등록" class="bt2">
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
					<a href="javascript:submitContents(this);" class="bt1 on">글쓰기</a>
					<a href="#" class="bt1">취소</a>
				</div>
			</div>
		</div>
		<div id="footerWrap"></div>
	</div>
<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "/seSkin",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	var content = document.getElementById("ir1").value;
	console.log(content);
	
	try {
		$("form").submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</body>
</html>
