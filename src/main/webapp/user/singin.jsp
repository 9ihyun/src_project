<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="../CSS/style.css">
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
  <title>개발자 커뮤니티 SRC</title>
</head>

<body>
  <div class="main">
    <p class="sign" align="center">LogIn</p>
    <form class="form1">
      <input class="un " type="text" align="center" placeholder="id">
      <input class="pass" type="password" align="center" placeholder="Password">
      <a href="${pageContext.request.contextPath}/front?key=login&methodName=login" align="center">접속하기!</a>
      <p class="forgot" align="center"><a href="searchPassword.jsp">비밀번호 찾기</a></p>
      <p class="signup" align="center"><a href="memberInput.jsp">회원가입</a></p>
      </form>
            
                
    </div>
     
</body>

</html>