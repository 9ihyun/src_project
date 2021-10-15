<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<style type="text/css">
  iframe{
    width: 500px; height: 500px
  }
</style>
<script type="text/javascript">


$(function(){
	 $("#mypage").click(function(){
		 parent.location.href = "mypageMain.jsp"
	 }); 
 });

</script>
</head>
<body>

<ol>
 <li><a href="#" target=""> 스터디 </a></li><p>
      <li><a href="#" target=""> 자유게시판</a></li><p>
      <li><a href="#"target = ""> 지식 정보 공유 게시판 </a></li><p>
      <li><a href="#"> 알쓸신술 </a></li><p>
    </ul>
</ol>

<table>
  <tr><a href="#" id="mypage">마이페이지</a></tr>&nbsp;
  <tr><a href="${pageContext.request.contextPath}/front?key=user&methodName=logout">로그아웃</a></tr>
</table>

</body>
</html>








</head>
<body>

</body>
</html>