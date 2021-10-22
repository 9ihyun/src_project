<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   


<script src="/controller/resources/js/jquery.form.min.js">
function logi(){
	window.close();
}
</script>

<object id=window type="application/x-oleobject" classid="clsid:adb880a6-d8ff-11cf-9377-00aa003b7a11">
<param name="Command" value="Close">
</object>

<a href="#" onClick="window.Click();">조용하게 창닫기</a>



onClick="window.close()
<div class="container">
	<div class="col-lg-8 col-lg-offset-2 text-center">
		<div class="logo">
			<h1>Error !</h1>
		</div>
		<p class="lead text-muted">${errorMsg} </p>
		<div class="clearfix"></div>
		
		<div class="clearfix"></div>
		<br />
		<c:choose>
		  <c:when test="${empty loginUser}">
		      <div class="col-lg-6  col-lg-offset-3">
			<div class="btn-group btn-group-justified">
			<a href='/src_project/user/singin.jsp' target='_blank' onClick="window.Click();"> Login</a>
				
				<a href="${pageContext.request.contextPath}" class="btn btn-success">Return Website</a>
				<a href="javascript:history.back()" class="btn btn-success">뒤로가기</a>
			</div>

		    </div>
		  </c:when>
		  <c:otherwise>
		      <div class="col-lg-6  col-lg-offset-3">
			<div class="btn-group btn-group-justified">
				<a href="javascript:history.back()" class="btn btn-primary">Back</a>
				<a href="${pageContext.request.contextPath}" class="btn btn-success">Return Website</a>
				<a href="javascript:history.back()" class="btn btn-success">뒤로가기</a>
			</div>

		</div>
		  </c:otherwise>
		</c:choose>	
	</div>

</div>

