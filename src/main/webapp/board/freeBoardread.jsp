<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" href="css/style.css">

<style type="text/css">

/* .star_rating {font-size:0; letter-spacing:-4px;}
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

 */
</style>


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
	
    var param = { "replytext": replytext, "postNo": postNo, "userId": userId};
    //var param="replytext="+replytext+"&bno="+bno;
    $.ajax({
        type: "post", //데이터를 보낼 방식
        url: "${path}/front?key=postReply&methodName=insertReply", //데이터를 보낼 url
        data: param, //보낼 데이터
        
        success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
            alert("댓글이 등록되었습니다.");
            listReply(); //댓글 목록 출력
        }
    });//ajax 끝
	
}

//댓글 목록 출력 함수
function listReply(){
    $.ajax({
        type: "get", //get방식으로 자료를 전달한다
        url: "${path}/front?key=postReply&methodName=selectAllReply&postNo=${view.postNo}", //컨트롤러로 보내기.. 게시판 번호도 같이 보낸다.
        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
        	//alert('result : ' + result);
            //result : responseText 응답텍스트(html)
            //$("#listReply").html(result);
        	location.reload();
        }
    });
}




</script>
<body>

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1' bgcolor="#FDF5E6">
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#2185C5">
            <p align="center"><font color="white" size="4"><b>
             게시물 상세보기</b></font></p>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 태그번호 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view.tagNo}</b></span>
        </td>
    </tr>
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 게시판번호 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view.boardNo}</b></span>
        </td>
    </tr>
   
    <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;"> 제목 </span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>${view.postTitle}</b></span>
        </td>
    </tr>
    <tr>
		<td width="100" height="200" valign="top">
            <p align="right"><b><span style="font-size:9pt;"> 내용 </span></b></p>
        </td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3">
        <span style="font-size:9pt;"><b><pre>${view.postContent}</pre></b></span></td>
    </tr>
  
    <tr>
        <td height="20" colspan="4" align="center" valign="middle">
        	<c:if test="${sessionScope.sessionID != null}">
        	<c:if test="${sessionScope.sessionID != post.userId}">
			</c:if>
			</c:if>
			<a href="${path}/front?key=post&methodName=postSelectAllPost" >목록으로 돌아가기</a> &nbsp;&nbsp;&nbsp;
			<a href="${path}/front?key=post&methodName=postUpdateView&postNo=${view.postNo}" >수정</a>
		</td>
    </tr>
</table>
<hr>
<h3>Replies 정보</h3>

<div>  
<c:choose>
	<c:when test = "${empty requestScope.postReply}">
		<h5>댓글정보가 없습니다.</h5>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${postReply}" var = "reply">
			${reply.userId} | ${reply.sReplyDate}<p>
			${reply.sReplyContent}<p>
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${view.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">

					<input type="submit"  value=삭제>
					<input type=hidden name="key" value="postReply"> 
					<input type=hidden name="methodName" value="deleteReply">			
			</form>		
			<form action="${path}/front" method="post">
				<input type=hidden name="postNo" value="${view.postNo}">
				<input type=hidden name="pReplyNo" value="${reply.pReplyNo}">

					<input type="submit"  value=수정>
					<input type=hidden name="key" value="postReply"> 
					<input type=hidden name="methodName" value="updateReply">			
			</form>		
			<hr>
		</c:forEach>
	</c:otherwise>
</c:choose>

<!-- <div>  
	<p class="star_rating" >
    <a href="#" class="on">★</a> on 을 해두면 색이 노란색으로 나옴
    <a href="#" class="">★</a>
    
    <a href="#" class="">★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>
	</div> -->

<!-- 댓글 작성 -->
<!-- 너비와 정렬방식 설정 -->
<div style="width:700px; text-align:center;">
 
<!-- 세션에 저장되어있는 userid가 null이 아닐때 -->
<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->

     <!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
     <!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
     <!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
          
     
	<textarea rows="5" cols="80" id="replytext" name="replytext" placeholder="댓글을 작성하세요"></textarea><br>
	
	<!-- 로그인 했을때 -->
	<c:if test="${not empty sessionScope.userid}">
		<button type="button" id="btnReply" onclick="replyInsertValidate('${view.postNo}'); return false;">댓글쓰기</button>
	</c:if>
	
	<!-- 로그인 안했을때 -->
	<c:if test="${empty sessionScope.userid}">
		<button type="button" id="btnReply" onclick="alert('로그인이 필요합니다.'); return false;">댓글쓰기</button>
	</c:if>
	
	<%-- <button type="button" id="btnReply" onclick="replyInsertValidate('${view.postNo}'); return false;">댓글등록테스트용</button> --%>
</div>

<!-- 댓글 목록 -->
<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->
<c:if test="${not empty replyList}">
	<div id="listReply">
		<c:forEach var="item" items="${replyList}" varStatus="status">
			작성자 : ${item.userId} /	내용  : ${item.pReplyContent} / 작성일자 : ${item.pReplyDate} <br>
		</c:forEach>
	</div>
</c:if>


</div>

<hr>
 <c:if test="${sessionScope.sessionID != null}">
	 <c:if test="${sessionScope.sessionID != post.userId}">

	</c:if>
</c:if>
<hr>
</body>
</html>