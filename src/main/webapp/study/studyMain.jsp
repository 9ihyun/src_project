
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  link rel="stylesheet" href="../CSS/mypageStyle.css"-->
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<table>
  <tr>
    <th>
    	
		<jsp:include page="../board/freeBoardMenu.jsp" />
    </th>
    <td><iframe src="${pageContext.request.contextPath}/front?key=study&methodName=selectAllStudy" height="800" width="1000" name="board"></iframe></td>
  </tr>
</table>
</body>
</html>