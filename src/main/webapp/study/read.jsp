<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="css/style.css">

<SCRIPT language=javascript>


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
        	<span style="font-size:9pt;"><b>${study.stateNo}</b></span>
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">태그 번호</span></b></p>
        </td>
        <td width="200" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.tagNo}</b></span>
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
        	<span style="font-size:9pt;"><b>${requestScope.study.studyMaxnum}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyDuedate}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">요일</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.study.studyRegdate}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">지역(시)</span></b></p>
        </td>
        <td width="100" height="20">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyLocationSi}</b></span>
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">지역(구)</span></b></p>
		</td>
        <td width="100" height="20">
			<p><b><span style="font-size:9pt;"></span>${requestScope.study.studyLocationGu}</b></p>
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.study.studyTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.study.studyContent}</pre></b></span></td>
    </tr>
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<a href="${path}/front?key=study&methodName=selectAllStudy" >목록으로 돌아가기</a> &nbsp;&nbsp;&nbsp;
			<a href="${path}/front?key=study&methodName=updateStudy&studyNo=${view.studyNo}" >수정</a>
		</td>
    </tr>
</table>
</form>
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
<div>  
	<p class="star_rating" >
    <a href="#" class="">★</a> <!-- on 을 해두면 색이 노란색으로 나옴 -->
    <a href="#" class="">★</a>
    
    <a href="#" class="">★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>
	<input type="text"  value="댓글을 입력해주세요">
	</div>
	<div align="right">
	<input type="submit"  value=등록>
	</div>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div>
</body>






