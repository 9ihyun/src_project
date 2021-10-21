<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" href="../CSS/bootstrap.css">
<link rel="stylesheet" href="../CSS/bootstrap.min(1).css">
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous"> 

  <script src="../ajaxBasic.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script> 
<style>


</style>

<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
<!-- 이 주석은 지워주세요~ -->

function cancel(){ //취소하기 눌렀을때
	
	parent.location.href = "infoBoardMain.jsp";

}

function checkValid(frm){
	
	if(frm.tagNo.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		alert("태그번호을 선택해주세요.");
		frm.tagNo.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		return false;
	}
	
	if(frm.boardNo.value == "1" || frm.boardNo.value == "3"){
		alert("게시판번호는 2번을 선택하세요.");
		frm.boardNo.focus();
		return false;
	}
	
	if(frm.userId.value == ""){
		alert("아이디를 입력해주세요.");
		frm.userId.focus();
		return false;
	}
	if(frm.tagNo.value == ""){
		alert("태그를 입력해주세요.");
		frm.userId.focus();
		return false;
	}
	if(frm.postContent.value == ""){
		alert("내용을 입력해주세요.");
		frm.postContent.focus();
		return false;
	}
	
	if(frm.postContent.value == ""){
		alert("내용을 입력해주세요.");
		frm.postContent.focus();
		return false;
	}
	
	
	
	if(confirm("등록하시겠습니까?") == true){
		return true;
	}
}


</script>

</head>
<body>
<form action="${path}/front" method="post" onsubmit="return checkValid(this);">
  	<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
	<input type="hidden" name="key" value="post">
	<input type="hidden" name="methodName" value="postInsert">
	<input type="hidden" name="type" value="2">
  
  
<!-- 
     ${path}/front?key=StudyDAOImpl&methodName=insertStudy
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
-->
	
   
   
<table align="center" cellpadding="10" cellspacing="2" width="90%" >

    <tbody>
        <tr class="table-primary">
        <th scope="row" height="80"> 지식정보공유 글쓰기  
		<td></td>
		<td></td>
		<td></td>
    	</tr>
   		 <tr></tr>
     
				<td width="150" height="80">
					<h6 align="center">태그 번호</h6>
				</td>
			
				<td scope="table-primary" width="450" height="80">
						<select name="tagNo" id="tagNo">
							<option value="">태그번호 선택</option>
							<option value="1" >C/C++</option>
							<option value="2" >C#</option>
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
        
  
    <tr>
 	<tr>
		<td width="150" height="80">
				<h6 align="center">제목</h6>
		</td>
		<td width="450" height="20">
			<input type="text" class="form-control" placeholder="제목을 입력하세요" name="postTitle" id="postTitle">
		</td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">내용</h6>
		</td>
		<td width="450" height="20">
		      <textarea class="form-control" name="postContent" rows="3"></textarea>
		</td>
	</tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <input type=submit class="btn btn-primary" value=등록하기>
        <button type="button"class="btn btn-primary" onclick="cancel();">취소하기</button>
        
    </tr>
</table>
		<input type = hidden name = "userId" value = "${sessionScope.user.userId}">
		<input type = hidden name = "tagNo" value = "29">
		<input type = hidden name = "boardNo" value = "2">
 	  <input type = hidden name = "key" value = "post">
      <input type = hidden name = "methodName" value = "postInsert2">
</form>




</body>
</html>