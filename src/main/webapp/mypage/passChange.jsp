<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<style type="text/css">
  span{
    color: red;
  }
</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
    $(function(){
    	let change = false;
    	
    	$("#newPass").keyup(function(){
    		if($('#newPass').val() == $("#pass").val()){
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
    		if($('#newPass').val() != $("#rePass").val()){
    			$("span").text("값이 일치하지 않습니다.");
    			change = false;
    		}else{
    			$("span").text("");
    			change = true;
    		}
    	});
    	
    	$(document).on("click", "[value=변경하기]", function(){
    		if(change){
    			alert("성공");
    		} else{
    			if($("#rePass").val()=="" || $("#newPass").val()=="" || $("#pass").val()==""){
    				alert("비밀번호를 입력해주세요");
    			}
    			else{
	    			if($("span").text() == "비밀번호가 일치합니다."){
	    				alert("현재번호와 다른 비밀번호를 입력해주세요");
	    				$("#newPass").val("");
	    				$("#rePass").val("");
	    				$("#newPass").focus();
	    				$("span").text("");
	    			}
	    			if($("span").text() == "값이 일치하지 않습니다."){
	    				alert("변경할 비밀번호를 정확히 입력해주세요");
	    				$("#rePass").val("");
	    				$("#rePass").focus();
	    				$("span").text("");
	    			}
    			}
    		}
    	});
    });
	
</script>
</head>
<body>
현재 비밀번호 입력<br>
<input type="password" id="pass"><br>
변경할 비밀번호 입력<br>
<input type="password" id="newPass"><br>
변경할 비밀번호 확인<br>
<input type="password" id="rePass"><br>
<span name = "check"></span><br>
<input type="button" value="변경하기">
</body>
</html>