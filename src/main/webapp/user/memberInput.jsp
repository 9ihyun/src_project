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
	//비밀번호 일치 여부
	$(function(){
		$('#pass').keyup(function(){
			$('font[name=check]').text('');
		});
		
		$('#passcheck').keyup(function(){
			if($('#pass').val() != $('#passcheck').val()){
				$('font[name=check]').text('');
				$('font[name=check]').html('값이 일치하지 않습니다.');
			}else{
				$('font[name=check]').text('');
				$('font[name=check]').html('값이 일치합니다.');
			}
		});//비번 끝
		
		//아이디 중복체크 여부
		$('#id').blur(function(){
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/duplicationCheck",
				data: {
					"id" : $('#id').val()
				},
				
				success: function(data){
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idCheck").text("사용중인 아이디입니다.");
						$("#idCheck").css("color", "red");
					}else{
						$("#idCheck").text("");
					}
				}error:function() {
						console.log("실패");
				}
			})
		})//아이디 끝
		
		//닉네임 중복체크 여부
		$('#nickname').blur(function(){
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/duplicationCheck",
				data: {
					"nickname" : $('#nickname').val()
				},
				
				success: function(data){
					if (data == 1) {
						$("#nickname").text("사용중인 닉네임입니다.");
						$("#nickname").css("color", "red");
					}else{
						$("#nickname").text("");
					}
				}error:function() {
						console.log("실패");
				}
			})
		})//닉네임끝
		
		
	});//ready 끝
</script>
</head>
<body>
<h3 class="sign" align="center">회원가입</h3>

<div class="main">
<form class="form1" action="userProc.jsp" method = "post" align="center">
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
	<a href="${pageContext.request.contextPath}/front?key=user&methodName=register">가 입</a>
</form>


</div>

</body>
</html>