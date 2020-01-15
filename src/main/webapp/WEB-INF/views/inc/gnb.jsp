<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
// m_gnbWrap 2차메뉴 열기
$(".m_gnb > ul > li").click(function(){
    $(".m_gnb > ul > li").removeClass("on");
    $(this).addClass("on");
});
</script>
<li><a href="/board/notice/">학원소식</a></li>
<li>
    <a href="#">수업안내</a>
    <ul>
        <li><a href="/board/class/">수업안내</a></li>
        <li><a href="/board/video/">동영상 강의</a></li>
    </ul>
</li>
<li>
    <a href="#">수강생 활동</a>
    <ul>
        <li><a href="/board/note/">활동노트</a></li>
        <li><a href="/board/project/">수강생 작품</a></li>
    </ul>
</li>
<li>
    <a href="#" onclick="return false;">코딩뉴스</a>
    <ul>
        <li><a href="/board/news/">코딩뉴스</a></li>
        <li><a href="/board/book/">추천도서</a></li>
    </ul>
</li>