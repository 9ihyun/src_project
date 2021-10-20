<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>


<HTML>
<HEAD>
<link rel="stylesheet" href="css/style.css">
<script src="../js/jquery-3.6.0.js"></script>
<SCRIPT >
function cancel(){ 
	location.href = "${path}/front?key=study&methodName=viewStudy&studyNo=${study.studyNo}";	 
}

function checkValid(f) {
	if ( f.stateNo.value == "" ) {
		alert( "모집여부를 입력해 주세요." );
		f.stateNo.focus();
		return false;
	}
	if ( f.tagNo.value == "" ) {
		alert( "테그번호를 입력해 주세요." );
		f.tagNo.focus();
		return false;
	}
	if ( f.userId.value == "" ) {
        alert( "아이디를 입력해 주세요." );
        f.userId.focus();
        return false;
    }
	if ( f.studyMaxnum.value == "" ) {
        alert( "모집정원을 입력해 주세요." );
        f.studyMaxnum.focus();
        return false;
    }
	if ( f.studyDuedate.value == "" ) {
        alert( "마감일을 입력해 주세요." );
        f.studyDuedate.focus();
        return false;
    }
	if ( f.studyRegdate.value == "" ) {
        alert( "요일을 입력해 주세요." );
        f.studyRegdate.focus();
        return false;
    }
	if ( f.studyLocationSi.value == "" ) {
        alert( "지역(시)을 입력해 주세요." );
        f.studyLocationSi.focus();
        return false;
    }
	if ( f.studyLocationGu.value == "" ) {
        alert( "지역(구)을 입력해 주세요." );
        f.studyLocationGu.focus();
        return false;
    }
	if ( f.studyTitle.value == "" ) {
        alert( "제목을 입력해 주세요." );
        f.studyTitle.focus();
        return false;
    }
	if ( f.studyContent.value == "" ) {
        alert( "설명을 입력해 주세요." );
        f.studyContent.focus();
        return false;
    }
	
	if(confirm("수정하시겠습니까?") == true){
		return true;
	}else{
		return false;
	}
	
	
    
}

</SCRIPT>

</HEAD>

<BODY>


<form name="updateForm" method="post" action="${path}/front" onSubmit="return checkValid(this);">
    <input type="hidden" name="key" value="study" >
    <input type="hidden" name="methodName" value="updateStudy" >
    <input type='hidden' name='studyNo' value="${study.studyNo}">
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
        	<input type="text" name="stateNo" value="${study.stateNo}" id="stateNo">
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">태그 번호</span></b></p>
        </td>
        <td width="200" height="20">
        	<input type="text" name="tagNo" value="${study.tagNo}" id="tagNo">
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">작성자 아이디</span></b></p>
        </td>
        <td width="200" height="20">
        	<input type="text" name="userId" value="${study.userId}" id="userId">
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집 정원</span></b></p>
        </td>
        <td width="200" height="20">
        	<input type="text" name="studyMaxnum" value="${study.studyMaxnum}" id="studyMaxnum">
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="100" height="20">
        	<input type="text" name="studyDuedate" value="${study.studyDuedate}" id="studyDuedate">
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">요일</span></b></p>
		</td>
        <td width="100" height="20">
        	<input type="text" name="studyRegdate" value="${study.studyRegdate}" id="studyRegdate">
		</td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">지역(시)</span></b></p>
        </td>
        <td width="100" height="20">
        	<input type="text" name="studyLocationSi" value="${study.studyLocationSi}" id="studyLocationSi">
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">지역(구)</span></b></p>
		</td>
        <td width="100" height="20">
        	<input type="text" name="studyLocationGu" value="${study.studyLocationGu}" id="studyLocationGu">
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<input type="text" name="studyTitle" value="${study.studyTitle}" id="studyTitle">
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <textarea name="studyContent" id="studyContent" cols="50" rows="10">${study.studyContent}</textarea>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
				<input type="submit" value="수정하기">
				<button type="button" onclick="cancel();">취소하기</button>	
		</td>
    </tr>
</table>
</form>
<hr>
<!-- <div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div> -->

</BODY>
</HTML>