
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<table>
  <tr>
    <%-- <th><iframe src="freeBoardMenu.jsp" height="600" width="250"></iframe></th> --%>
    <th>
    	<%-- 
    	<ol>
			<li><a href="#" target=""> 스터디 </a></li> &nbsp;&nbsp;
			<li><a href="freeBoardWrite.jsp" target="board"> 자유게시판</a></li> &nbsp;&nbsp;
			<li><a href="#"target = ""> 지식 정보 공유 게시판 </a></li> &nbsp;&nbsp;
			<li><a href="#"target = ""> 알쓸신술 </a></li> &nbsp;&nbsp;
		    <li><a href="../mypage/mypageMain.jsp">마이페이지</a></li>&nbsp;
		    <li><a href="${pageContext.request.contextPath}/front?key=user&methodName=logout">로그아웃</a></li>
		</ol> --%>
		<jsp:include page="freeBoardMenu.jsp" />
    </th>
    <td><iframe src="freeBoardWrite.jsp"height="600" width="800" name="board"></iframe></td>
  </tr>
</table>
</body>
</html>