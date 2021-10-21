<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style type="text/css">
	*{font-family: 'Nanum Gothic', sans-serif;}
	ul{list-style: none; padding: 0px 10px; margin: 0px;}
</style>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $("#mypage").click(function(){
		 parent.location.href = "${path}/study/studyMain.jsp"
	 }); 
	 
	 $(document).on("click", "#logout", function(){
		parent.location.href = "${path}/front?key=login&methodName=logout"; 
	 });
  });
</script>
</head>
<body>
<ul style="text-align:left;">
  <li>
  	<a href="${pageContext.request.contextPath}/front?key=user&methodName=myInfo" target="page" class="btn btn-outline-primary">내정보</a>
  </li>&nbsp;&nbsp;
  <li>
  	<a href="infoChange.jsp" target="page" class="btn btn-outline-primary">정보수정</a>
  </li>&nbsp;&nbsp;
  <li>
  	<a href="passChange.jsp" target="page" class="btn btn-outline-primary">비밀번호 변경</a>
  </li>&nbsp;&nbsp;
  <li>
  	<a href="${path}/front?key=myStudy&methodName=viewMyStudy" target="page" class="btn btn-outline-primary">스터디관리</a>
  </li>&nbsp;&nbsp;
</ul>
<ul>
	<li><button type="submit" class="btn btn-secondary" onClick="location.href='${path}/study/studyMain.jsp'">메인페이지</button><br></li>&nbsp;&nbsp;
	<li><button type="submit" class="btn btn-outline-dark" onClick="location.href='${path}/front?key=login&methodName=logout'">로그아웃</button></li>&nbsp;&nbsp;
</ul>
</body>
</html>