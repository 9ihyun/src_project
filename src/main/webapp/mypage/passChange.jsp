<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style type="text/css">
  *{font-family: 'Nanum Gothic', sans-serif;}
  input[type=password]{width:200px;}
  input[type=submit]{margin-top: 15px;}
  th{padding-left: 15px; border: none;}
  p{margin-left: 15px; margin-bottom: 0px;}
  input{margin-left: 15px;}
  span{
    color: red;
  }
</style>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function(){
    	let change = false;
    	
    	$("#newPw").keyup(function(){
    		if($('#newPw').val() == $("#currentPw").val()){
    			$("span").text("비밀번호가 일치합니다.");
    			change = false;
    			$("#rePass").attr("readonly", "readonly");
    		} else{
    		    $("span").text("");
    		    change = false;
    		    $("#rePass").removeAttr("readonly");
    		}
    	});
    	
    	$("#rePass").keyup(function(){
    		if($('#newPw').val() != $("#rePass").val()){
    			$("span").text("값이 일치하지 않습니다.");
    			change = false;
    		}else{
    			$("span").text("");
    			change = true;
    		}
    	});
    	
    	$(document).on("click", "[value=변경하기]", function(){
    		if(!change){
    			if($("#rePass").val()=="" || $("#newPw").val()=="" || $("#currentPw").val()==""){
    				alert("비밀번호를 입력해주세요");
    				return false;
    			}
    			else{
	    			if($("span").text() == "비밀번호가 일치합니다."){
	    				alert("현재번호와 다른 비밀번호를 입력해주세요");
	    				$("#newPw").val("");
	    				$("#rePass").val("");
	    				$("#newPw").focus();
	    				$("span").text("");
	    				return false;
	    			}
	    			if($("span").text() == "값이 일치하지 않습니다."){
	    				alert("변경할 비밀번호를 정확히 입력해주세요");
	    				$("#rePass").val("");
	    				$("#rePass").focus();
	    				$("span").text("");
	    				return false;
	    			}
    			}
    		}
    	});
    });
	
</script>
</head>
<body>
<form action="${path }/front">
<input type="hidden" name = "key" value = "user">
<input type = "hidden" name = "methodName" value = "pwChange">		
<table class="table talble-hover">
<tr>
  	<th>
  		<h6></h6>
  	</th>
  </tr>
   <tr>
  	<th>
  		<h6></h6>
  	</th>
  </tr>
  <tr>
  	<th>
  		<h6></h6>
  	</th>
  </tr>
  <tr>
	<tr>
		<th><p class="text-primary">현재 비밀번호 입력</p></th>
	</tr>
	<tr>
		<th><input type="password" id="currentPw" name="currentPw" class="form-control"></th>
	</tr>
	<tr>
		<th><p class="text-primary">변경할 비밀번호 입력</p></th>
	</tr>
	<tr>
		<th><input type="password" id="newPw" name="newPw" class="form-control"></th>		
	</tr>
	<tr>
		<th><p class="text-primary">변경할 비밀번호 확인</p></th>
	</tr>
	<tr>
		<th><input type="password" id="rePass" class="form-control"></th>
		<th><span name = "check"></span></th>
	</tr>
	<tr>
		<th><input type="submit" value="변경하기" class="btn btn-secondary"></th>
	</tr>
</table>
</form>
</body>
</html>