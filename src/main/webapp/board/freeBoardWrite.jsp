<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function go(){
		var a = document.getElementById("searchs").value;
		var b = document.getElementById("searchByTitle").value;
		var c ="&boardNo=1&board=board/freeBoardWrite&postnum="
		var d =a+b+c;
		
		location.href = d;	
	}
function goes(){
		
		
		var d = document.getElementById("tagNo").value;
		
		var e= "/src_project/front?key=search&methodName=searchByTag&tagNo="
		var f ="&boardNo=1&board=board/freeBoardWrite&postnum="
	
		var g = e+d+f;
		location.href = g;	
	}
	

</script>
<style>
	table td {
	text-align: center;
}
</style>





<table class="table">
<caption>
	<colgroup>
		<col width="15%"/>
		<col width="40%"/>
		<col width="10%"/>
		<col width="25%"/>
	</colgroup>
    <tr>
		<td colspan="2">
			<div align="left">
				<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByLikes&boardNo=1&board=board/freeBoardWrite&postnum='">인기글</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByRecent&boardNo=1&board=board/freeBoardWrite&postnum='">최근글</button>
			</div>
		</td>
		<td colspan="5">
			<div align="right">
				<select name = "search" id=searchs>
                    <option id="title" class="btn btn-outline-dark" value = "/src_project/front?key=search&methodName=searchByTitle&postTitle=">제목</option>
                	<option id="user" class="btn btn-outline-dark" value = "/src_project/front?key=search&methodName=searchById&userId=">작성자</option>
                </select>
				<input type = "text" id = "searchByTitle" placeholder="검색어를 입력하세요">
           		 <button type="button" value = "검색" class="btn btn-primary btn-sm" onclick="go()">검색</button>
			</div>
		</td>
	</tr>
	<tr class="table-primary">
        <td valign="middle">
            <p align="center"><font color="black"><h6>글번호</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>제목</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>추천수</h6></font></p>
        </td>
        
        <td valign="middle">
            <p align="center"><font color="black"><h6>등록날짜</h6></font></p>
    
    </tr>
  
    <c:choose>
    <c:when test="${empty requestScope.postList}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">등록된 게시글이 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach var="Post" items="${postList}">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        
		        <!-- 번호 -->
		        <td bgcolor="" align="center">
		            <span style="font-size:11pt;">${Post.postNo}</span>
		        </td>
		        
		        <!-- 제목 -->
		        <td bgcolor="" align="center">
					<a href="${path}/front?key=post&methodName=postViewPost&postNo=${Post.postNo}"> 
				  		<span style="font-size:11pt;">${Post.postTitle}</span>
				  	</a>
		        </td>
		        
		        <!-- 추천수 -->
		        <td bgcolor="" align="center">
					<span style="font-size:11pt;">${Post.postUp}</span>
		        </td>
		        
		        <!-- 날짜 -->
		        <td bgcolor="" align="center">
		            <span style="font-size:11pt;">${Post.postDate}</span>
		        </td>
		        
		    </tr>
	    </c:forEach>
		</c:otherwise>
	    </c:choose>
	</table>
	<hr>
	<div align=right>
	<button type="submit" class="btn btn-outline-primary" onClick="location.href='${path}/board/WriteInfo.jsp'">글쓰기</button>
	
	</div>
	
	   <jsp:useBean class="kosta.mvc.paging.PageCnt" id="p"/> 
	    
	  
	
	 
	
	 <nav class="pagination-container">
			<div class="pagination">
			<c:set var="doneLoop" value="false"/>
			
			<c:set var="temp" value="${(pageNo-1) % p.blockcount}"/> 
			<c:set var="startPage" value="${pageNo - temp}"/>
			
	<br>
	
		
		  <c:if test="${(startPage-p.blockcount) > 0}"> 
		      <a class="pagination-newer" href="${path}/front?key=post&methodName=selectAllPost&pageNo=${startPage-1}">PREV</a>
		  </c:if>
		  													
		  
		
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+p.blockcount}'> 
			  <c:if test="${(i-1)>=p.pageCnt}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
			  <c:if test="${not doneLoop}" >
			         <a class="${i==pageNo?'pagination-active':page}" href="${path}/front?key=post&methodName=selectAllPost&pageNo=${i}">${i}</a> 
			  </c:if>
		  
		</c:forEach>
		</span> 
				
				 <c:if test="${(startPage+p.blockcount)<=p.pageCnt}">
				     <a class="pagination-older" href="${path}/front?key=post&methodName=selectAllPost&pageNo=${startPage+p.blockcount}">NEXT</a>
				 </c:if>
		</div>
		
	</nav> 
