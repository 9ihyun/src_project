<%@page import="java.io.PrintWriter"%>
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
	String userId = null;
if(session.getAttribute("userId")!=null){//유저 아이디 이름으로 세션이 존재하는 회원들은
	userId = (String)session.getAttribute("userId"); //유저아이디에 해당 세션값을 넣어준다.
	
}

if(userId == null){
	PrintWriter script = response.getWriter();
	script.print("<script>");
	script.print("alert('로그인 이후 이용하세요')");
	script.print("location.href='signin.jsp'");
	script.print("</script>");
}

//글 유효성 체크
int studyNo = 0;
if(request.getParameter("studyId") != null){
	studyNo = Integer.parseInt(request.getParameter("studyNo"));
}
if(studyNo == 0){
	PrintWriter script = response.getWriter();
	script.print("<script>");
	script.print("alert('유효하지 않은 글입니다.')");
	script.print("location.href='list.jsp'");
	script.print("</script>");
}

%>
</body>
</html>