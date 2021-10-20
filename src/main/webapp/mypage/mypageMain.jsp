<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" href="${path }/CSS/mypageStyle.css">
<style type="text/css">
  iframe{
    width: 500px; height: 500px
  }
</style>
<script type="text/javascript">

</script>
</head>
<body>
<% session.setAttribute("userId", "test1");
   session.setAttribute("loginUser", "test1");
   
   %>
<table>
  <tr>
    <th><iframe src="mypageMenu.jsp"></iframe></th>
    <th><iframe src="startPage.jsp" name="page"></iframe></th>
  </tr>
</table>
</body>
</html>