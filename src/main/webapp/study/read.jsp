<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="../js/jquery-3.6.0.js"></script> 

<script type="text/javascript">
	$(function(){
		//댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문)
	    $("#btnReply").click(function(){
	        var replytext=$("#replytext").val(); //댓글 내용
	        var studyNo="${study.studyNo}"; //게시물 번호
	        var param={ "replytext": replytext, "studyNo": studyNo};
	        //var param="replytext="+replytext+"&bno="+bno;
	        $.ajax({
	            type: "post", //데이터를 보낼 방식
	            url: "${path}/front?key=studyReply&methodName=insertReply", //데이터를 보낼 url
	            data: param, //보낼 데이터

	            success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
	                alert("댓글이 등록되었습니다.");
	                listReply2(); //댓글 목록 출력
	            }
	        });//ajax 끝
	    });//댓글 등록 끝

	});//ready 끝
	
	//댓글 목록 출력 함수
	function listReply(){
	    $.ajax({
	        type: "get", //get방식으로 자료를 전달한다
	        url: "${path}/front?key=studyReply&methodName=selectAllReply&studyNo=${study.studyNo}", //컨트롤러로 보내기.. 게시판 번호도 같이 보낸다.
	        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
	            //result : responseText 응답텍스트(html)
	            $("#listReply").html(result);
	        }
	    });
	}

</script>


</HEAD>

<body>
<form>
<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' >
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             게시물 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집여부</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.stateName}</b></span>
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">스터디 항목</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.tagName}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">작성자 아이디</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.userId}</b></span>
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집 정원</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${study.studyMaxnum}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${study.studyDuedate}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">스터디 요일</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${study.dayName}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">지역(시)</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${study.studyLocationSi}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">지역(구)</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${study.studyLocationGu}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${study.studyTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${study.studyContent}</pre></b></span></td>
    </tr>
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<a href="${path}/front?key=study&methodName=selectAllStudy" >목록으로 돌아가기</a> &nbsp;&nbsp;&nbsp;
			 <c:if test="${sessionScope.user.userId != null}">
        	<c:if test="${sessionScope.user.userId == study.userId}">
			<a href="${path}/front?key=study&methodName=updateStudyView&studyNo=${study.studyNo}" >수정</a>
			<a href="${path}/front?key=study&methodName=deleteStudy&studyNo=${study.studyNo}" >삭제</a>
			</c:if>
			</c:if>
			
		</td>
    </tr>
</table>
</form>
<form action="${path}/front" method="post">
	<input type=hidden name="studyNo" value="${study.studyNo}">
		<input type="submit"  value=찜하기>
		<input type=hidden name="key" value="myStudy"> 
		<input type=hidden name="methodName" value="putWishStudy">			
</form>	
<form action="${path}/front" method="post">
	<input type=hidden name="studyNo" value="${study.studyNo}">
		<input type="submit"  value=신청하기>
		<input type=hidden name="key" value="myStudy"> 
		<input type=hidden name="methodName" value="putSignStudy">			
</form>	
<hr>
<h3>Replies 정보</h3>

<div>  
<c:choose>
	<c:when test = "${empty requestScope.StudyReply}">
		<h5>댓글정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${StudyReply}" var = "reply">
			${reply.userId} | ${reply.sReplyDate}<p>
			${reply.sReplyContent}<p>
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<input type=hidden name="sReplyNo" value="${reply.sReplyNo}">

					<input type="submit"  value=삭제>
					<input type=hidden name="key" value="studyReply"> 
					<input type=hidden name="methodName" value="deleteReply">			
			</form>		
			<hr>
		</c:forEach>
	</c:otherwise>
</c:choose>
<div>  
	<p class="star_rating" >
    <a href="#" class="">★</a> <!-- on 을 해두면 색이 노란색으로 나옴 -->
    <a href="#" class="">★</a>
    
    <a href="#" class="">★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>
	</div>

<!-- 댓글 작성 -->
<!-- 너비와 정렬방식 설정 -->
<div style="width:700px; text-align:center;">
 
<!-- 세션에 저장되어있는 userid가 null이 아닐때 -->
<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->
     <c:if test="${sessionScope.userid != null }">
     
     
         <textarea rows="5" cols="80" id="replytext"
             placeholder="댓글을 작성하세요"></textarea>
         <br>
         <!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
         <!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
         <!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
         <button type="button" id="btnReply">댓글쓰기</button>
       </c:if>
</div>
	
<!-- 댓글 목록 -->
<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->
<div id="listReply"></div>
</div>
<form action="${path}/front" method="post">
	<input type=hidden name="studyNo" value="${study.studyNo}">
	${sessionScope.user.userId}<p>

	<input type="text" name="sReplyContent" value="댓글을 입력해주세요">
	<input type="hidden" name="userId" value="${sessionScope.userId }">
		<input type="submit"  value=등록>
		<input type=hidden name="key" value="studyReply"> 
		<input type=hidden name="methodName" value="insertReply">		

</form>
<hr>
 <c:if test="${sessionScope.user.userId != null}">
 <c:if test="${sessionScope.user.userId == study.userId}">
<h2>스터디 신청자 목록</h2>
<c:choose>
	<c:when test = "${empty wishStudy.userId}">
		<h5>신청자가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${wishStudy.userId}" var = "wishUser">
			${wishUser.nickname} | ${wishUser.starPoint}<p>
		</c:forEach>
	</c:otherwise>
</c:choose>
</c:if>
</c:if>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/study/list.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>






