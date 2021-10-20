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
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="../js/ajaxBasic.js"></script>

<script>
// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
function checkValue()
{
    if(!document.userInfo.id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(!document.userInfo.password.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(document.userInfo.password.value != document.userInfo.passcheck.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }
}

</script>
</head>
<body>
<h3 class="sign" align="center">회원가입</h3>

<div class="main">
<form method = "post" align="center" action = "joinProc.jsp" name="userInfo" onsubmit="return checkValue()">
	ID : <input type = "text" name = "id"><br>
	<div class="checkFont" id="idCheck"></div>
	비밀번호 : <input type = "password" name = "pass"><br>
	비밀번호 확인 : <input type = "password" name = "passcheck"><br>
	<font name = "check" size="2" color="red"></font>
	닉네임 : <input type = "text" name = "nickname"><br>
	생년월일 : <input type = "text" name = "birth" placeholder="8자리로 입력해주세요."><br>
	비밀번호 찾기 질문 : 
	<select name="question">
       <option value="0">--질문 선택--</option>
	   <option value="one">보물 1호는?</option>
	   <option value="two">어렸을 적 별명은?</option>
	   <option value="three">가장 좋아하는 영화는?</option>
	   <option value="four">가장 자주가는 음식점은?</option>
	   <option value="five">만약 물고기를 한마리 기른다면?</option>	
	</select> <br>
	비밀번호 찾기 답 : <input type = "text" name = "anwser"><br>
	<input type = "submit" value="가 입">
</form>


</div>

</body>
</html>