<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
<HEAD>

<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous">

  <script src="../ajaxBasic.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script> 
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
    <input type='hidden' name='studyNo' value="${view.studyNo}">
	<table align="center" cellpadding="5" cellspacing="2" width="700" border='1' >
    <tr class="table-primary">
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             게시물 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">스터디 상태</span></b></p>
        </td>
        <td width="200" height="20">
        	<select name="stateNo" id="stateNo">
							<option value="1" selected>모집중</option>
							<option value="2">진행중</option>
							<option value="3">스터디 종료</option>
						</select>
        </td>
        <td scope="table-primary" width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">태그 번호</span></b></p>
        </td>
        <td scope="table-primary" width="200" height="20">
        	<select name="tagNo" id="tagNo">
							<option value="none">스터디 항목을 선택하세요</option>
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
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">작성자 아이디</span></b></p>
        </td>
        <td width="200" height="20">
        	<input type="text" class="form-control" name="userId" value="${view.userId}" id="userId">
        </td>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">모집 정원</span></b></p>
        </td>
        <td width="200" height="20">
        	<input type="text" class="form-control" placeholder="스터디 정원을 입력하세요" name="studyMaxnum" value="${view.studyMaxnum}" id="studyMaxnum">
        </td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">마감일</span></b></p>
        </td>
        <td width="100" height="20">
        	<input type="text" name="studyDuedate" value="${view.studyDuedate}" id="studyDuedate" class="form-control" placeholder="모집마감일자를 입력하세요">
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">요일</span></b></p>
		</td>
        <td width="100" height="20">
        	<select name="dayNo" id="dayNo">
							<option value="none">=== 선택 ===</option>
							<option value="1">요일 무관</option>
							<option value="2">평일</option>
							<option value="3">주말</option>
						</select>
		</td>
    </tr>
    <tr>
        <td width="100" height="20" >
            <p align="right"><b><span style="font-size:9pt;">지역(시)</span></b></p>
        </td>
        <td width="100" height="20">
        	<input type="text" class="form-control" name="studyLocationSi" value="${view.studyLocationSi}" id="studyLocationSi">
        </td>
        <td width="100" height="20" >
			<p align="right"><b><span style="font-size:9pt;">지역(구)</span></b></p>
		</td>
        <td width="100" height="20">
        	<input type="text" class="form-control" name="studyLocationGu" value="${view.studyLocationGu}" id="studyLocationGu">
		</td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<input class="form-control" placeholder="제목을 입력하세요" type="text" name="studyTitle" value="${view.studyTitle}" id="studyTitle">
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <textarea name="studyContent" id="studyContent" cols="50" rows="10" class="form-control">${view.studyContent}</textarea>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
				<input type="submit" class="btn btn-outline-primary" value="수정하기">
				<button type="button" class="btn btn-outline-primary" onclick="cancel();">취소하기</button>
				
		</td>
    </tr>
</table>
</form>
<hr>
<!-- <div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div> -->

</BODY>
</HTML>