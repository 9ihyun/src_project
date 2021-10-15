<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="kosta.mvc.dto.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">

</script>

<jsp:useBean id="muser" class ="kosta.mvc.dto.User"/>
<jsp:setProperty property="*" name="muser"/>  
<%

	request.setCharacterEncoding("euc-kr");

 UserDAO dao = UserDAO.getInstance();
	
String userid;
userid = dao.

String userirum = request.getParameter("userirum");
String usertel = request.getParameter("usertel");
String useremail = request.getParameter("useremail");

if(userid == null){}

%>
</head>
<body>

</body>
</html>