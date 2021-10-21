<%@page import="kosta.mvc.dto.User"%>
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
	th{padding-left: 15px; border: none;}
	#withdraw{margin-top: 15px;}
	p{margin-bottom: 0px;}
	
	
</style>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	  $(document).on("click", "#withdraw", function(){
		  if(confirm("정말 탈퇴하시겠습니까?")){
			  parent.location.href = "${path}/front?key=user&methodName=delete";
		  }
	  });
  });
</script>
</head>
<body>

<table class="table">
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
    <th><p class="text-primary">아이디</p></th>
    <th><p class="text-primary">별점</p></th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="id" value="${requestScope.user.userId }" class="form-control"></th>
    <th><input type="text" readonly="readonly" id="star" value="${requestScope.user.starPoint }" class="form-control"></th>
  </tr>
  <tr>
    <th><p class="text-primary">닉네임</p></th>
    <th><p class="text-primary">생년월일</p></th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="nickname" value="${requestScope.user.nickname }" class="form-control"></th>
    <th><input type="text" readonly="readonly" id="birth" value="${requestScope.user.birth }" class="form-control"></th>
  </tr>
  <tr>
    <th><p class="text-primary">가입날짜</p></th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly" id="regdate" value="${requestScope.user.regdate }" class="form-control"></th>
  </tr>
  <tr>
  	<th><input type="button" id="withdraw" value="탈퇴하기" class="btn btn-secondary"></th>
  </tr>
</table>
</body>
</html>