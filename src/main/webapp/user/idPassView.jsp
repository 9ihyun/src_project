<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${path}/CSS/idViewStyle.css">
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{text-align: center;}
	table{margin-bottom: 30px;}
</style>
</head>
<body>

<div class="main">
<p class="title" align="center">아이디/비밀번호 찾기 결과입니다.</p>
<table align="center" cellpadding="5" cellspacing="2" width="300" border='1'>
<tr>
	<td width="40%">아이디</td>
	<td width="60%">${requestScope.user.userId}</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>${requestScope.user.pw}</td>
</tr>
</table>

<a href="${path}/user/singin.jsp">로그인</a>
</div>

</body>
</html>