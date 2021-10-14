<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/signUpstyle.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<title>회원가입</title>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<h3 class="sign" align="center">회원가입</h3>

<div class="main">
<form class="form1" action="userProc.jsp" method = "post" align="center">
	ID : <input type = "text" name = "id"><br>
	비밀번호 : <input type = "text" name = "pass"><br>
	비밀번호 확인 : <input type = "text" name = "passcheck"><br>
	닉네임 : <input type = "text" name = "nickname"><br>
	생년월일 : <input type = "text" name = "birth" placeholder="8자리로 입력해주세요."><br>
	비밀번호 찾기 질문 : 
	<select class="question">
       <option value="0">--질문 선택--</option>
	   <option value="one">보물 1호는?</option>
	   <option value="two">어렸을 적 별명은?</option>
	   <option value="three">가장 좋아하는 영화는?</option>
	   <option value="four">가장 자주가는 음식점은?</option>
	   <option value="five">만약 물고기를 한마리 기른다면?</option>	
	</select> <br>
	비밀번호 찾기 답 : <input type = "text" name = "anwser"><br>
	<input type = "submit" value = "가입">
</form>


</div>

</body>
</html>