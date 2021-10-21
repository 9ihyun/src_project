<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">

<script type="text/javascript" src="${path}/js/jquery-3.6.0.js"></script>

<!--  // 자바스크립트 부분 --> 

<script type="text/javascript">
function replyInsertValidate(postNo){
	
	if($("#replytext").val() < 1 || $("#replytext").val() == ''){
		alert('댓글 내용을 등록하세요.');
		return false;
	}
	
	var userId = '${sessionScope.userId}';
	
	/* 앞에서 세션체크를 했으나, 한번 더 유효성 체크 */
	if(userId == null || userId == ''){
		alert('세션이 없습니다.');
		return false;
	}
		
	replyInsert(postNo, userId);
}

function replyInsert(postNo, userId){
	
	var replytext = $("#replytext").val(); //댓글 내용
	var a ="/src_project/front?key=postReply&methodName=insertReply&replytext=";
	var b ="&postNo=${view2.postNo}";
	var c="&userId=${sessionScope.userId }";
	location.href = a+replytext+b+c;
	
  //  var param = { "replytext": replytext, "postNo": postNo, "userId": userId};
 //   $.ajax({
   //     type: "post", //데이터를 보낼 방식
  //      url: "${path}/front?key=postReply&methodName=insertReply", //데이터를 보낼 url
  //      data: param, //보낼 데이터
        
 //       success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
 //           alert("댓글이 등록되었습니다.");
 //           listReply(); //댓글 목록 출력
 //       }
//    });//ajax 끝
	
}

//댓글 목록 출력 함수
function listReply(){
    $.ajax({
        type: "get", //get방식으로 자료를 전달한다
        url: "${path}/front?key=postReply&methodName=selectAllReply&postNo=${view2.postNo}", //컨트롤러로 보내기.. 게시판 번호도 같이 보낸다.
        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
        	//alert('result : ' + result);
            //result : responseText 응답텍스트(html)
            //$("#listReply").html(result);
        	location.reload();
        }
    });
}





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

function likey(){
	var postups = document.getElementById("Likes").value;
	var b = parseInt(postups)+1;
	var postnos = document.getElementById("Likess").value;
	var ups ="&postUp=";
	var s = "/src_project/front?key=post&methodName=postLike&postNo=";
	var t = "&board=Allpost"
	var e =s+postnos+ups+b+t;
	//var two = "/src_project/front?key=post&methodName=postViewPost2&postNo=";
	
	location.href = e;
	//location.href = two+postnos;
}

</script>
<body>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'bgcolor="#FDF5E6">
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#5ABEF5">
            <p align="center"><font color="white" size="3"><b>
             게시물 상세보기</b></font></p>
        </td>
    </tr>
    <!-- 
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 태그번호 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view2.tagNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 게시판번호 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view2.boardNo}</b></span>
        </td>
    </tr>
    -->
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 제목 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view2.postTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;"> 내용 </span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${view2.postContent}</pre></b></span></td>
    </tr>
  
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
        			 <c:if test="${sessionScope.sessionID != null}">
        	<c:if test="${sessionScope.sessionID != post2.userId}">
			
			</c:if>
			</c:if>
			<input type = "hidden" id = "Likes" value="${view2.postUp}">
			  <input type = "hidden" id = "Likess" value="${view2.postNo}">
			<a href="${path}/front?key=post&methodName=Allpost">목록으로 돌아가기</a> &nbsp;&nbsp;&nbsp;
			<a href="${path}/front?key=post&methodName=postUpdateView2&postNo=${view2.postNo}" >수정</a>&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="likey()">추천</a>
			
		</td>
    </tr>
</table>

<hr>
<hr>

<div>  
<c:choose>
	<c:when test = "${empty requestScope.replyList}">
		<h5>댓글정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${requestScope.replyList}" var = "reply">
			${reply.userId} | ${reply.pReplyDate}<p>
			${reply.pReplyContent}<p>
			<form action="${path}/front" method="post">
				<input type=hidden name="postNo" value="${view2.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">
				<input type=hidden name="board" value="info">

					<input type="submit"  value=삭제>
					<input type=hidden name="key" value="postReply"> 
					<input type=hidden name="methodName" value="deleteReply">			
			</form>		
			<form action="${path}/front" method="post">
				<input type=hidden name="postNo" value="${view2.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">


<table align="center" cellpadding="10" cellspacing="2" width="90%">
  <tbody>
    <tr class="row">
      <td colspan="4">
      	<h6>댓글</h6>
      </td>
    </tr>
    <tr></tr>
    <tr>
	<!--  <td width="150" height="80">
			<c:choose>
				<c:when test = "${empty requestScope.replyList}">
					<h6> </h6>
				</c:when>
				<c:otherwise>
					<c:forEach items = "${requestScope.replyList}" var = "reply">
						<h6 align="center">${reply.userId}</h6>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>-->	
		<td>
        	<c:choose>
				<c:when test = "${empty requestScope.replyList}">
					<h6>댓글정보가 없습니다.</h6>
				</c:when>
				<c:otherwise>
					<c:forEach items = "${requestScope.replyList}" var = "reply">
					아이디: ${reply.userId} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						내용: ${reply.pReplyContent}<p>
						<form action="${path}/front" method="post">
							<input type=hidden name="postNo" value="${view2.postNo}">
							<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">
								<button type="submit" class="btn btn-primary">삭제</button>
								<input type=hidden name="key" value="postReply"> 
								<input type=hidden name="methodName" value="deleteReply">			
						</form>		
						<hr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
        </td>
	</tr>
</table>

<table align="center" cellpadding="10" cellspacing="2" width="90%">
	<tr>
		<td width="150" height="80">
			<h6 align="center">${sessionScope.user.userId}</h6>
		</td>
		<td>
		<div id="listReply"></div>
		<form action="${path}/front" method="post">
			<input type=hidden name="postNo" value="${view2.postNo}">
			<input type = "text" name="replytext" id="replytext" placeholder="댓글을 입력하세요" style=" width:400px; height:40px">
			
			<!-- input type="text" class="form-control" placeholder="댓글을 입력해주세요" name="sReplyContent" -->
			<input type="hidden" name="userId" value="${sessionScope.userId }"> 
			
			<button type="button" class="btn btn-primary" id="btnReply" onclick="replyInsertValidate('${view.postNo}'); return false;">등록</button>
			<input type=hidden name="key" value="studyReply"> 
			<input type=hidden name="methodName" value="insertReply">		
		</form>
		</td>
	</tr>
	</tbody>
</table>





<hr>
 <c:if test="${sessionScope.sessionID != null}">
	 <c:if test="${sessionScope.sessionID != post.userId}">

	</c:if>
</c:if>
<hr>
</body>
</html>