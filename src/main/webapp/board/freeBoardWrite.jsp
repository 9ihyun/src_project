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
	<div>
			<form>
				<fieldset>
				   <div align="right"> 
				    <legend >검색 필드</legend>  
				<!--    <label>태그로 언어 찾기</label>
                    <select name="tagNo" id="tagNo" style=" height: 35px;"class="btn btn-primary">
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
						<input type="button" style=" height: 33px;" class="btn btn-primary" value = "찾기" onclick="goes()"> <br>
                             --> 
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
              <!--       <label>검색분류</label>
                        <select name = "search" id=searchs>
                            <option id=title class="btn btn-primary" value = "/src_project/front?key=search&methodName=searchByTitle&postTitle=">제목</option>
                            <option id=user class="btn btn-primary" value = "/src_project/front?key=search&methodName=searchById&userId=">작성자</option>
                          
                        </select>
                    <label>검색어</label>
                   
                        <input type = "text" style=" height: 33px;"class="btn btn-primary"id = "searchByTitle" placeholder="검색어를 입력하세요">
                        <input type="button" style=" height: 33px;" class="btn btn-primary" value = "검색" onclick="go()"class="btn btn-primary"><br>
                        
                          
                      
                                    
                </fieldset>        
			
				<button type="button" style=" height: 35px;"class="btn btn-primary"onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByLikes&boardNo=1&board=board/freeBoardWrite&postnum='">인기글</button>
		<button type="button" style=" height: 35px;"class="btn btn-primary"onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByRecent&boardNo=1&board=board/freeBoardWrite&postnum='">최근글</button>
			   --></form>	
		</div>	
		
		<h2 align="center">자유게시판</h2>
	<tr>
	
       
        <td bgcolor="#3C9DAB">
            <p align="center"><font color="black"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="#3C9DAB">
            <p align="center"><font color="black"><b><span style="font-size:9pt;">제목</span></b></font></p>
        </td>
        <td bgcolor="#3C9DAB">
            <p align="center"><font color="black"><b><span style="font-size:9pt;">추천</span></b></font></p>
        </td>
        
        <td bgcolor="#3C9DAB">
            <p align="center"><font color="black"><b><span style="font-size:9pt;">날짜</span></b></font></p>
    
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
		            <span style="font-size:9pt;">${Post.postNo}</span>
		        </td>
		        
		        <!-- 제목 -->
		        <td bgcolor="" align="center">
					<a href="${path}/front?key=post&methodName=postViewPost&postNo=${Post.postNo}"> 
				  		<span style="font-size:9pt;">${Post.postTitle}</span>
				  	</a>
		        </td>
		        
		        <!-- 추천수 -->
		        <td bgcolor="" align="center">
					<span style="font-size:9pt;">${Post.postUp}</span>
		        </td>
		        
		        <!-- 날짜 -->
		        <td bgcolor="" align="center">
		            <span style="font-size:9pt;">${Post.postDate}</span>
		        </td>
		        
		    </tr>
	    </c:forEach>
		</c:otherwise>
	    </c:choose>
	</table>
	<hr>
	<div align=right>
	<span style="font-size:9pt;">&lt;<a href="${path}/board/WriteInfo.jsp">글쓰기</a>&gt;</span>
	</div>
	


	<!--
	
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
 -->