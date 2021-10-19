<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/style.css">


<script src="../js/jquery-3.6.0.js"></script>

<SCRIPT language=javascript>
function checkValid() {
    var f = window.document.insertStudy;
		
	if ( f.stateNo.value == "") {
	    alert( "모집여부를 입력해 주세요." );
	    f.stateNo.focus();
		return false;
    }
	if ( f.studyTitle.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.studyTitle.focus();
		return false;
	}
	if ( f.studyMaxnum.value == "" ) {
		alert( "정원을 입력해 주세요." );
		f.studyMaxnum.focus();
		return false;
	}
	if ( f.studyContent.value == "" ) {
        alert( "설명을 입력해 주세요." );
        f.studyContent.focus();
        return false;
    }
	if ( f.password.value == "" ) {
        alert( "비밀번호를 입력해 주세요" );
        f.password.focus();
        return false;
    }
	
	if(confirm("등록하시겠습니까?") == true){
		return true;
	}
}
</SCRIPT>


</HEAD>
<BODY>

<form action="${path}/front" >
<!-- 
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
     
	<input type="hidden" name="key" value = "elec" />
	<input type="hidden" name="methodName" value = "insert" />  

 -->
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 게시글 등록 </b></font></p>
        </td>
    </tr>
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">태그 번호</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="tagNo" id="tagNo" size="12">
        	   </span></b>
        </td>
    </tr>
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">아이디 </span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="userId" id="userId" size="12">
        	   </span></b>
        </td>
    </tr> 
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">상태 번호</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="stateNo" id="stateNo" size="12">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">요일 번호</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="dayNo" id="dayNo" size="12">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">정원</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="studyMaxnum" id="studyMaxnum" size="12">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">시 </span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="studyLocationSi" id="studyLocationSi" size="12">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">구</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="studyLocationGu" id="studyLocationGu" size="12">
        	   </span></b>
        </td>
    </tr>
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">마감일자 </span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="studyDuedate" id="studyDuedate" size="12">
        	   </span></b>
        </td>
  
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="studyTitle" id="studyTitle" size="12">
        	   </span></b>
        </td>
    </tr> 
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;"> 내용</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="studyContent" id="studyContent" cols="50" rows="10"></textarea></span></b></td>
    </tr>

    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <input type=submit value=등록하기>
        <button type="button" onclick="cancel();">취소하기</button>
    </tr>
</table>
 	  <input type = hidden name = "key" value = "study">
      <input type = hidden name = "methodName" value = "insertStudy">
</form>



<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/list">리스트로 돌아가기</a>&gt;</span></div>


