<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  	<!-- css 등록 -->
 <link rel="stylesheet" href="${path}/CSS/bootstrap.min.css">
 <link rel="stylesheet" href="${path}/CSS/bootstrap.css">
 <link rel="stylesheet" href="${path}/CSS/_variables.scss">
 <link rel="stylesheet" href="${path}/CSS/_bootswatch.scss">
 
 <!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
	text-align: center;
	 background-color: #66A399;
	font-family: 'Nanum Gothic', sans-serif;
	}
	
	
	.main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
     .title {
        padding-top: 30px;
        color: #262626;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
     a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #262626;
        font-size: 15px;
        text-decoration: none;
        font-weight: bold;
       margin: 7em auto;
    }
    a:hover{
    	font-size: 18px;
    }
    
    
</style>
</head>
<body>

<div class="main">
<p class="title" align="center">아이디/비밀번호 찾기 결과입니다.</p>
<table margin-bottom="30px" align="center" cellpadding="5" cellspacing="2" width="300" border="2" font-family='Nanum Gothic' font-color="black">
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