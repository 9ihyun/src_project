<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" href="${path }/CSS/mypageStyle.css">
<style type="text/css">
</style>
<script type="text/javascript">

</script>
</head>
<body>

<table>
  <tr>
    <th><jsp:include page="mypageMenu.jsp" /></th>
    <th><iframe src="startPage.jsp" name="page" height="600" width="800"></iframe></th>
  </tr>
</table>
</body>
</html>