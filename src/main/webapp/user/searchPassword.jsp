<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../CSS/searchIdstyle.css">
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input[type=submit]:hover{
		background-color: #aaa;
		color: #fff;
		cursor: pointer;
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
    <p align="center">생년월일: <input class="un" type="text" name="birth" placeholder="8자리로 입력하세요." required></p>
   <p align="center"> 비밀번호 찾기 질문 : 
	<select name="question" required>
       <option value="0">--질문 선택--</option>
	   <option value="보물 1호는?">보물 1호는?</option>
	   <option value="어렸을 적 별명은?">어렸을 적 별명은?</option>
	   <option value="가장 좋아하는 영화는?">가장 좋아하는 영화는?</option>
	   <option value="가장 자주가는 음식점은?">가장 자주가는 음식점은?</option>
	   <option value="만약 물고기를 한마리 기른다면?">만약 물고기를 한마리 기른다면?</option>	
	</select></p>
   <p align="center"> 비밀번호 찾기 답: <input class="a" type="text" name="anwser" required><br>
    <input type="submit" value="확인"></p>
</form>
</div>

<!-- error에 대한 처리 -->
   <%if(request.getParameter("error") != null){ %>
   <h6><font color="red">해당하는 정보로 아이디를 찾지 못했습니다</font></h6>
   <%} %>
 
</body>
</html>