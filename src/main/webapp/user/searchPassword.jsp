<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<p>아이디/비밀번호 찾기</p>
   <form action="${pageContext.request.contextPath}/front" method="post">
   <input type="hidden" name="key" value = "LoginContoller" /> 
	<input type="hidden" name="methodName" value = "idPwFind" />
    생년월일: <input type="text" name="birth" placeholder="8자리로 입력하세요." required><br>
    비밀번호 찾기 질문 : 
	<select name="question" required>
       <option value="0">--질문 선택--</option>
	   <option value="one">보물 1호는?</option>
	   <option value="two">어렸을 적 별명은?</option>
	   <option value="three">가장 좋아하는 영화는?</option>
	   <option value="four">가장 자주가는 음식점은?</option>
	   <option value="five">만약 물고기를 한마리 기른다면?</option>	
	</select> <br>
    비밀번호 찾기 답: <input type="text" name="anwser" required><br>
    <input type="submit" value="확인"><br>
</form>

<!-- error에 대한 처리 -->
   <%if(request.getParameter("error") != null){ %>
   <h6><font color="red">해당하는 정보로 아이디를 찾지 못했습니다</font></h6>
   <%} %>
 
</body>
</html>