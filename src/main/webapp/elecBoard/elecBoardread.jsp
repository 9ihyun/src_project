<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="css/style.css">

<style type="text/css">


</style>


<script type="text/javascript" src="../js/jquery-3.6.0.js"></script> 

<!--  // 자바스크립트 부분 --> 
<script type="text/javascript">


//function checkValid(frm){
	
	//if(frm.postTitle.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		//alert("제목을 입력해주세요.");
		//frm.postTitle.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		//return false;
	//}
	

	//if(confirm("등록하시겠습니까?") == true){
		//return true;
	//}
//}



</script>



</HEAD>
<body>
</body>
<form name="writeForm" method="post" action="" 
  onSubmit='return checkValid(this)' enctype="multipart/form-data">
  
<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' bgcolor="#FDF5E6">
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#5ABEF5">
            <p align="center"><font color="white" size="3"><b>
             게시물 상세보기</b></font></p>
        </td>
    </tr>
   
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 제목 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.Post.postTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;"> 내용 </span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.Post.postContent}</pre></b></span></td>
    </tr>
     
    
  <!--    <tr>
    <td width="100" height="20">
           <p align="right"><b><span style="font-size:9pt;">비밀번호</span></b></p>
        </td>
        
    <form name="requestForm" method="post" action="${path}/front">
        <td height="20" colspan="3" align="left" valign="middle">
				<input type=password name="password" value="">		
		</td>
    </tr>
    -->
    
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
			<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
				<input type=hidden name="postNo" value="${Post.postNo}">
				<input type=hidden name="key" value="Post">
				<input type=hidden name="methodName" >
		
    </form>
			
		</td>
    </tr>
</table>
<hr>
<h3> 댓글 </h3>
<c:choose>
	<c:when test = "${empty PostReply.pReplyNo}">
		<h5>댓글정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${PostReply.pReplyNo}" var = "reply">
			${PostReply.pReplyNo} / ${PostReply.pReplyContent} /${PostReply.pReplyDate} /${PostReply.postNo}<p>
		</c:forEach>
	</c:otherwise>
</c:choose>
	<div>  
	<input type="text" value="댓글을 입력해주세요">
	</div>
	<div align="right">
	<input type="submit" value=등록>
	</div>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div>



</body>
</html>