<%@page import="kosta.mvc.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/CSS/bootstrap.css">
<link rel="stylesheet" href="${path }/CSS/bootstrap.min.css">
<style type="text/css">
	@import url("https://fonts.googleapis.com/css?family=Roboto:400,300");
*{font-family: 'Nanum Gothic', sans-serif;}
body {
	color: #2c3e50;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: 400;
}
	table td {
	text-align: center;
	color: black;
	font-weight: none;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="btn btn-outline-primary" data-bs-toggle="tab" href="${path}/front?key=myStudy&methodName=viewMyStudy">내가 모집한 스터디</a>
  </li>
  <li class="nav-item">
    <a class="btn btn-outline-primary" data-bs-toggle="tab" href="${path}/front?key=myStudy&methodName=viewWishStudy">내가 찜한 스터디</a>
  </li>
  <li class="nav-item">
    <a class="btn btn-outline-primary" data-bs-toggle="tab" href="${path}/front?key=myStudy&methodName=viewSignStudy">내가 신청한 스터디</a>
  </li>
  <li class="nav-item">
    <a class="btn btn-outline-primary" data-bs-toggle="tab" href="${path}/front?key=myStudy&methodName=viewJoinStudy">참여중/완료 스터디</a>
  </li>
</ul>

<table class="table">
<colgroup>
		<col width="15%"/>
		<col width="15%"/>
		<col width="30%"/>
		<col width="10%"/>
		<col width="20%"/>
		<col width="10%"/>
	</colgroup>
  <tr class="table-primary">
    <td valign="middle">
            <p align="center">
            <font color="black"><h6>모집여부</h6></font></p>
        </td>
        
     <td valign="middle">
            <p align="center"><font color="black"><h6>모집마감일</h6></font></p>
        </td>
        
    <td  valign="middle">
            <p align="center"><font color="black"><h6>제목</h6></font></p>
        </td>
        
    <td valign="middle">
            <p align="center"><font color="black"><h6>정원</h6></font></p>
        </td>
        
    <td valign="middle">
            <p align="center"><font color="black"><h6>지역</h6></font></p>
        </td>
        
   <td valign="middle">
            <p align="center"><font color="black"><h6>신청자 수</h6></font></p>
        </td>
  </tr>
  <c:choose>
    <c:when test="${empty requestScope.wishList}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.wishList}" var="Study">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            <c:if test="${Study.stateNo eq 1}">모집중</c:if>
		            <c:if test="${Study.stateNo eq 2}">스터디진행중</c:if>
		            <c:if test="${Study.stateNo eq 3}">스터디완료</c:if></span></p>
		        </th>
		        <th bgcolor="" valign="middle">
					<p align="center"><span style="font-size:11pt;">
					  ${Study.studyDuedate}</span></p>
		        </th>
		        
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyTitle}</span></p>
		        </th>
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyCurrNo}/${Study.studyMaxnum }</span></p>
		        </th>
		         
		         <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyLocationSi} ${Study.studyLocationGu}</span></p>
		        </th>
		         <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.signUserNo}</span></p>
		        </th>
		        
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>

</body>
</html>