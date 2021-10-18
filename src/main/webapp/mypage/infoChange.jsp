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

</style>
<script type="text/javascript">

</script>
</head>
<body>
<form action="${path }/front">
<table>
  <tr>
    <th><input type = hidden name = "key" value = "user"></th>
    <th><input type = hidden name = "methodName" value = "update"></th> 
  </tr>
  <tr>
    <th>닉네임</th>
    <th>비밀번호 찾기 질문</th>
  </tr>
  <tr>
    <th><input type="text" name="nickname"></th>
    <th><select class="question" name="pwq">
       <option value="0">--질문 선택--</option>
	   <option value="one">보물 1호는?</option>
	   <option value="two">어렸을 적 별명은?</option>
	   <option value="three">가장 좋아하는 영화는?</option>
	   <option value="four">가장 자주가는 음식점은?</option>
	   <option value="five">만약 물고기를 한마리 기른다면?</option>	
	</select></th>
  </tr>
  <tr>
    <th>생년월일</th>
    <th>비밀번호 찾기 답</th>
  </tr>
  <tr>
    <th><input type="text" name="birth"></th>
    <th><input type="text" name="pwa"></th>
  </tr>
  <tr>
    <th colspan="2"><input type="submit" value="수정하기"></th>
  </tr>
</table>
</form>
</body>
</html>