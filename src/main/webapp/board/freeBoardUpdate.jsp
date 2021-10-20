<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<style>


</style>

<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">

/**function cancel(){ //취소하기 눌렀을때
	location.href = "${path}/front?key=post&methodName=postViewPost&postNo=${view.postNo}";	 
}**/
function deletes(){ 
	
	location.href = "${path}/front?key=post&methodName=postDelete&postNo=${view.postNo}";
	
}//src_project/front?key=post&methodName=postDelete&postNo=35
function checkValid(frm){
	
	if(frm.tagNo.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		alert("태그번호를 선택해주세요.");
		frm.tagNo.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		return false;
	}
	
	if(frm.boardNo.value == ""){
		alert("작성자를 입력해주세요.");
		frm.boardNo.focus();
		return false;
	}
	
	if(frm.postContent.value == ""){
		alert("내용을 입력해주세요.");
		frm.postContent.focus();
		return false;
	}
	
	/*
	if(frm.password.value == ""){
		alert("패스워드를 입력해주세요.");
		frm.password.focus();
		return false;
	}
	*/
	
	
	if(confirm("수정하시겠습니까?") == true){
		return true;
	}else{
		return false;
	}
}

</script>

</head>
<body>

<form action="${path}/front" method="post" onsubmit="return checkValid(this);">
  	<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
	<input type="hidden" name="key" value="post">
	<input type="hidden" name="methodName" value="postUpdate">
	<input type="hidden" name="postNo" value="${view.postNo}">
<!-- 
     ${path}/front?key=StudyDAOImpl&methodName=insertStudy
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
-->
	<!-- 삭제시 -->
	
	
	
	
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 게시글 수정 </b></font></p>
        </td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">태그 번호 </span></b></p>
        </td>
         <td width="450" height="20">
        	<select name="tagNo" id="tagNo">
				<option value="none">태그번호 선택</option>
				<option value="1"${view.tagNo eq 1 ? ' selected':''}>C/C++</option>
				<option value="2"${view.tagNo eq 2 ? ' selected':''}>C#</option>
				<option value="3"${view.tagNo eq 3 ? ' selected':''}>Python</option>
				<option value="4"${view.tagNo eq 4 ? ' selected':''}>Go</option>
				<option value="5"${view.tagNo eq 5 ? ' selected':''}>Swift</option>
				<option value="6"${view.tagNo eq 6 ? ' selected':''}>Perl</option>
				<option value="7"${view.tagNo eq 7 ? ' selected':''}>Java</option>
				<option value="8"${view.tagNo eq 8 ? ' selected':''}>Kotlin</option>
				<option value="9"${view.tagNo eq 9 ? ' selected':''}>JavaScript</option>
				<option value="10"${view.tagNo eq 10 ? ' selected':''}>Vue.js</option>
				<option value="11"${view.tagNo eq 11 ? ' selected':''}>React</option>
				<option value="12"${view.tagNo eq 12 ? ' selected':''}>node.js</option>
				<option value="13"${view.tagNo eq 13 ? ' selected':''}>Typescript</option>
				<option value="14"${view.tagNo eq 14 ? ' selected':''}>Ajax</option>
				<option value="15"${view.tagNo eq 15 ? ' selected':''}>JQuery</option>
				<option value="16"${view.tagNo eq 16 ? ' selected':''}>HTML</option>
				<option value="17"${view.tagNo eq 17 ? ' selected':''}>CSS</option>
				<option value="18"${view.tagNo eq 18 ? ' selected':''}>spring</option>
				<option value="19"${view.tagNo eq 19 ? ' selected':''}>JPA</option>
				<option value="20"${view.tagNo eq 20 ? ' selected':''}>Ruby</option>
				<option value="21"${view.tagNo eq 21 ? ' selected':''}>Mysql</option>
				<option value="22"${view.tagNo eq 22 ? ' selected':''}>ORACLE</option>
				<option value="23"${view.tagNo eq 23 ? ' selected':''}>git</option>
				<option value="24"${view.tagNo eq 24 ? ' selected':''}>Linux</option>
				<option value="25"${view.tagNo eq 25 ? ' selected':''}>Ubuntu</option>
				<option value="26"${view.tagNo eq 26 ? ' selected':''}>프론트엔드</option>
				<option value="27"${view.tagNo eq 27 ? ' selected':''}>백엔드</option>
				<option value="28"${view.tagNo eq 28 ? ' selected':''}>토이프로젝트</option>
				<option value="29"${view.tagNo eq 29 ? ' selected':''}>기타</option>
			</select>
        </td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">보드 번호 </span></b></p>
        </td>
         <td width="450" height="20">
        	<select name="boardNo" id="boardNo">
				<option value="1">1.자유게시판</option>
			</select>
        </td>
    </tr>
    
     <%-- <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">작성자</span></b></p>
        </td>
         <td width="450" height="20">
        	<input type="text" name="userId" id="userId" value="${view.userId}" size="12">
        </td>
    <tr> --%>
    
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20">
        	<input type="text" name="postTitle" value="${view.postTitle}" id="postTitle" size="12">
        </td>
      </tr> 
      
      <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;"> 내용</span></b></p>
        </td>
        <td width="450" height="20">
			<textarea name="postContent" id="postContent" cols="50" rows="10">${view.postContent}</textarea>
		</td>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
	        <input type=submit value="수정하기">
	        <input type="button" onclick="deletes();" value="삭제하기">
        </td>
    </tr>
</table>

</form>

<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front?key=post&methodName=postSelectAllPost">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>
