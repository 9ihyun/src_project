<%@page import="kosta.mvc.dao.StudyDAOImpl"%>
<%@page import="kosta.mvc.dao.StudyDAO"%>
<%@page import="kosta.mvc.dto.Study"%>
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
	//로그인 한 사람은 userId에 해당 아이디 등록, 그렇지 않으면 null
	String userId = null;
if(session.getAttribute("userId") != null){
	userId = (String)session.getAttribute("userId");
}

	//로그인 안했을 떄
	if(userId == null){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('로그인 이후 이용하세요')");
		script.print("location.href='signin.jsp'");
		script.print("</script>");
		
	}
	
	//글번호
	int studyNo = 0;
	if(request.getParameter("studyNo")!=null){
		studyNo = Integer.parseInt(request.getParameter("studyNo"));
	}
	
	if(studyNo == 0){
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('유효하지 않은 글 입니다.')");
		script.print("location.href='list.jsp'");
		script.print("</script>");
	}
	
%>

<!-- 게시글 보기 -->
<form action="updateProc.jsp?studyNo=<%=studyNo %>">
<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' >
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             게시물 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집여부</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.stateNo}</b></span>
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">태그 번호</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.tagNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">작성자 아이디</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.userId}</b></span>
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집 정원</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyMaxnum}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyDuedate}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">요일</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.study.studyRegdate}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">지역(시)</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyLocationSi}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">지역(구)</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.study.studyLocationGu}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.study.studyContent}</pre></b></span></td>
    </tr>
    <tr>
    	<button type= "submit">수정하기</button>
    </tr>
</table>
</form>


</body>
</html>