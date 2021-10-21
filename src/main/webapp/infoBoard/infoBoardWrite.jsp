<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function go(){
		var a = document.getElementById("searchs").value;
		var b = document.getElementById("searchByTitle").value;
		var c ="&boardNo=2&board=infoBoard/infoBoardWrite&postnum=2"
		var d =a+b+c;
		
		location.href = d;	
	}
function goes(){
		
		
		var d = document.getElementById("tagNo").value;
		
		var e= "/src_project/front?key=search&methodName=searchByTag&tagNo="
		var f ="&boardNo=2&board=infoBoard/infoBoardWrite&postnum=2"
	
		var g = e+d+f;
		location.href = g;	
	}
	

</script>
</head>
<!--
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,300");

body {
	color: #2c3e50;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}

h1 {
	text-align: center;
	font-size: 2.5rem;
	font-weight: 300;
}

.pagination-container {
	margin: 100px auto;
	text-align: center;
}

.pagination {
	position: relative;
}

.pagination a {
	position: relative;
	display: inline-block;
	color: #2c3e50;
	text-decoration: none;
	font-size: 1.2rem;
	padding: 8px 16px 10px;
}

.pagination a:before {
	z-index: -1;
	position: absolute;
	height: 100%;
	width: 100%;
	content: "";
	top: 0;
	left: 0;
	background-color: #2c3e50;
	border-radius: 24px;
	-webkit-transform: scale(0);
	transform: scale(0);
	transition: all 0.2s;
}

.pagination a:hover, .pagination a .pagination-active {
	color: #fff;
}

.pagination a:hover:before, .pagination a .pagination-active:before {
	-webkit-transform: scale(1);
	transform: scale(1);
}

.pagination .pagination-active {
	color: #fff;
}

.pagination .pagination-active:before {
	-webkit-transform: scale(1);
	transform: scale(1);
}

.pagination-newer {
	margin-right: 50px;
}

.pagination-older {
	margin-left: 50px;
}

img {
	width: 200px;
	height: 350px
}

table td {
	text-align: center;
}
img{width:200px; height:350px}
</style>
-->
<!-- 이 주석은 지워주세요~ -->

<body>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
<caption></caption>
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="16%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
		<col width="7%"/>
	</colgroup>
	<div >
			<form>
				<fieldset>
				   <div align="right"> 
				    <legend>글 검색 필드</legend>  
				   <label>태그로 언어 찾기</label>
                    <select name="tagNo" id="tagNo"class="btn btn-primary" >
							<option value="none">==선택==</option>
							<option value="1">C/C++</option>
							<option value="2">C#</option>
							<option value="3">Python</option>
							<option value="4">Go</option>
							<option value="5">Swift</option>
							<option value="6">Perl</option>
							<option value="7">Java</option>
							<option value="8">Kotlin</option>
							<option value="9">JavaScript</option>
							<option value="10">Vue.js</option>
							<option value="11">React</option>
							<option value="12">node.js</option>
							<option value="13">Typescript</option>
							<option value="14">Ajax</option>
							<option value="15">JQuery</option>
							<option value="16">HTML</option>
							<option value="17">CSS</option>
							<option value="18">spring</option>
							<option value="19">JPA</option>
							<option value="20">Ruby</option>
							<option value="21">Mysql</option>
							<option value="22">ORACLE</option>
							<option value="23">git</option>
							<option value="24">Linux</option>
							<option value="25">Ubuntu</option>
							<option value="26">프론트엔드</option>
							<option value="27">백엔드</option>
							<option value="28">토이프로젝트</option>
							<option value="29">기타</option>
						</select>  
						<input type="button" class="btn btn-primary" value = "찾기" onclick="goes()">
                             
                    <label>검색분류</label>
                        <select name = "search" id=searchs>
                            <option id=title value = "/src_project/front?key=search&methodName=searchByTitle&postTitle=">제목</option>
                            <option id=user value = "/src_project/front?key=search&methodName=searchById&userId=">작성자</option>
                          
                        </select>
                    <label>검색어</label>
                   
                        <input  type = "text" id = "searchByTitle" placeholder="검색어를 입력하세요">
                        <input type="button" class="btn btn-primary" value = "검색" onclick="go()"><br>
                        
                          
                        
                                   																												 <!-- infoBoard/infoBoardWrite -->
                </fieldset>        
			
				<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByLikes&boardNo=2&board=infoBoard/infoBoardWrite&postnum=2'">인기글</button>
		<button class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByRecent&boardNo=2&board=infoBoard/infoBoardWrite&postnum=2'">최근글</button>
			</form>	
		</div>	
		<h2 align="center">지식 정보 공유 게시판</h2>
	<tr>
       
        <td bgcolor="#9DE4FF">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="#9DE4FF">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">제목</span></b></font></p>
        </td>
        <td bgcolor="#9DE4FF">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">추천</span></b></font></p>
        </td>
        
        <td bgcolor="#9DE4FF">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">날짜</span></b></font></p>
    
    </tr>
  
    <c:choose>
    <c:when test="${empty requestScope.postList2}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach var="Post2" items="${postList2}">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        
		        <!-- 번호 -->
		        <td bgcolor="" align="center">
		            <span style="font-size:9pt;">${Post2.postNo}</span>
		        </td>
		        
		        <!-- 제목 -->
		        <td bgcolor="" align="center">
					<a href="${path}/front?key=post&methodName=postViewPost2&postNo=${Post2.postNo}"> 
				  		<span style="font-size:9pt;">${Post2.postTitle}</span>
				  	</a>
		        </td>
		        
		        <!-- 추천수 -->
		        <td bgcolor="" align="center">
					<span style="font-size:9pt;">${Post2.postUp}</span>
		        </td>
		        
		        <!-- 날짜 -->
		        <td bgcolor="" align="center">
		            <span style="font-size:9pt;">${Post2.postDate}</span>
		        </td>
		        
		    </tr>
	    </c:forEach>
		</c:otherwise>
	    </c:choose>
	</table>
	<hr>
	<div align=right>
	<span style="font-size:9pt;">&lt;<a href="${path}/infoBoard/write.jsp">글쓰기</a>&gt;</span>
	</div>
	


	
 </body>
 