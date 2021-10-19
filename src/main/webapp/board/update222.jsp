<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>


<HTML>
<HEAD>
<link rel="stylesheet" href="css/style.css">

<SCRIPT >
function checkValid() {
	var f = window.document.updateStudy;
	if ( f.studyTitle.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.studyTitle.focus();
		return false;
	}

	if ( f.studyMaxnum.value == "" ) {
        alert( "설명을 입력해 주세요." );
        f.studyMaxnum.focus();
        return false;
    }
	
    
}

</SCRIPT>

</HEAD>

<BODY>


<form name=updateForm method=post action="${path}/front" onSubmit="return checkValid()">
    <input type="hidden" name="key" value="PostController" >
    <input type="hidden" name="methodName" value="postUpdate" >
    <input type='hidden' name='modelNum' value="${Post.postNo}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>  게시물 수정하기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="studyTitle" size="30"
		 value="${Post.postTitle}"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">내용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="description" cols="50" rows="10">${Post.postContent}</textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;"><input type=password name="password" size="12"> 
            (비밀번호가 맞아야 수정이 가능합니다.)</span></b></td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		<input type="submit" value="수정하기"> <input type="reset" value="다시쓰기"></span></b></td>
    </tr>
</table>
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/front?key=post&methodName=postSelectAllPost" name="board">리스트로 돌아가기</a>&gt;</span></div>