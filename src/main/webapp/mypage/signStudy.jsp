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
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	  $(document).on("click", "#delete", function(){
		  if(confirm("정말 신청을 취소하시겠습니까?")){
			$.ajax({
				type: "post",
				url: "${path}/ajax?key=myStudy&methodName=removeSignStudy",
				data: {"id" : "${sessionScope.userId}", "studyNo" : $(this).attr("name")},
				dataType: "json",
				success: function(result){
					$("#"+result[0].studyTitle).remove();
				},
				error:function() {
					console.log("실패");
				}
			});
		  }
	  });
  });
</script>
</head>
<body>
<table>
  <tr>
    <th><a href="${path}/front?key=myStudy&methodName=viewMyStudy">내가 모집한 스터디</a></th>
    <th><a href="${path}/front?key=myStudy&methodName=viewWishStudy">내가 찜한 스터디</a></th>
    <th style="background-color:aqua;"><a href="${path}/front?key=myStudy&methodName=viewSignStudy">내가 신청한 스터디</a></th>
    <th><a href="${path}/front?key=myStudy&methodName=viewJoinStudy">참여중/완료 스터디</a></th>
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
    <th>신청취소</th>
  </tr>
  <c:choose>
    <c:when test="${empty requestScope.signList}">
	   <tr>
        <th colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
        </th>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.signList}" var="Study">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'" id="${Study.studyTitle}">
		        <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <c:if test="${Study.stateNo eq 1}">모집중</c:if>
		            <c:if test="${Study.stateNo eq 2}">스터디진행중</c:if>
		            <c:if test="${Study.stateNo eq 3}">스터디완료</c:if></span></p>
		        </th>
		        <th bgcolor="">
					<p><span style="font-size:9pt;">
					  ${Study.studyDuedate}</span></p>
		        </th>
		        
		        <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyTitle}</span></p>
		        </th>
		        <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyCurrNo}/${Study.studyMaxnum }</span></p>
		        </th>
		         
		         <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.studyLocationSi}${Study.studyLocationGu}</span></p>
		        </th>
		         <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            ${Study.signUserNo}</span></p>
		        </th>
		        <th bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            <input type="button" value="신청취소" id="delete" name="${Study.studyNo }"></span></p>
		        </th>
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>

</body>
</html>