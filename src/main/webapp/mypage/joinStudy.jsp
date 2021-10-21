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
  img{
    width: 10px; height: 10px;
  }
  	table td {
	text-align: center;
	color: black;
	font-weight: none;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  $(function(){
	 $(document).on("click", "[value=평가하기]", function(){
		$(this).val("평가완료");
		let num = $(this).attr("id");
		$("#join > tbody >tr:nth-child(" + num + ") > th:nth-child(3) > ul").show();
		
	 });
	 $(document).on("click", "[value=평가완료]", function(){
		$(this).val("평가하기");
		let num = $(this).attr("id");
		$("#join > tbody >tr:nth-child(" + num + ") > th:nth-child(3) > ul").hide();
	 });
	 
	 $(document).on("click", "[value=별점주기]", function(){
		  if(confirm($(this).attr("id") + "님에게 별점을 주시겠습니까?")){
			$.ajax({
				type: "post",
				url: "${path}/ajax?key=user&methodName=starPoint",
				data: {"id" : $(this).attr("id"), "point" : $(this).attr("name")},
				dataType: "json",
				success: function(result){
					alert("별점이 적용되었습니다");
				},
				error:function() {
					console.log("실패");
				}
			});
		  }
	  });
	 
	 $(document).on("click", "img", function(){
		 var num = $(this).attr("name");
		 num = num.split("-");
		 for(var i = 2; i<= 6; i++){
			 $("#join > tbody > tr:nth-child(" + num[0] + ") > th:nth-child(3) > ul > li:nth-child(" + num[1] + ") > img:nth-child(" + i + ")").attr("src", "${path}/img/blackstar.jpg");
		 }
		 for(var i = 1; i<= num[2]; i++){
			 $("#join > tbody > tr:nth-child(" + num[0] + ") > th:nth-child(3) > ul > li:nth-child(" + num[1] + ") > img:nth-child(" + i + ")").attr("src", "${path}/img/star.jpg");
		 }
		 $("#join > tbody > tr:nth-child(" + num[0] + ") > th:nth-child(3) > ul > li:nth-child(" + num[1] + ") > input").attr("name", num[2]-1);
	 });
  });
</script>
</head>
<body>
<% int tr = 2; %>
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

<table id="join" class="table">
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
            <p align="center"><font color="black"><h6>스터디룸/평가</h6></font></p>
        </td>

  </tr>
  <c:choose>
    <c:when test="${empty requestScope.joinList}">
	   <tr>
        <th colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
        </th>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.joinList}" var="Study">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            <c:if test="${Study.stateNo eq 1}">모집중</c:if>
		            <c:if test="${Study.stateNo eq 2}">스터디진행중</c:if>
		            <c:if test="${Study.stateNo eq 3}">스터디완료</c:if></span></p>
		        </th>
		        <th bgcolor="" valign="middle">
					<p><span style="font-size:11pt;">
					  ${Study.studyDuedate}</span></p>
		        </th>
		        
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyTitle}
		            <c:if test="${Study.stateNo eq 3}">
		            <ul style="display:none">
		              <%int li = 1; %>
		              <c:forEach var="user" items="${Study.userList}">
		              <% int num = 2; %>
	                  <li>${user.nickname }(${user.userId })<br>
	                      <img src="${path}/img/blackstar.jpg" name="<%=tr%>-<%=li%>-<%=num++%>">
	                      <img src="${path}/img/blackstar.jpg" name="<%=tr%>-<%=li%>-<%=num++%>">
	                      <img src="${path}/img/blackstar.jpg" name="<%=tr%>-<%=li%>-<%=num++%>">
	                      <img src="${path}/img/blackstar.jpg" name="<%=tr%>-<%=li%>-<%=num++%>">
	                      <img src="${path}/img/blackstar.jpg" name="<%=tr%>-<%=li++%>-<%=num++%>">
	                      <input type="button" value="별점주기" id="${user.userId }" class="btn btn-warning"></li>
	                </c:forEach></ul></c:if></span></p>
		        </th>
		        <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyCurrNo}/${Study.studyMaxnum }</span></p>
		        </th>
		         
		         <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${Study.studyLocationSi}${Study.studyLocationGu}</span></p>
		        </th>
		         <th bgcolor="" valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            <c:if test="${Study.stateNo eq 2}"><a href="${path}/front?key=myStudy&methodName=viewStudyRoomChat&studyNo=${Study.studyNo}&studyTitle=${Study.studyTitle}" id="<%= tr++%>" class="btn btn-danger">스터디룸</a></c:if>
		            <c:if test="${Study.stateNo eq 3}"><input type="button" value="평가하기" id="<%= tr++%>" class="btn btn-warning"></c:if>
		            </span></p>
		        </th>
		        
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
  
</table>

</body>
</html>