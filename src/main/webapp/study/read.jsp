<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<HEAD>
<!--link rel="stylesheet" href="css/style.css"-->

<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
crossorigin="anonymous"> 

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
crossorigin="anonymous"></script> 

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

<table align="center" cellpadding="10" cellspacing="2" width="90%">

  <tbody>
    <tr class="table-primary">
      <th scope="row" height="80">스터디 상세보기</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr></tr>
    <tr>
		<td width="150" height="80">
				<h6 align="center">제목</h6>
		</td>
		<td><h6>${study.studyTitle}</h6>
        </td>
	</tr>
    <tr>
		<td scope="table-primary" width="400" height="80">
				<h6 align="center">스터디 모집여부</h6>
		</td>
		<td><h6>${study.stateName}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">스터디 항목</h6>
		</td>
		<td><h6>${study.tagName}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">작성자</h6>
		</td>
		 <td><h6>${study.userId}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">스터디 모집정원</h6>
		</td>
		<td><h6>${study.studyMaxnum}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">스터디 요일</h6>
		</td>
		<td><h6>${study.dayName}</h6>
		</td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">스터디 지역</h6>
		</td>
		<td><h6>${study.studyLocationSi} ${study.studyLocationGu}</h6>
		</td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">모집 마감일</h6>
		</td>
		<td><h6>${study.studyDuedate}</h6>
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">내용</h6>
		</td>
		<td><h6>${study.studyContent}</h6></td>
	</tr>
	<tr>
		<td colspan="4">
		<div align="right">
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<button type="submit" class="btn btn-outline-primary">찜하기</button>
				<input type=hidden name="key" value="myStudy"> 
				<input type=hidden name="methodName" value="putWishStudy">			
			</form>	<br>
			<form action="${path}/front" method="post">
				<input type=hidden name="studyNo" value="${study.studyNo}">
				<button type="submit" class="btn btn-outline-primary">신청하기</button>
				<input type=hidden name="key" value="myStudy"> 
				<input type=hidden name="methodName" value="putSignStudy">			
			</form>	
			</div>
		</td>
	</tr>
  </tbody>
</table>

<br>
<br>
<hr>

<table align="center" cellpadding="10" cellspacing="2" width="90%">
  <tbody>
    <tr class="row">
      <th scope="row" height="80" size="8">댓글</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr></tr>
    <tr>
		<td width="150" height="80">
			<c:choose>
				<c:when test = "${empty requestScope.StudyReply}">
					<h6> </h6>
				</c:when>
				<c:otherwise>
					<c:forEach items = "${StudyReply}" var = "reply">
						<h6 align="center">${reply.userId}</h6>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</td>
		<td>
        	<c:choose>
				<c:when test = "${empty requestScope.StudyReply}">
					<h6>댓글정보가 없습니다.</h6>
				</c:when>
				<c:otherwise>
					<c:forEach items = "${StudyReply}" var = "reply">
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
        </td>
	</tr>
	<tr>
		<td width="150" height="80">
				<h6 align="center">${sessionScope.user.userId}</h6>
		</td>
		<td>
		<div id="listReply"></div>
		<form action="${path}/front" method="post">
			<input type=hidden name="studyNo" value="${study.studyNo}">
			<input type = "text" name="sReplyContent" id = "searchByStudy" placeholder="댓글을 입력하세요" style=" width:400px; height:40px">
			
			<!-- input type="text" class="form-control" placeholder="댓글을 입력해주세요" name="sReplyContent" -->
			<input type="hidden" name="userId" value="${sessionScope.userId }"> 
			<button type="submit" class="btn btn-primary">등록</button>
			<input type=hidden name="key" value="studyReply"> 
			<input type=hidden name="methodName" value="insertReply">		
		</form>
		</td>
	</tr>
	</tbody>
</table>

<!-- 댓글 작성 -->
<!-- 너비와 정렬방식 설정 -->
<div style="width:700px; text-align:center;">
 
<!-- 세션에 저장되어있는 userid가 null이 아닐때 -->
<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->
     <c:if test="${sessionScope.userid != null }">
     
     
         <textarea rows="5" cols="80" id="replytext"
             placeholder="댓글을 작성하세요"></textarea>
         <br>
         <!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
         <!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
         <!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
         <button type="button" id="btnReply">댓글쓰기</button>
       </c:if>
</div>


<hr>
<table align="center" cellpadding="10" cellspacing="2" width="90%">
 <c:if test="${sessionScope.user.userId != null}">
 <c:if test="${sessionScope.user.userId == study.userId}">
  <tbody>
    <tr class="row">
      <th scope="row" height="80" size="8">스터디 신청자</th>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr></tr>
    
    	<c:choose>
			<c:when test = "${empty userList}">
				<tr><th><h5>신청자가 없습니다.</h5></th></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items = "${userList}" var = "user">
				<tr>
					<th>${user.nickname} | ${user.starPoint}</th>
					<th><input type="button" name="${user.userId }" value="수락"></th>
					<th><input type="button" name="${user.userId }" value="거절"></th>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
   </tbody>
  </c:if>
  </c:if>
 </table>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${path}/study/list.jsp">리스트로 돌아가기</a>&gt;</span></div>
</body>






