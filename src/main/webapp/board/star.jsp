<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</script>



</head>
<body>

<p class="star_rating">
    <a href="#" class="">★</a> <!-- on 을 해두면 색이 노란색으로 나옴 -->
    <a href="#" class="">★</a>
    <a href="#" class="">★</a>
    <a href="#">★</a>
    <a href="#">★</a>
</p>


</body>
</html>