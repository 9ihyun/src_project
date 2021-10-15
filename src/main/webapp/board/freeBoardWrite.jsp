<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>자유게시판</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href = "css/bootstrap/css">

<style type="text/css"> </style>
</head>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$("#ser").click(function() {
		alert(1)
	});
	
	 

</script>

<body>

<header>
  <h2></h2>
</header>

<section>
  
  <article>
    <h1> 자유게시판 </h1>
	<div style = "text-align: right;">
	
	<form action="fe">
	<input type="text"value="검색어를 입력해주세요"/>
	<input type ="button" id= "ser" value="검색" />
	
	<select name="array" >
         <option value="0">---정렬--- </option>
	   <option value="최근글">최신글</option>
	   <option value="인기글">인기글</option>
	   <option value="조회수 많은">조회수 높은</option>
	   <option value="조회수 적은">조회수 적은</option>

	   
	  </div>
	  
	 </select>
	 <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: end; border: 2px solid #dddddd">
				<thead>
					<tr style="text-align: center;">
						<th style="background-color: #eeeeee; text-align: center;"> 번호 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 추천 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 날짜 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 테스트  -->
						<td>1</td>
						<td>안녕하세요</td>
						<td>10</td>
						<td>2021-10-14</td>
					</tr>
				</tbody>
			</table>

</table>

	 

<p>
<a href="WriteInfo.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</form>
  </article>
</section>

<footer>
  <p></p>
</footer>

</body>
</html>