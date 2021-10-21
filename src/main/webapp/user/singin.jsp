<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
 <!-- link rel="stylesheet" href="${path}/CSS/singinStyle.css" -->
 <!-- css 등록 -->
 <link rel="stylesheet" href="${path}/CSS/bootstrap.min.css">
 <link rel="stylesheet" href="${path}/CSS/bootstrap.css">
 <link rel="stylesheet" href="${path}/CSS/_variables.scss">
 <link rel="stylesheet" href="${path}/CSS/_bootswatch.scss">
 
  <meta name="viewport" content="width=device-width, initial-scale=1" />


<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<script src="../js/jquery-3.6.0.js"></script>
  <script src="../ajaxBasic.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script>  
<title>개발자 커뮤니티 SRC</title>

<style type="text/css">
	body{
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
    
    .sign {
        padding-top: 20px;
        color: #262626;
       font-family: 'Nanum Gothic', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
     form.form1 {
        padding-top: 20px;
    }
    
     a {
     	font-family: 'Nanum Gothic', sans-serif;
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #262626;
        font-size: 15px;
        text-decoration: none; 
        font-weight: bold;
    }
    a:hover{
    	font-size: 18px;
    }
    
    input[type=text]{
    	align-content: center;
    	width: 76%;
    	font-weight: 700;
    	font-size: 14px;
    	letter-spacing: 1px;
    	padding: 10px 20px;
	    border: none;
	    border-radius: 20px;
	    outline: none;
	    box-sizing: border-box;
    	border: 2px solid rgba(0, 0, 0, 0.02);
	    margin-bottom: 50px;
	    text-align: center;
	    margin-bottom: 27px;
	    font-family: 'Nanum Gothic', sans-serif;
    }
    
    img{
    	 padding-top: 30px;
    }
</style>
</head>

<body>

<div class="png" style="float:left; margin-left: 100px;">
<img src="../img/main.png">
</div>

  <div class="main" style="float:left; margin-left: 40px;">
    <p class="sign" align="center">로그인</p>
    <form class="form1" action = "${pageContext.request.contextPath}/front?key=login&methodName=login" align="center" method="post">
  
<div class="form-group" align="center"> 
<input type="text" class="form-control is-valid" name="userId" placeholder="아이디를 입력하세요">
</div>
  
<div class="form-group" align="center">  
	<input type="text" class="form-control is-valid" name="pw" placeholder="비밀번호를 입력하세요">
</div>

      <input type = hidden name = "key" value = "login">
      <input type = hidden name = "methodName" value = "login"> 
      <button type="submit" class="btn btn-primary btn-sm">접속하기</button>
      <br><br>
	  <a href = "searchPassword.jsp">비밀번호 찾기</a><br>
	  <a href = "join.jsp">회원가입</a>  <br>

	
	    
      </form>
            
                
    </div>
     
</body>

</html>