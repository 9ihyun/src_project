 $(function(){
	 //전체 검색하기
	 function selectAll(){
		 $.ajax({
				 url: "../selectAll", //서버요청주소
				 type: "post", //method 방식(get, post, put, delete)
				 dataType: "json", //서버가 응답해주는 데이터의 type(text, hmtl, xml, json)
				 //data: {keyWord: $(this).val()}, //서버에게 보낼 parameter 정보
				 success: function(result){
					 //alert(result);
					 
					 //결과를 테이블에 넣는다.
					 var str = "";
					 $.each(result, function(index, item){
						 str+="<tr>";
						 str+=`<td>${index+1}</td>`
						 str+=`<td><a href='#'>${item.id}</td>`
						str+=`<td>${item.name}</td>`
						str+=`<td>${item.age}</td>`
						str+=`<td>${item.tel}</td>`
						str+=`<td>${item.addr}</td>`
						str+=`<td><input type = 'button' value='삭제' id='${item.id}'></td>`
						str+="</tr>"
					 });
					 
					 $("#listTable tr:gt(0)").remove();
					 $("#listTable tr:eq(0)").after(str);
					 
					 $("a").css("textDecoration","none")
					 
					
				 }, //성공했을 때 callback 함수
				 error: function(err){
					 alert(err+"발생했어요");
				 }//실패했을 때 함수
			 });//ajax 끝

	}//함수 끝
 			 
 		
 			 
 			 ///////////////////////////////////
 			 //가입하기 OR 수정하기
 			 $("#btn").click(function(){
 				 let urlAddr = "../insert";
 				 let state = true; //등록이나 수정을 해야하는지 여부를 판단하는 상태변수 (true이면 ajax 실행, flase면 안함)
 				 
 				 //유효성 체크한다.
 				 $("input[type=text]").each(function(index, element){//element는 <input>요소
 					 
 					 if($(this).val() == ""){
 						 alert("값을 입력하세요");
 						 $(this).focus(); //커서놓기
 						// return; //each안에 있는 하나의 function만 빠져나간다.
 						 state = false; //ajax 실행(수정 or 등록)하지마.... 
 						 return false; //each를 빠져나가라
 					 }
 				 });
 				 
 				 if(state){//등록 또는 수정
 					 //수정하기라면..
 					 if($(this).val()=="수정하기"){
 						 urlAddr = "../update";
 						 
 						 $("#id").removeAttr("readonly");//속성제거
 						 $("span").show();
 						 $("#btn").val("가입하기");
 					 }
 					 
 				 }
 				 
 				 
 			if(state){//등록 또는 수정
 				$.ajax({
					 url: urlAddr, //서버요청주소
					 type: "post", //method 방식(get, post, put, delete)
					 dataType: "text", //서버가 응답해주는 데이터의 type(text, hmtl, xml, json)
					 data: $("#inForm").serialize(), //폼 전송
					 success: function(result){
						if(result == 0){
							alert("등록되지 않았습니다.");
						
						}else{
							//text박스 지우기
							//$("#inForm").reset(); //에러발생 (jQuery에 reset()이 없다!)
							//document.getElementById("inForm").reset();
							
							$("input[type=text]").val("");
							$("span").text("중복결과여부");
							
							
							//화면 갱신
							selectAll();
						}
						 
					 }, //성공했을 때 callback 함수
					 error: function(err){
						 alert(err+"발생했어요");
					 }//실패했을 때 함수
				 });//ajax 끝
 			}
 			 });
 			 
 			 ///////////////////////////////////////////////////////////////////////////
 			 /**
 			 	아이디를 클릭했을 때 (a 태그) 처리할 이벤트 - 동적으로 생성되었다.
 			 */
 			 $(document).on("click", "#listTable > tbody > tr > td:nth-child(2) > a", function(){
 				 
 				 let name = $(this).parent().next(); //<td>
 				 let age = name.next();
 				 let tel = age.next();
 				 let addr = tel.next();
 				 
 				 $("#id").val($(this).text());
 				 $("#name").val(name.text());
 				$("#age").val(age.text());
 				$("#tel").val(tel.text());
 				$("#addr").val(addr.text());
 				
 				//////////////////////////////
 				//아이디 박스를 비활성화
 				$("#id").attr("readonly", "readonly");
 				
 				//버튼 글씨를 수정하기로 변경
 				$("#btn").val("수정하기");
 				
 				//span 태그를 감추기
 				$("span").hide();
 				 
 			 });
 			 //////////////////////////////////////////////
 			 //삭제하기 기능
 			 $(document).on("click", "[value=삭제]", function(){
 				 //alert($(this).attr("id"))
 				 if(confirm("정말 삭제하실래요")){
 				 $.ajax({
					 url: "../delete", //서버요청주소
					 type: "post", //method 방식(get, post, put, delete)
					 dataType: "text", //서버가 응답해주는 데이터의 type(text, hmtl, xml, json)
					 data: {id:$(this).attr("id")}, //폼 전송
					 success: function(result){
						if(result==0){
							alert("삭제되지 않았습니다.");
						}else{
							selectAll(); //화면갱신
						}
						 
					 }, //성공했을 때 callback 함수
					 error: function(err){
						 alert(err+"발생했어요");
					 }//실패했을 때 함수
				 });//ajax 끝
 				 }
 				 
 			 });
 			 
 			 selectAll();
  })//ready End