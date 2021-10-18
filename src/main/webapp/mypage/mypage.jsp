<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<style type="text/css">

</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	  <% session.setAttribute("userId", "admin");
	  session.setAttribute("loginUser", "admin"); %>
	  location.href="../front?key=user&methodName=myInfo";
	  alert(user.id);
	  
	  $(document).on("click", "#withdraw", function(){
		 confirm("정말 탈퇴하시겠습니까?");
	  });
  });
  
</script>
</head>
<body>
<table>
  <tr>
    <th>아이디</th>
    <th>별점</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="id"></th>
    <th><input type="text" readonly="readonly" id="star"></th>
  </tr>
  <tr>
    <th>닉네임</th>
    <th>생년월일</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="nickname"></th>
    <th><input type="text" readonly="readonly" id="birth"></th>
  </tr>
  <tr>
    <th>가입날짜</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="regdate"></th>
  </tr>
</table>
<input type="button" id="withdraw" value="탈퇴하기">
</body>
</html>