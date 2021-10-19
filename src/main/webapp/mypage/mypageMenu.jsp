<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/CSS/mypageStyle.css">
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $("#mypage").click(function(){
		 parent.location.href = "${path}/study/studyMain.jsp"
	 }); 
  });
</script>
</head>
<body>
<ol>
  <li><a href="startPage.jsp" target="page">내정보</a></li><p>
  <li><a href="infoChange.jsp" target="page">정보수정</a></li><p>
  <li><a href="passChange.jsp" target="page">비밀번호 변경</a></li><p>
  <li><a href="${path}/front?key=myStudy&methodName=viewMyStudy" target="page">스터디관리</a></li><p>
</ol>
<table>
  <tr><a href="#" id="mypage">메인페이지</a></tr>&nbsp;
  <tr><a href="${path}/front?key=login&methodName=logout">로그아웃</a></tr>
</table>
</body>
</html>