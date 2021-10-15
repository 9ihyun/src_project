<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>자유게시판</title>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

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
.star_rating a.on {color:#FFFF00;}


</style>
</head>
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">

	$("#ser").click(function() {
		alert(1)
	});

	
	$(function(){
		$(".star_rating a").click(function() {
		    $(this).parent().children("a").removeClass("on");
		    $(this).addClass("on").prevAll("a").addClass("on");
		    return false;
		});
		});

</script>

<body>

<section>

  <article>
    

<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;"> 게시판 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="100"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 300px;"></textarea></td>
						</tr>
					</tbody>
				</table>
					<!-- 별점 기능  -->
					<p class="star_rating">
    				<a href="#" class="on">★</a>
   			 		<a href="#" >★</a>
    				<a href="#" >★</a>
   					<a href="#">★</a>
    				<a href="#">★</a>
					</p>
				
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" style="text-align:end" class="btn btn-primary pull-right" id="wr" value="글쓰기" >
			</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 양식 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


    
  </article>
</section>

<footer>
  <p></p>
</footer>

</body>
</html>