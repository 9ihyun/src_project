<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>

<style>


</style>

<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
<!-- 이 주석은 지워주세요~ -->

function cancel(){ //취소하기 눌렀을때
	
	parent.location.href = "infoBoardMain.jsp";

}

function checkValid(frm){
	
	if(frm.postTitle.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		alert("제목을 입력해주세요.");
		frm.postTitle.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		return false;
	}
	
	if(frm.userId.value == ""){
		alert("작성자를 입력해주세요.");
		frm.userId.focus();
		return false;
	}
	
	if(frm.postContent.value == ""){
		alert("내용을 입력해주세요.");
		frm.postContent.focus();
		return false;
	}
	
	if(frm.password.value == ""){
		alert("패스워드를 입력해주세요.");
		frm.password.focus();
		return false;
	}
	
	
	
	if(confirm("등록하시겠습니까?") == true){
		return true;
	}
}

</script>

</head>
<body>
<form action="${path}/front" >
  
<!-- 
     ${path}/front?key=StudyDAOImpl&methodName=insertStudy
     아래 문장으로 전송하면 post방식으로 전송이되고 현재 파일업로드때문에 enctype="multipart/form-data" 설정되어 있기때문에 
     request로 값을 받을수가 없다. ( MulitpartRequest로 받아야한다.) 그런데 Controller로 가기전에 Controller를 찾기위해서 
     DispatherServlet에서 request로 두개의 값을 받고 있기때문에 key, methodName은 get방식으로 별도로 전송해야한다.
-->
	
   
   
<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 게시글 등록 </b></font></p>
        </td>
    </tr>
      </tr>
     
     			<tr>
				<td width="150" height="20">
					<p align="center">
						<b><span style="font-size: 9pt;">태그 번호</span></b>
					</p>
				</td>
				<td width="450" height="20">
						<select name="tagNo">
							<option value="none">태그번호 선택</option>
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
				<td width="150" height="20">
					<p align="center">
						<b><span style="font-size: 9pt;">보드 번호</span></b>
					</p>
				</td>
				<td width="450" height="20">
					
						<select name="boardNo">
							<option value="1">1.자유게시판</option>
							<option value="2">2.지식정보게시판</option>
							<option value="3">3.알쓸신술게시판</option>
						</select>
						
					</td>
			</tr>
     
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">아이디</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="userId" id="userId" size="12">
        	   </span></b>
        </td>
  
    <tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type="text" name="postTitle" id="postTitle" size="12">
        	   </span></b>
        </td>
        
           <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;"> 내용</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="postContent" id="postContent" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <input type=submit value=등록하기>
        <button type="button" onclick="cancel();">취소하기</button>
    </tr>
</table>
 	  <input type = hidden name = "key" value = "post">
      <input type = hidden name = "methodName" value = "postInsert2">
</form>




</body>
</html>