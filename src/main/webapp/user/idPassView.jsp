<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="../CSS/idViewStyle.css">
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="main">
<p class="title" align="center">${sessionScope.user.nickname}님의 회원정보 입니다.</p>
<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
<tr>
	<td>아이디</td>
	<td>${user.userId}</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>${user.pw}</td>
</tr>
</table>

<a href="${path}/user/singin.jsp">로그인</a>
</div>

</body>
</html>