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
    
    .text{
    	color: "black";
    }
    
    .title {
        padding-top: 20px;
        color: #262626;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
	
	input[type=submit]:hover{
		background-color: #aaa;
		color: #fff;
		cursor: pointer;
	}
	
	  .un {
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Jua', sans-serif;
    }
    
    select {
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Jua', sans-serif;
    }
    
    .a {
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Jua', sans-serif;
    }
    
      form.form1 {
        padding-top: 20px;
    }
    
    .un:focus, .a:focus, select:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background-color: #737373;
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Jua', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    submit:hover{
    	 background-color: #78C2AD;
    }
    
     input {
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-left: 46px;
    text-align: center;
    margin-bottom: 15px;
    font-family: 'Jua', sans-serif;
    }
    
    
    
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #737373;
        text-decoration: none
    }
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="main">
	<p class="title" align="center">아이디/비밀번호 찾기</p>
   <form class="form1" action="${pageContext.request.contextPath}/front?key=login&methodName=idPwFind" method="post">
   <input type="hidden" name="key" value = "LoginContoller" /> 
	<input type="hidden" name="methodName" value = "idPwFind" />
    <p class="text" align="center">생년월일: <input class="un" type="text" name="birth" placeholder="8자리로 입력하세요." required></p>
   <p class="text" align="center"> 비밀번호 찾기 질문 : 
	<select name="question" required>
       <option value="0">--질문 선택--</option>
	   <option value="보물 1호는?">보물 1호는?</option>
	   <option value="어렸을 적 별명은?">어렸을 적 별명은?</option>
	   <option value="가장 좋아하는 영화는?">가장 좋아하는 영화는?</option>
	   <option value="가장 자주가는 음식점은?">가장 자주가는 음식점은?</option>
	   <option value="만약 물고기를 한마리 기른다면?">만약 물고기를 한마리 기른다면?</option>	
	</select></p>
   <p class="text" align="center"> 비밀번호 찾기 답: <input class="a" type="text" name="anwser" required><br>
    <input type="submit" value="확인"></p>
</form>
</div>

<!-- error에 대한 처리 -->
   <%if(request.getParameter("error") != null){ %>
   <h6><font color="red">해당하는 정보로 아이디를 찾지 못했습니다</font></h6>
   <%} %>
 
</body>
</html>