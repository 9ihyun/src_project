<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
 <!--link rel="stylesheet" href="${path}/CSS/singinStyle.css"-->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">  

<script src="../js/jquery-3.6.0.js"></script>
  <script src="../ajaxBasic.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script>  
<title>개발자 커뮤니티 SRC</title>
</head>

<body>

<div class="png" style="float:left; margin-left: 100px;">
<img src="../img/main.png">
</div>

  <div class="main" style="float:left; margin-left: 40px;">
    <p class="sign" align="center">로그인</p>
    <form class="form1" action = "${pageContext.request.contextPath}/front?key=login&methodName=login" align="center" method="post">
  
<div class="form-group"> 
  <input type="text" class="form-control" placeholder="아이디를 입력하세요" name="userId">
</div>
  
<div class="form-group">  
  <input type="text" class="form-control" placeholder="비밀번호를 입력하세요" name="pw">
</div>

      <input type = hidden name = "key" value = "login">
      <input type = hidden name = "methodName" value = "login"> 
	  <a href = "searchPassword.jsp">비밀번호 찾기</a>
	  <a href = "join.jsp">회원가입</a>  <br>
<button type="submit" class="btn btn-primary">접속하기</button>
	    
      </form>
            
                
    </div>
     
</body>

</html>