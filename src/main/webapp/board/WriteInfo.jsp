
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap.css">


<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">


//$(function(){ 
	//취소했을때 1
	 //$("#cancel").click(function(){
		// if(confirm("취소하시겠습니까?") == true){
			// parent.location.href = "freeBoardMain.jsp";
		 //}else{
			 //return false;
		// }
	 //}); 
//});



function cancel(){ //취소하기 눌렀을때
		parent.location.href = "freeBoardMain.jsp";
	
}

function checkValid(frm){
	
	if(frm.tagNo.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		alert("번호을 선택해주세요.");
		frm.tagNo.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		return false;
	}
	
	if(frm.boardNo.value == ""){
		alert("게시물 번호를 선택해주세요.");
		frm.boardNo.focus();
		return false;
	}
	
	if(frm.userId.value == ""){
		alert("아이디를 입력해주세요.");
		frm.userId.focus();
		return false;
	}
	
	if(frm.postTitle.value == ""){
		alert("제목을 입력해주세요.");
		frm.postTitle.focus();
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
  
<!-- 
     ${path}/front?key=StudyDAOImpl&methodName=insertStudy
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
-->
	
   
<table class="table" align="center" cellpadding="10" cellspacing="2" width="90%">

	<thead>
	    <tr class="table-default">
	      <td colspan="4">
	      	<h4>스터디 등록</h4>
	      </td>
	    </tr>
    </thead>
  <tbody>
     <tr>
    	<th colspan="4">
      	<h4></h4>
      </th>
    </tr>
    <tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">게시판</h6>
		</td>
		<td width="150" height="80" valign="middle">
				<h6 align="center">자유게시판</h6>
		</td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">제목</h6>
		</td>
		<td width="450" height="20" valign="middle">
			<input type="text" class="form-control" placeholder="제목을 입력하세요" name="postTitle">
		</td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">내용</h6>
		</td>
		<td width="450" height="20" valign="middle">
		      <textarea class="form-control" name="postContent" rows="3"></textarea>
		</td>
	</tr>
	<tr>
		<td>
		<div align="left">
			<button type="submit" class="btn btn-outline-primary" onclick="cancel();">취소하기</button>
			</div>
		</td>
		<td>
		<div align="right">
			<button type="submit" class="btn btn-outline-primary">등록하기</button>
			</div>
		</td>
	</tr>
  </tbody>
  </table>

		<input type = hidden name = "userId" value = "${sessionScope.userId}">
		<input type = hidden name = "tagNo" value = "29">
		<input type = hidden name = "boardNo" value = "1">
 	  <input type = hidden name = "key" value = "post">
      <input type = hidden name = "methodName" value = "postInsert">
      
</form>




</body>
</html>