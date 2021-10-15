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
<script type="text/javascript">

</script>
</head>
<body>
<table>
  <tr>
    <th><a href="myStudy.jsp">내가 모집한 스터디</a></th>
    <th><a href="wishStudy.jsp">내가 찜한 스터디</a></th>
    <th style="background-color:aqua;"><a href="signStudy.jsp">내가 신청한 스터디</a></th>
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
    <th>신청취소</th>
  </tr>
  <tr>
    <th>모집중</th>
    <th>10/6</th>
    <th>프론트 모집합니다</th>
    <th>1/5</th>
    <th>경기</th>
    <th>6</th>
    <th><input type="button" value="신청취소"></th>
    </tr>
  <tr>
    <th>모집완료</th>
    <th>9/10</th>
    <th>토이프로젝트</th>
    <th>5/5</th>
    <th>경기</th>
    <th>12</th>
    <th><input type="button" value="신청취소"></th>
  </tr>
</table>

</body>
</html>