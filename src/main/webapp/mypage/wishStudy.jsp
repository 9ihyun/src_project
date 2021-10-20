<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/CSS/mypageStyle.css">
<link rel="stylesheet" href="${path }/CSS/myStudyStyle.css">
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
<table>
  <tr>
    <th><a href="${path}/front?key=myStudy&methodName=viewMyStudy">내가 모집한 스터디</a></th>
    <th style="background-color:aqua;"><a href="${path}/front?key=myStudy&methodName=viewWishStudy">내가 찜한 스터디</a></th>
    <th><a href="${path}/front?key=myStudy&methodName=viewSignStudy">내가 신청한 스터디</a></th>
    <th><a href="joinStudy.jsp">참여중/완료 스터디</a></th>
  </tr>
</table>

<table>
  <tr>
    <th>모집여부</th>
    <th>마감일</th>
    <th>제목</th>
    <th>정원</th>
    <th>지역</th>
    <th>신청자수</th>
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
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.stateNo}</span></p>
		        </td>
		        <td bgcolor="">
					<p><span style="font-size:9pt;">
					  ${Study.studyDuedate}</span></p>
		        </td>
		        
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyTitle}</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyCurrNo}/${Study.studyMaxnum }</span></p>
		        </td>
		         
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyLocationSi}${Study.studyLocationGu}</span></p>
		        </td>
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.signUserNo}</span></p>
		        </td>
		        
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>

</body>
</html>