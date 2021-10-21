



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">

<style type="text/css">

</style>
<script type="text/javascript">


</script>
</head>
<body>
<!-- 이 주석은 지워주세요~ -->



<table>
  <tr>
    <%-- <th><iframe src="freeBoardMenu.jsp" height="600" width="250"></iframe></th> --%>
    <th>
    	
		<jsp:include page="infoBoardMenu.jsp" />
    </th>
    <td><iframe src="${pageContext.request.contextPath}/front?key=post&methodName=Allpost"height="800" width="1000" name="board"></iframe></td>
    
    
    
    
  </tr>
</table>
</body>
</html>