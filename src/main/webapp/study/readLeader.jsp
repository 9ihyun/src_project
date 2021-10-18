<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="css/style.css">

<SCRIPT language=javascript>
function sendUpdate(){
	document.requestForm.methodName.value ="updateForm";
	document.requestForm.submit();
}



function sendDelete(){
	if(document.requestForm.password.value==""){
		alert("비밀번호 입력하세요.");
		document.requestForm.password.focus();
		return;
	}
	
	document.requestForm.methodName.value ="delete";
	document.requestForm.submit();
}
</script>


</HEAD>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
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
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${Study.stateNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="300" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.Study.studyDuedate}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">조회수</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.Study.studyRegdate}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.Study.studyTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.Study.studyContent}</pre></b></span></td>
    </tr>
    
    
    <tr>
    <td width="100" height="20">
           <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        
    <form name="requestForm" method="post" action="${path}/front">
        <td height="20" colspan="3" align="left" valign="middle">
				<input type=password name="password" value="">		
		</td>
    </tr>
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				<input type=hidden name="studyNo" value="${Study.studyNo}">
				<input type=hidden name="key" value="Study">
				<input type=hidden name="methodName" >
				
				<input type=button value="수정하기" onClick="sendUpdate()">
				<input type=button value="삭제하기" onClick="sendDelete()">
    </form>
			
		</td>
    </tr>
</table>
<hr>
<h3>Replies 정보</h3>
<c:choose>
	<c:when test = "${empty StudyReply.sReplyNo}">
		<h5>댓글정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${StudyReply.sReplyNo}" var = "reply">
			${StudyReply.sReplyNo} / ${StudyReply.sReplyContent} /${StudyReply.sReplyDate} /${StudyReply.studyNo}<p>
		</c:forEach>
	</c:otherwise>
</c:choose>
<hr>
<h2>스터디 신청자 목록</h2>
<c:choose>
	<c:when test = "${empty WishStudy.userId}">
		<h5>신청자가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${WishStudy.userId}" var = "wishUser">
			${User.nickname} / ${User.starPoint}<p>
		</c:forEach>
	</c:otherwise>
</c:choose>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div>






