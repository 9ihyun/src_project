<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="css/style.css">

<style type="text/css">

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#FFF663;}


</style>


<script type="text/javascript" src="../js/jquery-3.6.0.js"></script> 

<!--  // 자바스크립트 부분 --> 
<script type="text/javascript">

$(function(){  //꼭 호출 function()을 해야지만 밑에기능들이 제대로 실행됨 
$(".star_rating a").click(function() { // 별을 클릭했을때 
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});
});

function checkValid(frm){
	
	if(frm.postTitle.value == ""){ //boardTitle 는 id값이다 , ""은 = 공백일경우 
		alert("제목을 입력해주세요.");
		frm.postTitle.focus(); // 제목이 입력되지 않은경우 경고창이 뜨고 포커스를 제목으로 가져다준다.
		return false;
	}
	

	if(confirm("등록하시겠습니까?") == true){
		return true;
	}
}



</script>



</HEAD>
<body>
</body>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
             게시물 상세보기</b></font></p>
        </td>
    </tr>
   
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 제목 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${requestScope.post.postTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;"> 내용 </span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${requestScope.post.postContent}</pre></b></span></td>
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
				<input type=hidden name="postNo" value="${post.postNo}">
				<input type=hidden name="key" value="Post">
				<input type=hidden name="methodName" value ="">
		
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
			${PostReply.pReplyNo} / ${PostReply.pReplyContent} <!--/${PostReply.pReplyDate} /${PostReply.postNo}--><p>
		</c:forEach>
	</c:otherwise>
</c:choose>
	<div>  
	<p class="star_rating" >
    <a href="#" class="">★</a> <!-- on 을 해두면 색이 노란색으로 나옴 -->
    <a href="#" class="">★</a>
    <a href="#" class="">★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>
	<input type="text"  value="댓글을 입력해주세요">
	</div>
	<div align="right">
	<input type="submit"  value=등록>
	</div>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div>



</body>
</html>