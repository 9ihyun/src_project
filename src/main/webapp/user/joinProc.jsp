<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>${sessionScope.user.nickname}님 가입을 축하드립니다.</h3>
	<h5>내 정보 확인하기</h5>
	<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
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

</body>
</html>