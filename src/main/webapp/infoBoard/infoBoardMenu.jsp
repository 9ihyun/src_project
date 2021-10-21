<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/bootstrap.min(1).css">
    
<ul style="text-align:left;">
	<li><a href="../study/list.jsp" class="btn btn-primary" target="board" > 스터디 </a></li> &nbsp;&nbsp;
	<li><a href="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost" target="board"class="btn btn-primary"> 자유게시판</a></li> &nbsp;&nbsp;
	<li><a href="${pageContext.request.contextPath}/front?key=post&methodName=Allpost"target ="board"class="btn btn-primary"> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;

</ul>

&nbsp;&nbsp;
<div>
	<a href="../mypage/mypageMain.jsp" class="btn btn-primary">마이페이지</a>&nbsp;
	<a href="${pageContext.request.contextPath}/front?key=user&methodName=logout" class="btn btn-primary">로그아웃</a>
</div>
<!-- 이 주석은 지워주세요~ -->


