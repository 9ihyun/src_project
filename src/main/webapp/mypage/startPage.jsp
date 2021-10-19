<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function(){
	  
	  //alert("${pageContext.request.contextPath}")
	 // alert("${applicationScope.path}")
	  location.href="${path}/front?key=user&methodName=myInfo";
	  
});
</script>
</head>
<body>
	<h3>메인페이지</h3>

</body>
</html>