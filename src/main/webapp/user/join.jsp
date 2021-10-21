<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../CSS/joinstyle.css">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&family=Jua&display=swap" rel="stylesheet">
<title>회원가입</title>
<style type="text/css">
</style>
<script src="../js/jquery-3.6.0.js"></script>

<script>
$(function(){
	$("#id").keyup(function(){
		 if($(this).val()==""){
			 $("#idCheck").text("");
			 return; 
		 }
		 
		$.ajax({
			 url: "${path}/ajax?key=login&methodName=idCheck", 
			 type: "post",
			 dataType: "text",
			 data: {id : $(this).val()}, 
			 success: function(result){
				 $("#idCheck").text(result);
				 $("#idCheck").css("color", "red");
				 $("#idCheck").css("marginTop", "-10px");
				 $("#idCheck").css("marginLeft", "70px");
			 }, 
			 error: function(err){
				 alert(err+"발생했어요");
			 }
		 });
	 });
	
	$("#nick").keyup(function(){
		 if($(this).val()==""){
			 $("#nickCheck").text("");
			 return; 
		 }
		 
		$.ajax({
			 url: "${path}/ajax?key=login&methodName=nicknameCheck", 
			 type: "post",
			 dataType: "text",
			 data: {nickname : $(this).val()}, 
			 success: function(result){
				 $("#nickCheck").text(result);
				 $("#nickCheck").css("color", "red");
				 $("#nickCheck").css("marginTop", "-10px");
				 $("#nickCheck").css("marginLeft", "70px");
			
			 }, 
			 error: function(err){
				 alert(err+"발생했어요");
			 }
		 });
	 });
	
	$("form").submit(function(){
	    if($("[name=pass]").val() != $("[name=passCheck]").val() ){
	        alert("비밀번호를 동일하게 입력하세요.");
	        return false;
	    }
	    
	    if($("#idCheck").text() == "이미 사용 중인 아이디입니다."){
	        alert("아이디를 다시 설정하세요.");
	        return false;
	    }
	    
	    if($("#nickCheck").text() == "이미 사용 중인 닉네임입니다."){
	        alert("닉네임을 다시 설정하세요.");
	        return false;
	    }
	});
	    
});

</script>
</head>
<body>

<div class="main">
<h3 class="sign" align="center">회원가입</h3>
<form method = "post" align="center" action = "${pageContext.request.contextPath}/front?key=login&methodName=register">
	ID : <input type = "text" name = "id" id="id" autofocus required><br>
	<div id="idCheck"></div>
	비밀번호 : <input type = "password" name = "pass" autofocus required><br>
	비밀번호 확인 : <input type = "password" name = "passCheck" autofocus required><br>
	닉네임 : <input type = "text" name = "nickname" id="nick" autofocus required><br>
	<div id="nickCheck"></div>
	생년월일 : <input type = "text" name = "birth" placeholder="ex) 19991231" autofocus required><br>
	비밀번호 찾기 질문 : 
	<select name="question">
       <option value="0">--질문 선택--</option>
	   <option value="보물 1호는?">보물 1호는?</option>
	   <option value="어렸을 적 별명은?">어렸을 적 별명은?</option>
	   <option value="가장 좋아하는 영화는?">가장 좋아하는 영화는?</option>
	   <option value="가장 자주가는 음식점은?">가장 자주가는 음식점은?</option>
	   <option value="만약 물고기를 한마리 기른다면?">만약 물고기를 한마리 기른다면?</option>	
	</select> <br>
	비밀번호 찾기 답 : <input type = "text" name = "anwser" autofocus required><br>
	<input type = "submit" value="가 입">
</form>


</div>

</body>
</html>