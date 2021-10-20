<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="../CSS/singinStyle.css">
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="../js/jquery-3.6.0.js"></script>
  <script type="text/javascript">
		$(function(){
			
			$("#loginForm").submit(function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요");
					$("#userId").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("password 입력해주세요");
					$("#pw").focus();
					return false;
				}
			})
		})
  </script>
  <title>개발자 커뮤니티 SRC</title>
</head>

<body>
  <div class="main">
    <p class="sign" align="center">LogIn</p>
    <form class="form1" action = "${pageContext.request.contextPath}/front?key=login&methodName=login" align="center" id="loginForm" method="post">
      <input class="un " type="text" name="userId" placeholder="id" id="userId">
      <input class="pass" type="password" name="pw" placeholder="Password" id="pw">
      <input type = hidden name = "key" value = "login">
      <input type = hidden name = "methodName" value = "login"> 
      <input type = "submit" value="접속하기" ><br><br>
	  <a href = "searchPassword.jsp">비밀번호 찾기</a><br><br>
	  <a href = "join.jsp">회원가입</a>    
      </form>
            
                
    </div>
     
</body>

</html>