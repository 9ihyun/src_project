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
	input[type=submit]{margin-top: 15px;}
	p{margin-bottom: 0px;}
</style>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $("[name=pwq]").val("${sessionScope.user.pwq}") 
  });
</script>
</head>
<body>
<form action="${path }/front">
<table class="table talble-hover">
  <tr>
    <th><input type = hidden name = "key" value = "user"></th>
    <th><input type = hidden name = "methodName" value = "update"></th> 
  </tr>
  <tr>
    <th><p class="text-primary">닉네임</p></th>
    <th><p class="text-primary">비밀번호 찾기 질문</p></th>
  </tr>
  <tr>
    <th><input type="text" name="nickname" value="${sessionScope.user.nickname}" class="form-control"></th>
    <th><select class="form-select" name="pwq" class="btn btn-primary">
       <option value="0">--질문 선택--</option>
	   <option value="보물 1호는?">보물 1호는?</option>
	   <option value="어렸을 적 별명은?">어렸을 적 별명은?</option>
	   <option value="가장 좋아하는 영화는?">가장 좋아하는 영화는?</option>
	   <option value="가장 자주가는 음식점은?">가장 자주가는 음식점은?</option>
	   <option value="만약 물고기를 한마리 기른다면?">만약 물고기를 한마리 기른다면?</option>	
	</select></th>
  </tr>
  <tr>
    <th><p class="text-primary">생년월일</p></th>
    <th><p class="text-primary">비밀번호 찾기 답</p></th>
  </tr>
  <tr>
    <th><input type="text" name="birth" value="${sessionScope.user.birth}" class="form-control"></th>
    <th><input type="text" name="pwa" value="${sessionScope.user.pwa}" class="form-control"></th>
  </tr>
  <tr>
    <th colspan="2"><input type="submit" value="수정하기" class="btn btn-secondary"></th>
  </tr>
</table>
</form>
</body>
</html>