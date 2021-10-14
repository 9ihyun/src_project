<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $("#mypage").click(function(){
		 parent.location.href = "mypageMain.jsp"
	 }); 
  });
</script>
</head>
<body>
<ol>
  <li><a href="mypage.jsp" target="page">내정보</a></li>
  <li><a href="infoChange.jsp" target="page">정보수정</a></li>
  <li><a href="passChange.jsp" target="page">비밀번호 변경</a></li>
  <li><a href="manageStudy.jsp" target="page">스터디관리</a></li>
</ol>
<table>
  <tr><a href="#" id="mypage">마이페이지</a></tr>
  <tr>로그아웃</tr>
</table>
</body>
</html>