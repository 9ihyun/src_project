<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
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
<style type="text/css">
ul{ list-style: none;} 
</style>
</head>
<body>

<ul >
  <li><a href="${pageContext.request.contextPath}/front?key=study&methodName=selectAllStudy" target="board"class="btn btn-primary"> 스터디 </a></li> &nbsp;&nbsp;
  <li><a href="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost" target="board"class="btn btn-primary"> 자유게시판</a></li> &nbsp;&nbsp;
  <li><a href="${pageContext.request.contextPath}/front?key=post&methodName=Allpost"target = "board"class="btn btn-primary"> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;
</ul>

<ul>
	<li><button type="submit" class="btn btn-secondary" onClick="location.href='${path}/mypage/mypageMain.jsp'">마이페이지</button><br></li>&nbsp;&nbsp;
	<li><button type="submit" class="btn btn-outline-dark" onClick="location.href='${path}/front?key=login&methodName=logout'">로그아웃</button></li>&nbsp;&nbsp;
</ul>
</body>
</html>




