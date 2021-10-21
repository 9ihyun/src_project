<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $("#mainpage").click(function(){
		 parent.location.href = "${path}/mypage/mypageMain.jsp"
	 }); 
	 
	 $(document).on("click", "#logout", function(){
		parent.location.href = "${path}/front?key=login&methodName=logout"; 
	 });
  });
</script>
</head>
<body>
<ul style="text-align:left;">
  <li><a href="${pageContext.request.contextPath}/front?key=study&methodName=selectAllStudy" target="board"> 스터디 </a></li> &nbsp;&nbsp;
  <li><a href="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost" target="board"> 자유게시판</a></li> &nbsp;&nbsp;
  <li><a href="${pageContext.request.contextPath}/front?key=post&methodName=Allpost"target = "board"> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;
  <li><a href="${path }/elecBoard/elecBoardWrite.jsp"target = "board"> 알쓸신술 </a></li>
</ul>
<a href="#" id="mainpage">마이페이지</a>&nbsp;
<a href="#" id="logout">로그아웃</a>
</body>
</html>




