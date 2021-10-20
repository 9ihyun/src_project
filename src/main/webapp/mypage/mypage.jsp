<%@page import="kosta.mvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/CSS/mypageStyle.css">
<style type="text/css">

</style>

<script type="text/javascript">
  function withdraw(){
	  confirm("정말 탈퇴하시겠습니까?");
  }
  
  
</script>
</head>
<body>
<% session.setAttribute("user", request.getAttribute("user"));
   
   %>
<table>
  <tr>
    <th>아이디</th>
    <th>별점</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="id" value="${requestScope.user.userId }"></th>
    <th><input type="text" readonly="readonly" id="star" value="${requestScope.user.starPoint }"></th>
  </tr>
  <tr>
    <th>닉네임</th>
    <th>생년월일</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="nickname" value="${requestScope.user.nickname }"></th>
    <th><input type="text" readonly="readonly" id="birth" value="${requestScope.user.birth }"></th>
  </tr>
  <tr>
    <th>가입날짜</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="regdate" value="${requestScope.user.regdate }"></th>
  </tr>
</table>
<input type="button" id="withdraw" value="탈퇴하기" onclick="withdraw()">
</body>
</html>