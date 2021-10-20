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
  img{
    width: 10px; height: 10px;
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
	 
	 $(document).on("click", "img", function(){
		 var num = $(this).attr("name");
		 num = num.split("-");
		 for(var i = 1; i<= 5; i++){
			 $("#join > tbody > tr:nth-child(" + num[0] + ") > th:nth-child(3) > ul > li:nth-child(" + num[1] + ") > img:nth-child(" + i + ")").attr("src", "../img/blackstar.jpg");
		 }
		 for(var i = 1; i<= num[2]; i++){
			 $("#join > tbody > tr:nth-child(" + num[0] + ") > th:nth-child(3) > ul > li:nth-child(" + num[1] + ") > img:nth-child(" + i + ")").attr("src", "../img/star.jpg");
		 }
		 
	 });
  });
</script>
</head>
<body>
<% int i = 2; %>
<table>
  <tr>
    <th><a href="${path}/front?key=myStudy&methodName=viewMyStudy">내가 모집한 스터디</a></th>
    <th><a href="${path}/front?key=myStudy&methodName=viewWishStudy">내가 찜한 스터디</a></th>
    <th><a href="${path}/front?key=myStudy&methodName=viewSignStudy">내가 신청한 스터디</a></th>
    <th style="background-color:aqua;"><a href="${path}/front?key=myStudy&methodName=viewJoinStudy">참여중/완료 스터디</a></th>
  </tr>
</table>
<table id="join">
  <tr>
    <th>모집여부</th>
    <th>마감일</th>
    <th>제목</th>
    <th>정원</th>
    <th>지역</th>
    <th>스터디룸/평가</th>
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
		            <c:if test="${Study.stateNo eq 2}"><a href="#" id="<%= i++%>">이동</a></c:if>
		            <c:if test="${Study.stateNo eq 3}"><input type="button" value="평가하기" id="<%= i++%>"></c:if>
		            </span></p>
		        </th>
		        
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
  <tr>
    <th>진행중</th>
    <th>9/23</th>
    <th>프론트 모집합니다</th>
    <th>5/5</th>
    <th>경기</th>
    <th><a href="studyRoom.jsp">이동</a></th>
  </tr>
  <tr>
    <th>스터디종료</th>
    <th>7/7
    </th>
    <th>백엔드
	  <ul style="display:none">
	    <li>황선민<img src="../img/blackstar.jpg" name="3-1-1"><img src="../img/blackstar.jpg" name="3-1-2"><img src="../img/blackstar.jpg" name="3-1-3"><img src="../img/blackstar.jpg" name="3-1-4"><img src="../img/blackstar.jpg" name="3-1-5"><input type="button" value="평가하기" name='star'></li>
	    <li>이기현<img src="../img/blackstar.jpg" name="3-2-1"><img src="../img/blackstar.jpg" name="3-2-2"><img src="../img/blackstar.jpg" name="3-2-3"><img src="../img/blackstar.jpg" name="3-2-4"><img src="../img/blackstar.jpg" name="3-2-5"><input type="button" value="평가하기" name='star'></li>
	    <li>조성휘<img src="../img/blackstar.jpg" name="3-3-1"><img src="../img/blackstar.jpg" name="3-3-2"><img src="../img/blackstar.jpg" name="3-3-3"><img src="../img/blackstar.jpg" name="3-3-4"><img src="../img/blackstar.jpg" name="3-3-5"><input type="button" value="평가하기" name='star'></li>
	    <li>현지윤<img src="../img/blackstar.jpg" name="3-4-1"><img src="../img/blackstar.jpg" name="3-4-2"><img src="../img/blackstar.jpg" name="3-4-3"><img src="../img/blackstar.jpg" name="3-4-4"><img src="../img/blackstar.jpg" name="3-4-5"><input type="button" value="평가하기" name='star'></li>
	    <li>윤솔<img src="../img/blackstar.jpg" name="3-5-1"><img src="../img/blackstar.jpg" name="3-5-2"><img src="../img/blackstar.jpg" name="3-5-3"><img src="../img/blackstar.jpg" name="3-5-4"><img src="../img/blackstar.jpg" name="3-5-5"><input type="button" value="평가하기" name='star'></li>
	    <li>홍전형<img src="../img/blackstar.jpg" name="3-6-1"><img src="../img/blackstar.jpg" name="3-6-2"><img src="../img/blackstar.jpg" name="3-6-3"><img src="../img/blackstar.jpg" name="3-6-4"><img src="../img/blackstar.jpg" name="3-6-5"><input type="button" value="평가하기" name='star'></li>
	  </ul>
	</th>
    <th>7/7</th>
    <th>서울</th>
    <th><input type="button" value="평가하기" id="4"></th>
  </tr>
  <tr>
    <th>스터디종료</th>
    <th>7/7
    </th>
    <th>백엔드
	  <ul style="display:none">
	    <li>황선민<img src="../img/blackstar.jpg" name="4-1-1"><img src="../img/blackstar.jpg" name="4-1-2"><img src="../img/blackstar.jpg" name="4-1-3"><img src="../img/blackstar.jpg" name="4-1-4"><img src="../img/blackstar.jpg" name="4-1-5"><input type="button" value="평가하기" name='star'></li>
	    <li>이기현<img src="../img/blackstar.jpg" name="4-2-1"><img src="../img/blackstar.jpg" name="4-2-2"><img src="../img/blackstar.jpg" name="4-2-3"><img src="../img/blackstar.jpg" name="4-2-4"><img src="../img/blackstar.jpg" name="4-2-5"><input type="button" value="평가하기" name='star'></li>
	    <li>조성휘<img src="../img/blackstar.jpg" name="4-3-1"><img src="../img/blackstar.jpg" name="4-3-2"><img src="../img/blackstar.jpg" name="4-3-3"><img src="../img/blackstar.jpg" name="4-3-4"><img src="../img/blackstar.jpg" name="4-3-5"><input type="button" value="평가하기" name='star'></li>
	    <li>현지윤<img src="../img/blackstar.jpg" name="4-4-1"><img src="../img/blackstar.jpg" name="4-4-2"><img src="../img/blackstar.jpg" name="4-4-3"><img src="../img/blackstar.jpg" name="4-4-4"><img src="../img/blackstar.jpg" name="4-4-5"><input type="button" value="평가하기" name='star'></li>
	    <li>윤솔<img src="../img/blackstar.jpg" name="4-5-1"><img src="../img/blackstar.jpg" name="4-5-2"><img src="../img/blackstar.jpg" name="4-5-3"><img src="../img/blackstar.jpg" name="4-5-4"><img src="../img/blackstar.jpg" name="4-5-5"><input type="button" value="평가하기" name='star'></li>
	    <li>홍전형<img src="../img/blackstar.jpg" name="4-6-1"><img src="../img/blackstar.jpg" name="4-6-2"><img src="../img/blackstar.jpg" name="4-6-3"><img src="../img/blackstar.jpg" name="4-6-4"><img src="../img/blackstar.jpg" name="4-6-5"><input type="button" value="평가하기" name='star'></li>
	  </ul>
	</th>
    <th>7/7</th>
    <th>서울</th>
    <th><input type="button" value="평가하기" id="5"></th>
  </tr>
</table>

</body>
</html>