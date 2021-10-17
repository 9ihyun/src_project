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

</script>

</head>
<body>
<form name="writeForm" method="post" action="${path}/front?key=StudyDAOImpl&methodName=insertStudy" 
  onSubmit='return checkValid()' enctype="multipart/form-data">
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
            <p align="center"><b><span style="font-size:9pt;">제목</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="studyTitle" size="50"></span></b></td>
    </tr>
     <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">작성자</span></b></p>
        </td>
         <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type=password name="password" size="12">
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;"> 내용</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="studyContent" cols="50" rows="10"></textarea></span></b></td>
    </tr>
    
    
    <tr>
        <td width="150" height="20">
            <p align="center"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        		<input type=password name="password" size="12">  (글 수정, 삭제시 필요합니다.)
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;"><input type=submit value=등록하기>
        <input type=submit  value=취소하기 > 
    </tr>
</table>

</form>

<hr>
<!-- <div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div> -->



</body>
</html>