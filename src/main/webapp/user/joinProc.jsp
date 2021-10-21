<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../CSS/joinViewStyle.css">
 <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main">
	<p class="title" align="center">${sessionScope.user.nickname}님 가입을 축하드립니다.</p>
	<p align="center">내 정보 확인하기</p>
	<table align="center" cellpadding="5" cellspacing="2" width="300" border='1'>
	<tr>
		<td>아이디</td>
		<td>${sessionScope.user.userId}</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${sessionScope.user.nickname}</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${sessionScope.user.birth}</td>
	</tr>
	</table>
	
	<a href="${path}/user/singin.jsp">로그인</a>
	</div>

</body>
</html>