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
<table class="table" align="center" cellpadding="10" cellspacing="2" width="90%">

	<thead>
	    <tr class="table-default">
	      <td colspan="4">
	      	<h4>게시물 상세보기</h4>
	      </td>
	    </tr>
    </thead>
      <tbody>
    <tr>
    	<td colspan="4">
      	<h4></h4>
      </td>
    </tr>
    <tr class="table-active">
		<td width="30%" height="50" valign="middle">
				<b><h5 align="center" style="bold">제목</h5></b>
		</td>
		<td valign="middle"><h5>${view2.postTitle}</h5>
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
		<td valign="middle"><h6>${view2.postContent}</h6></td>
	</tr>
	<tr>
        <td height="20" colspan="4" align="center" valign="middle">
        	<c:if test="${sessionScope.userId != null}">
        	<c:if test="${sessionScope.userId != post2.userId}">
			  <input type = "hidden" id = "Likes" value="${view2.postUp}">
			  <input type = "hidden" id = "Likess" value="${view2.postNo}">
			  <div align="right">
				<button type="button" class="btn btn-primary" onClick="location.href='${path}/front?key=post&methodName=Allpost'">목록으로 돌아가기</button>
				<c:if test="${sessionScope.userId != null}">
		 					<c:if test="${sessionScope.userId == view2.userId}">
				<button type="button" class="btn btn-primary" onClick="location.href='${path}/front?key=post&methodName=postUpdateView2&postNo=${view2.postNo}'">수정</button>
				</c:if></c:if>
				<button type="button" class="btn btn-secondary" onclick="likey()">게시물 추천</button>
			  </div>
			  </c:if>
			</c:if>
			</c:if>
			<input type = "hidden" id = "Likes" value="${view2.postUp}">
			  <input type = "hidden" id = "Likess" value="${view2.postNo}">
			
			
		</td>
    </tr>
    </tbody>
</table>

<hr>
<h5>댓글</h5><br>

<c:choose>
	<c:when test = "${empty requestScope.replyList}">
		<h6>댓글정보가 없습니다.</h6>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${requestScope.replyList}" var = "reply">
			${reply.userId} | ${reply.pReplyDate}<p>
			${reply.pReplyContent}<p>
			<form action="${path}/front" method="post">
				<input type=hidden name="postNo" value="${view2.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">
				
				<button type="submit" class="btn btn-primary">삭제</button>
				<input type=hidden name="key" value="postReply"> 
				<input type=hidden name="methodName" value="deleteReply">	
				
				<a action="${path}/front" method="post"></a>
				<input type=hidden name="postNo" value="${view.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">
	
				<button type="submit" class="btn btn-primary">수정</button>
				<input type=hidden name="key" value="postReply"> 
				<input type=hidden name="methodName" value="updateReply">			
				</form>		
			<hr>
		</c:forEach>
	</c:otherwise>
</c:choose>


<div id="listReply"></div>
<form action="${path}/front" method="post">
	<input type=hidden name="postNo" value="${view2.postNo}">
	<input type = "text"  class="form-control" name="replytext" id="replytext" placeholder="댓글을 입력하세요"><br>
	
	<!-- input type="text" class="form-control" placeholder="댓글을 입력해주세요" name="sReplyContent" -->
	<input type="hidden" name="userId" value="${sessionScope.userId }"> 
	
	<button type="button" class="btn btn-primary" id="btnReply" onclick="replyInsertValidate('${view.postNo}'); return false;">등록</button>
	<input type=hidden name="key" value="studyReply"> 
	<input type=hidden name="methodName" value="insertReply">		
</form>
<hr>
 <c:if test="${sessionScope.sessionID != null}">
	 <c:if test="${sessionScope.sessionID != post.userId}">

	</c:if>
</c:if>
<hr>
</body>
</html>