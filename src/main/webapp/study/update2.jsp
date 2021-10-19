<%@page import="kosta.mvc.dao.StudyDAOImpl"%>
<%@page import="kosta.mvc.dto.Study"%>
<%@page import="kosta.mvc.dao.StudyDAO"%>
<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>


<HTML>
<HEAD>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript"></script>
</HEAD>

<BODY>
  <% 
 
    //해당 게시글번호를 통하여 게시글을 수정
    int num = Integer.parseInt(request.getParameter("num").trim()); //trim은 공백을 없앰
 
    //하나의 게시글의 대한 정보를 리턴
    StudyDAO sdao = new StudyDAOImpl();
    Study dto = sdao.viewStudy(num);
  
    
%>


        <form action="UpdateProc.jsp" method="post">
            <table width="600" border="1" bgcolor="skyblue">
                <tr height="40">
 
                    <td width="160" align="center">작성자</td>
                  	<td width="60" align="center"><%=dto.getUserId()%></td>
 
                    <td width="160" align="center">작성일</td>
                    <td width="220" align="center"><%=dto.getDayNo()%></td>
                </tr>
 
                <tr height="40">
                    <td width="170" align="center">제목</td>
                    <td width="430" colspan="3">&nbsp; <input type="text"
                        name="subject" value="<%=dto.getStudyTitle()%>" size="60"></td>
                </tr>
 

                <tr height="40">
                    <td width="170" align="center">글내용</td>
                    <td width="430" colspan="3"><textarea rows="10" cols="60"
                            name="content"><%=dto.getStudyContent() %></textarea></td>
                </tr>
 
                <tr height="40">
                    <td colspan="4" align="center"><input type="hidden" name="num"
                        value="<%=num %>"> <input type="submit" value="글수정">
                        &nbsp;&nbsp; <input type="button"
                        onclick="location.href='list.jsp'" value="전체글보기"></td>
                </tr>
 
 
            </table>
        </form>

</body>
</html>









