
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- link rel="stylesheet" href="${path}/css/style.css"-->

 <meta name="viewport" content="width=device-width, initial-scale=1" />
 

<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<script src="${path }/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function go(){	
		var a = document.getElementById("searchs").value;
		var b = document.getElementById("searchByStudy").value;
		var c = a+b;
		location.href = c;	
	}
function goes(){
		
		
		var d = document.getElementById("tagNo").value;
		console.log(d);
		var e= "/src_project/front?key=search&methodName=searchByTags&tagName="
		
	
		var g = e+d;
		location.href = g;	
	}
	
	

</script>
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:400,300");
*{font-family: 'Nanum Gothic', sans-serif;}

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
<table class="table">
	<colgroup>
		<col width="15%"/>
		<col width="30%"/>
		<col width="7%"/>
		<col width="16%"/>
		<col width="7%"/>
		<col width="7%"/>
		<col width="16%"/>
	</colgroup>
	<tr>
		<td colspan="7" align="right" valign="bottom">
		   <div align="right"> 
                  <label><h7>???????????? ????????? ????????????</h7></label>
                  <select name="tagNo" id="tagNo">
					<option value="none">==??????==</option>
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
					<option value="26">???????????????</option>
					<option value="27">?????????</option>
					<option value="28">??????????????????</option>
					<option value="29">??????</option>
				</select>  
				<button type="button" value = "??????" class="btn btn-primary btn-sm" onclick="goes()">??????</button>
			</div>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<div align="left">
			<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByState&stateName=1'">?????????</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByState&stateName=2'">??????????????????</button>
			<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/front?key=search&methodName=searchByState&stateName=3'">???????????????</button>
			</div>
		</th>
		<th colspan="5">
			<div align="right">
				<select name = "search" id=searchs>
                    <option id=title class="btn btn-outline-dark" value = "/src_project/front?key=search&methodName=selectTitleStudy&studyTitle=">??????</option>
                </select>
				<input type = "text" id = "searchByStudy" placeholder="???????????? ???????????????">
           		 <button type="button" value = "??????" class="btn btn-primary btn-sm" onclick="go()">??????</button>
			</div>
		</th>
	</tr>
	 <tr class="table-primary">
       <td valign="middle">
            <p align="center">
            <font color="black"><h6>????????????</h6></font></p>
        </td>
        <td  valign="middle">
            <p align="center"><font color="black"><h6>??????</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>??????</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>???????????????</h6></font></p>
        </td>
        
        <td valign="middle">
            <p align="center"><font color="black"><h6>?????????</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>???</h6></font></p>
        </td>
        <td valign="middle">
            <p align="center"><font color="black"><h6>??????</h6></font></p>
        </td>
    </tr>

  
    <c:choose>
    <c:when test="${empty requestScope.studyList}">
	   <tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">????????? ???????????? ????????????.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.studyList}" var="study">
		    <tr onmouseover="this.style.background='#eaeaea'"
		        onmouseout="this.style.background='white'">
		        <td bgcolor=""  valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${study.stateName}</span></p>
		        </td>
		        <td bgcolor=""  valign="middle">
					<p><span style="font-size:11pt;">
					<a href="${path}/front?key=study&methodName=viewStudy&studyNo=${study.studyNo}">
					  ${study.studyTitle}
					</a>
					</span></p>
		        </td>
		        
		        <td bgcolor=""  valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${study.studyMaxnum}"</span></p>
		        </td>
		        <td  valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${study.studyDuedate}</span></p>
		        </td>
		         
		         <td valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${study.userId}</span></p>
		        </td>
		         <td valign="middle">
		            <p align="center">
		            <form action="${path}/front" method="post">
						<input type=hidden name="studyNo" value="${study.studyNo}">
						<button type="submit" class="btn btn-primary btn-sm">???</button>
						<!--input type="submit"  value=?????????-->
						<input type=hidden name="key" value="myStudy"> 
						<input type=hidden name="methodName" value="putWishStudy">			
					</form>	
					</p>
		        </td>
		        <td valign="middle">
		            <p align="center"><span style="font-size:11pt;">
		            ${study.studyLocationSi} ${study.studyLocationGu}</span></p>
		        </td>
		        
		      
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
<hr>
<div align=right>
<button type="submit" class="btn btn-outline-primary" onClick="location.href='${path}/study/write2.jsp'">?????????</button>
</div>
<jsp:useBean class="kosta.mvc.paging.PageCnt" id="p"/> 
  <p>
 <!--  ?????????  -->
 <nav class="pagination-container">
		<div class="pagination">
		<c:set var="doneLoop" value="false"/>
		
		<c:set var="temp" value="${(pageNo-1) % p.blockcount}"/> <!-- (1-1)%2  =0  , (2-1)%2    1 , (3-1)%2  0 -->
		<c:set var="startPage" value="${pageNo - temp}"/> <!--   1- 1 -->
		
	<br>
	
		  <!-- 
     if( ( ??????????????? - ?????????????????????[]??????) > 0 ){ // if()
	       [??????]????????????.	
     } 
     ex) if( ( startPage -blockcount) > 0 ){

          }
		-->
		
		<!-- 
		 ??????????????? ?????????(???????????? ??????????????? ?????? [??????] )
           ?????? => int temp=(?????????????????????-1)% ???????????? ?????????[]??????;
                   int startPage=????????????????????? -temp; => ????????????[]
             
             
					   int temp = (pageNo-1) % p.blockcount ;         //?????? ????????? ?????????
				      int startPage = pageNo - temp;
		 -->
		
		  <c:if test="${(startPage-p.blockcount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${path}/front?key=study&methodName=selectAllStudy&pageNo=${startPage-1}">PREV</a>
		  </c:if>
		  
		  
		
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+p.blockcount}'> 
			  <c:if test="${(i-1)>=p.pageCnt}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
			  <c:if test="${not doneLoop}" >
			         <a class="${i==pageNo?'pagination-active':page}" href="${path}/front?key=study&methodName=selectAllStudy&pageNo=${i}">${i}</a> 
			  </c:if>
		  
		</c:forEach>
		</span>
		 <c:if test="${(startPage+p.blockcount)<=p.pageCnt}">
		     <a class="pagination-older" href="${path}/front?key=study&methodName=selectAllStudy&pageNo=${startPage+p.blockcount}">NEXT</a>
		 </c:if>
		</div>
	</nav> 

 
 































