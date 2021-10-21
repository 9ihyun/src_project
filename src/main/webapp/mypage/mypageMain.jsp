<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<style type="text/css">
</style>
<script type="text/javascript">

</script>
</head>
<body>

<table>
  <tr>
    <th><jsp:include page="mypageMenu.jsp" /></th>
    <th><iframe src="${path}/front?key=user&methodName=myInfo" name="page" height="800" width="1000"></iframe></th>
  </tr>
</table>
</body>
</html>