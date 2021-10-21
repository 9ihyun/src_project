<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">

<script type="text/javascript" src="${path }/js/jquery-3.6.0.js"></script> 

<script type="text/javascript">
	$(function(){
		$(document).on("click", "[value=수락]", function(){
			$.ajax({
				type: "post",
				url: "${path}/ajax?key=myStudy&methodName=changeSignState",
				data: {"id" : $(this).attr("name"), "studyNo" : "${study.studyNo}"},
				dataType: "json",
				success: function(result){
					alert("수락하셨습니다");
					location.reload();
				},
				error:function() {
					console.log("실패");
				}
			});
		});
		
		$(document).on("click", "[value=거절]", function(){
			$.ajax({
				type: "post",
				url: "${path}/ajax?key=myStudy&methodName=removeSignStudy",
				data: {"id" : $(this).attr("name"), "studyNo" : "${study.studyNo}"},
				dataType: "json",
				success: function(result){
					alert("거절하셨습니다");
					location.reload();
				},
				error:function() {
					console.log("실패");
				}
			});
		});
		
		//댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문)
	    $("#btnReply").click(function(){
	        var replytext=$("#replytext").val(); //댓글 내용
	        var studyNo="${study.studyNo}"; //게시물 번호
	        var param={ "replytext": replytext, "studyNo": studyNo};
	        //var param="replytext="+replytext+"&bno="+bno;
	        $.ajax({
	            type: "post", //데이터를 보낼 방식
	            url: "${path}/front?key=studyReply&methodName=insertReply", //데이터를 보낼 url
	            data: param, //보낼 데이터

	            success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
	                alert("댓글이 등록되었습니다.");
	                listReply2(); //댓글 목록 출력
	            }
	        });//ajax 끝
	    });//댓글 등록 끝

	});//ready 끝
	
	//댓글 목록 출력 함수
	function listReply(){
	    $.ajax({
	        type: "get", //get방식으로 자료를 전달한다
	        url: "${path}/front?key=studyReply&methodName=selectAllReply&studyNo=${study.studyNo}", //컨트롤러로 보내기.. 게시판 번호도 같이 보낸다.
	        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
	            //result : responseText 응답텍스트(html)
	            $("#listReply").html(result);
	        }
	    });
	}

</script>


</HEAD>

<body>
<form>

<table class="table" align="center" cellpadding="10" cellspacing="2" width="90%">

	<thead>
	    <tr class="table-default">
	      <td colspan="4">
	      	<h4>스터디 상세보기</h4>
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
		<td width="50%" height="80" valign="middle">
				<b><h5 align="center" style="bold">제목</h5></b>
		</td>
		<td valign="middle"><h5>${study.studyTitle}</h5>
        </td>
	</tr>
    <tr>
		<td scope="table-primary" width="400" height="80" valign="middle">
				<h6 align="center">스터디 모집여부</h6>
		</td>
		<td valign="middle"><h6>${study.stateName}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">스터디 항목</h6>
		</td>
		<td valign="middle"><h6>${study.tagName}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">작성자</h6>
		</td>
		 <td valign="middle"><h6>${study.userId}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
			<h6 align="center">스터디 모집정원</h6>
		</td>
		<td valign="middle"><h6>${study.studyMaxnum}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">스터디 요일</h6>
		</td>
		<td valign="middle"><h6>${study.dayName}</h6>
		</td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">스터디 지역</h6>
		</td>
		<td valign="middle"><h6>${study.studyLocationSi} ${study.studyLocationGu}</h6>
		</td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">모집 마감일</h6>
		</td>
		<td valign="middle"><h6>${study.studyDuedate}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">내용</h6>
		</td>
		<td valign="middle"><h6>${study.studyContent}</h6></td>
	</tr>
	<tr>
		<td>
		<div align="left">
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<button type="submit" class="btn btn-warning">찜하기</button>
				<input type=hidden name="key" value="myStudy"> 
				<input type=hidden name="methodName" value="putWishStudy">			
			</form>	
			</div>
		</td>
		<td>
		<div align="right">
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<button type="submit" class="btn btn-primary">신청하기</button>
				<input type=hidden name="key" value="myStudy"> 
				<input type=hidden name="methodName" value="putSignStudy">			
			</form>	
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<c:if test="${sessionScope.userId != null}">
		 <c:if test="${sessionScope.userId == study.userId}">
			<button type="button" value = "찾기" class="btn btn-primary btn-sm" onclick="location.href='${path}/front?key=study&methodName=updateStudyView&studyNo=${study.studyNo}'">수정</button>
			<button type="button" value = "찾기" class="btn btn-primary btn-sm" onclick="location.href='${path}/front?key=study&methodName=deleteStudy&studyNo=${study.studyNo}'">삭제</button>		</c:if>
		</c:if>
		</td>
	</tr>
  </tbody>
</table>
<hr>
<h5>댓글</h5><br>
<c:choose>
	<c:when test = "${empty requestScope.StudyReply}">
		<h6>댓글정보가 없습니다.</h6>
	</c:when>
	<c:otherwise>
		<c:forEach items = "${StudyReply}" var = "reply">
			${reply.userId} | ${reply.sReplyDate}<p>
			${reply.sReplyContent}<p>				
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<input type=hidden name="sReplyNo" value="${reply.sReplyNo}">
					<button type="submit" class="btn btn-primary">삭제</button>
					<input type=hidden name="key" value="studyReply"> 
					<input type=hidden name="methodName" value="deleteReply">			
			</form>		
			<hr>
		</c:forEach>
	</c:otherwise>
</c:choose>

<div id="listReply"></div>
<form action="${path}/front" method="post">
	<input type=hidden name="studyNo" value="${study.studyNo}">
    <input type="text" class="form-control"  name="sReplyContent" placeholder="댓글을 입력하세요" id="searchByStudy" width="200px"><br>
	
	<!-- input type="text" class="form-control" placeholder="댓글을 입력해주세요" name="sReplyContent" -->
	<input type="hidden" name="userId" value="${sessionScope.userId }"> 
	<button type="submit" class="btn btn-primary">등록</button>
	<input type=hidden name="key" value="studyReply"> 
	<input type=hidden name="methodName" value="insertReply">		
</form>

<hr>
<h5>스터디 신청자</h5><br>

<table align="center" cellpadding="10" cellspacing="2" width="90%">
	 <c:if test="${sessionScope.userId != null}">
	 <c:if test="${sessionScope.userId == study.userId}">
	 <c:choose>
		<c:when test = "${empty userList}">
			<tr><th><h5>신청자가 없습니다.</h5></th></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items = "${userList}" var = "user">
			<tr>
				<th><h6>${user.nickname} | ${user.starPoint}</h6></th>
				<!-- <th><input type="button" name="${user.userId }" value="수락"></th>-->
				<th><button type="button" class="btn btn-primary" name="${user.userId }">수락</button></th>
				
				<!--<th><input type="button" name="${user.userId }" value="거절"></th> -->
				<th><button type="button" class="btn btn-outline-primary" name="${user.userId }">거절</button></th>
				
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
  	</c:if>
  	</c:if>
 </table>

<hr>
<div align="right">
<button type="button" value = "찾기" class="btn btn-primary btn-sm" onclick="location.href='${path}/front?key=study&methodName=selectAllStudy'">리스트로 돌아가기</button>	
</div>
</body>






