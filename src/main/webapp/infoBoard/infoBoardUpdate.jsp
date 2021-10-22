
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<!-- 이 주석은 지워주세요~ -->
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<style>


</style>

<script src="../js/jquery-3.6.0.js"></script>

<script type="text/javascript">

function deletes(){ 
	console.log(${view2.postNo});
	location.href = "/src_project/front?key=post&methodName=postDelete2&postNo=${view2.postNo}";
	
}

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
		//var id1="${view2.userId}";
		//var id2="${sessionScope.user.userId}";
		
	//	else if(id1==id2){
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
	<input type="hidden" name="methodName" value="postUpdate2">
	<input type="hidden" name="postNo" value="${view2.postNo}">
<!-- 
     ${path}/front?key=StudyDAOImpl&methodName=insertStudy
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
-->
	<!-- 삭제시 -->
	
<table class="table" align="center" cellpadding="10" cellspacing="2" width="90%" >
    <thead>
	    <tr class="table-default">
	      <td colspan="4">
	      	<h4 align="left" >게시글 상세보기</h4>
	      </td>
	    </tr>
    </thead>
   <tbody>
    <tr>
    	<td colspan="4">
      	<h4></h4>
      </td>
    </tr>
    <tr>
        <td width="30%" height="50" valign="middle">
				<b><h5 align="center" style="bold">제목</h5></b>
		</td>
        <td width="450" height="20" colspan="3">
        	<input class="form-control" placeholder="제목을 입력하세요" type="text" name="postTitle" value="${view2.postTitle}" id="postTitle">
        </td>
    </tr>
    <tr>
        <td width="30%" height="50" valign="middle">
				<b><h6 align="center">프로그래밍 언어</h6></b>
		</td>
        <td scope="table-primary" width="200" height="20">
        	<select name="tagNo" id="tagNo">
				<option value="none">언어를 선택하세요</option>
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
		<td width="150" height="80" valign="middle">
				<h6 align="center">작성자</h6>
		</td>
		<td valign="middle"><h6>${view2.userId}</h6></td>
	</tr>
    <tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">내용</h6>
		</td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <textarea name="postContent" id="postContent" cols="50" rows="10" class="form-control">${view2.postContent}</textarea>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
				<input type="submit" class="btn btn-outline-primary" value="수정하기">
				<button type="button" class="btn btn-outline-primary" onclick="deletes();">삭제하기</button>
				
		</td>
    </tr>
</table>
	
	

<input type = hidden name = "userId" value = "${sessionScope.user.userId}">

<input type = hidden name = "boardNo" value = "2">
</form>

<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front?key=post&methodName=Allpost">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>
