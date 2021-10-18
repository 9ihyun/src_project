<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul>
	<li><a href="../study/list.jsp" target="board"> 스터디 </a></li> &nbsp;&nbsp;
	<li><a href="../board/freeBoardWrite.jsp" target="board"> 자유게시판</a></li> &nbsp;&nbsp;
	<li><a href="#" target = "board"> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;
	<li><a href="elecBoardWrite.jsp"target = "board"> 알쓸신술 </a></li>
</ul>

&nbsp;&nbsp;
<div>
	<a href="../mypage/mypageMain.jsp">마이페이지</a>&nbsp;
	<a href="${pageContext.request.contextPath}/front?key=user&methodName=logout">로그아웃</a>
</div>



