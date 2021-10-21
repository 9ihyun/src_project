<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
 <!-- 부트스트랩 -->
   <link href="css/bootstrap.min.css" rel="stylesheet">
   
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="../js/jquery-3.6.0.js"></script>
  <script src="../ajaxBasic.js"></script>
  
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../js/bootstrap.min.js"></script>
    
  <title>개발자 커뮤니티 SRC</title>
</head>

<body>


<div class="png" style="float:left; margin-left: 100px;">
<img src="../img/main.png">
</div>

  <div class="main" style="float:left; margin-left: 40px;">
    <p class="sign" align="center">LogIn</p>
    <form class="form1" action = "${pageContext.request.contextPath}/front?key=login&methodName=login" align="center" method="post">
      <input class="un " type="text" name="userId" placeholder="id" autofocus required>
      <input class="pass" type="password" name="pw" placeholder="Password" autofocus required>
      <input type = hidden name = "key" value = "login">
      <input type = hidden name = "methodName" value = "login"> 
      <input type = "submit" value="접속하기" ><br><br>
	  <a href = "searchPassword.jsp">비밀번호 찾기</a><br><br>
	  <a href = "join.jsp">회원가입</a>    
      </form>
            
                
    </div>
     
</body>

</html>