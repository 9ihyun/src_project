<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">

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
	
	
	
	
<table align="center" cellpadding="5" cellspacing="2" width="700" border='1' >
    <tr class="table-primary">
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             게시물 자세히보기</b></font></p>
        </td>
    </tr>
    <tr>
        
        
       
        
        
   
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<input class="form-control" placeholder="제목을 입력하세요" type="text" name="postTitle" value="${view.postTitle}" id="postTitle">
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;">설명</span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <textarea name="postContent" id="postContent" cols="50" rows="10" class="form-control">${view.postContent}</textarea>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
				<input type="submit" class="btn btn-outline-primary" value="수정하기">
				<button type="button" class="btn btn-outline-primary" onclick="deletes();">삭제하기</button>
				
		</td>
    </tr>
</table>
<input type = hidden name = "userId" value = "${sessionScope.user.userId}">
<input type = hidden name = "tagNo" value = "29">
<input type = hidden name = "boardNo" value = "1">
</form>

<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front?key=post&methodName=postSelectAllPost">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>
