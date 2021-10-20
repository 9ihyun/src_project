<%@page import="kosta.mvc.dao.LoginDAOImpl"%>
<%@page import="kosta.mvc.dao.LoginDAO"%>
<%@page import="kosta.mvc.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- Join.jsp에서 입력한 정보를 넘겨 받아 처리한다. --%>
    <% 
        // 한글 깨짐을 방지하기 위한 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="user" class="kosta.mvc.dto.User" />
    <jsp:setProperty property="*" name="user"/>    
    
    <%
        LoginDAO dao = new LoginDAOImpl();
    
        // 회원정보를 담고있는 user를 dao의 register() 메서드로 넘긴다.
        // register()는 회원 정보를 테이블에 저장한다.
        dao.register(user);
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
        <br><br>
        <font color="blue"><%=user.getNickname() %></font>님 가입을 축하드립니다.
        <br><br>
        
        <%-- 자바빈에서 입력된 값을 추출한다. --%>
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=user.getUserId() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=user.getPw() %></td>
            </tr>
                    
            <tr>
                <td id="title">닉네임</td>
                <td><%=user.getNickname() %></td>
            </tr>
                         
            <tr>
                <td id="title">생일</td>
                <td>
                    <%=user.getBirth() %>
                </td>
            </tr>
                    
          
        </table>
        
        <br>
        <input type="button" value="확인">
    </div>

</body>
</html>