



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">

<script type="text/javascript">


</script>
</head>
<body>

<table>
  <tr>
    <%-- <th><iframe src="freeBoardMenu.jsp" height="600" width="250"></iframe></th> --%>
    <th>
    	
	
		<jsp:include page="../board/freeBoardMenu.jsp" />
    </th>
   
   <td><iframe  src="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost"height="600" width="800" name="board"></iframe></td>
    
    <%--
    <td><iframe src="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost"height="600" width="800" name="board"></iframe></td>
     <td><iframe src="${pageContext.request.contextPath}/front?key=search&methodName=searchByTitle&postTitle=시간"height="600" width="800" name="board"></iframe></td>
     
    <td><iframe src="${pageContext.request.contextPath}/front?key=search&methodName=searchByLikes"height="600" width="800" name="board"></iframe></td>
    <td><iframe src="${pageContext.request.contextPath}/front?key=search&methodName=searchByRecent"height="600" width="800" name="board"></iframe></td>
    
       --%>
       
  </tr>
</table>
</body>
</html>