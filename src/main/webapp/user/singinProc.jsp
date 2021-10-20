<%@page import="kosta.mvc.dto.User"%>
<%@page import="kosta.mvc.dao.LoginDAOImpl"%>
<%@page import="kosta.mvc.dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAOImpl();
		User user = dao.loginCheck(id, pwd);
		
		
		if(user != null)
		{ 
			session.setAttribute(id, pwd);
			System.out.println(id);
			%>
			<jsp:forward page="studyMain.jsp">
				<jsp:param value="<%=user%>" name="user"/>
			</jsp:forward>
			<%		
		}
		else
		{
			response.sendRedirect("singin.jsp");	
		}
	%>

</body>
</html>