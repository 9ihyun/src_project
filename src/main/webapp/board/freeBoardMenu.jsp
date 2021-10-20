<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul style="text-align:left;">
	<li><a href="${pageContext.request.contextPath}/front?key=study&methodName=selectAllStudy" target="board"> 스터디 </a></li> &nbsp;&nbsp;
	<li><a href="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost" target="board"> 자유게시판</a></li> &nbsp;&nbsp;
	<li><a href="${pageContext.request.contextPath}/front?key=post&methodName=Allpost"target = "board"> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;
	<li><a href="../elecBoard/elecBoardWrite.jsp"target = "board"> 알쓸신술 </a></li>
</ul>

&nbsp;&nbsp;
<div>
	<a href="../mypage/mypageMain.jsp">마이페이지</a>&nbsp;
	<a href="${pageContext.request.contextPath}/front?key=user&methodName=logout">로그아웃</a>
</div>



