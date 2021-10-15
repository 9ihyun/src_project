<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/mypageStyle.css">
<link rel="stylesheet" href="../CSS/myStudyStyle.css">
<style type="text/css">

</style>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
  
</script>
</head>
<body>
<table>
  <tr>
    <th><a href="myStudy.jsp">내가 모집한 스터디</a></th>
    <th><a href="wishStudy.jsp">내가 찜한 스터디</a></th>
    <th><a href="signStudy.jsp">내가 신청한 스터디</a></th>
    <th style="background-color:aqua;"><a href="joinStudy.jsp">참여중/완료 스터디</a></th>
  </tr>
</table>

<table>
  <tr>
    <th>모집여부</th>
    <th>마감일</th>
    <th>제목</th>
    <th>정원</th>
    <th>지역</th>
    <th>스터디룸/평가</th>
  </tr>
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
    <th>8/8</th>
    <th>벡엔드</th>
    <th>7/7</th>
    <th>서울</th>
    <th><input type="button" value="평가하기"></th>
  </tr>
</table>

</body>
</html>