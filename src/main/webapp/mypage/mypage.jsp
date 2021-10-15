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
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(document).on("click", "#withdraw", function(){
	 confirm("정말 탈퇴하시겠습니까?");
  });
</script>
</head>
<body>
<table>
  <tr>
    <th>아이디</th>
    <th>별점</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly"></th>
    <th><input type="text" readonly="readonly"></th>
  </tr>
  <tr>
    <th>닉네임</th>
    <th>생년월일</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly"></th>
    <th><input type="text" readonly="readonly"></th>
  </tr>
  <tr>
    <th>가입날짜</th>
  </tr>
  <tr>
    <th><input type="text" readonly="readonly"></th>
  </tr>
</table>
<input type="button" id="withdraw" value="탈퇴하기">
</body>
</html>