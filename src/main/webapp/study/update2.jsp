<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
<HEAD>

<link rel="stylesheet" href="${path}/CSS/bootstrap2.css">
<link rel="stylesheet" href="${path}/CSS/bootstrap2.min.css">
<script src="../js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function cancel(){ 
	location.href = "${path}/front?key=study&methodName=viewStudy&studyNo=${study.studyNo}";	 
}

function checkValid(f) {
	if ( f.stateNo.value == "" ) {
		alert( "모집여부를 입력해 주세요." );
		f.stateNo.focus();
		return false;
	}
	if ( f.tagNo.value == "" ) {
		alert( "테그번호를 입력해 주세요." );
		f.tagNo.focus();
		return false;
	}
	if ( f.userId.value == "" ) {
        alert( "아이디를 입력해 주세요." );
        f.userId.focus();
        return false;
    }
	if ( f.studyMaxnum.value == "" ) {
        alert( "모집정원을 입력해 주세요." );
        f.studyMaxnum.focus();
        return false;
    }
	if ( f.studyDuedate.value == "" ) {
        alert( "마감일을 입력해 주세요." );
        f.studyDuedate.focus();
        return false;
    }
	if ( f.studyRegdate.value == "" ) {
        alert( "요일을 입력해 주세요." );
        f.studyRegdate.focus();
        return false;
    }
	if ( f.studyLocationSi.value == "" ) {
        alert( "지역(시)을 입력해 주세요." );
        f.studyLocationSi.focus();
        return false;
    }
	if ( f.studyLocationGu.value == "" ) {
        alert( "지역(구)을 입력해 주세요." );
        f.studyLocationGu.focus();
        return false;
    }
	if ( f.studyTitle.value == "" ) {
        alert( "제목을 입력해 주세요." );
        f.studyTitle.focus();
        return false;
    }
	if ( f.studyContent.value == "" ) {
        alert( "설명을 입력해 주세요." );
        f.studyContent.focus();
        return false;
    }
	
	if(confirm("수정하시겠습니까?") == true){
		return true;
	}else{
		return false;
	} 
}

$(function() {
	areaSelectMaker("select[name=addressRegion]");
});

var areaSelectMaker = function(target) {
	if (target == null || $(target).length == 0) {
		console.warn("Unkwon Area Tag");
		return;
	}

	var area = {
		"수도권" : {
			"서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구",
					"금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구",
					"서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구",
					"은평구", "종로구", "중구", "중랑구" ],
			"경기도" : [ "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구",
					"성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구",
					"안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시 상록구",
					"안산시 단원구", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시",
					"구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시",
					"용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시",
					"김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군",
					"양평군" ],
			"인천광역시" : [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구",
					"중구", "강화군", "옹진군" ]
		},
		"강원권" : {
			"강원도" : [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시",
					"홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군",
					"인제군", "고성군", "양양군" ]
		},
		"충청권" : {
			"충청북도" : [ "청주시 상당구", "청주시 서원구", "청주시 흥덕구", "청주시 청원구", "충주시",
					"제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군",
					"단양군" ],
			"충청남도" : [ "천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시", "서산시",
					"논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군",
					"예산군", "태안군" ],
			"대전광역시" : [ "대덕구", "동구", "서구", "유성구", "중구" ],
			"세종특별자치시" : [ "세종특별자치시" ]
		},
		"전라권" : {
			"전라북도" : [ "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시", "남원시",
					"김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군",
					"부안군" ],
			"전라남도" : [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군",
					"구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군",
					"무안군", "함평군", "영광군", "장성군", "완도군", "진도군", "신안군" ],
			"광주광역시" : [ "광산구", "남구", "동구", "북구", "서구" ]
		},
		"경상권" : {
			"경상북도" : [ "포항시 남구", "포항시 북구", "경주시", "김천시", "안동시", "구미시",
					"영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군",
					"영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군",
					"울진군", "울릉군" ],
			"경상남도" : [ "창원시 의창구", "창원시 성산구", "창원시 마산합포구", "창원시 마산회원구",
					"창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시",
					"양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군",
					"함양군", "거창군", "합천군" ],
			"부산광역시" : [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구",
					"사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구",
					"기장군" ],
			"대구광역시" : [ "남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군" ],
			"울산광역시" : [ "남구", "동구", "북구", "중구", "울주군" ]
		},
		"제주권" : {
			"제주특별자치도" : [ "서귀포시", "제주시" ]
		}
	};

	for (i = 0; i < $(target).length; i++) {
		(function(z) {
			var a1 = $(target).eq(z);
			var a2 = a1.next();
			var a3 = a2.next();

			//초기화
			init(a1, true);

			//권역 기본 생성
			var areaKeys1 = Object.keys(area);
			areaKeys1.forEach(function(Region) {
				a1.append("<option value="+Region+">" + Region
						+ "</option>");
			});

			//변경 이벤트
			$(a1).on("change", function() {
				init($(this), false);
				var Region = $(this).val();
				var keys = Object.keys(area[Region]);
				keys.forEach(function(Do) {
					a2.append("<option value="+Do+">" + Do + "</option>");
				});
			});

			$(a2).on("change",
				function() {
					a3.empty().append("<option value=''>선택</option>");
					var Region = a1.val();
					var Do = $(this).val();
					var keys = Object.keys(area[Region][Do]);
					keys.forEach(function(SiGunGu) {
						a3.append("<option value="+area[Region][Do][SiGunGu]+">"
							+ area[Region][Do][SiGunGu]
							+ "</option>");
					});
			});
		})(i);

		function init(t, first) {
			first ? t.empty().append("<option value=''>선택</option>") : "";
			t.next().empty().append("<option value=''>선택</option>");
			t.next().next().empty().append("<option value=''>선택</option>");
		}
	}
}

</SCRIPT>

</HEAD>

<BODY>


<form name="updateForm" method="post" action="${path}/front" onSubmit="return checkValid(this);">
    <input type="hidden" name="key" value="study" >
    <input type="hidden" name="methodName" value="updateStudy" >
    <input type='hidden' name='studyNo' value="${view.studyNo}">
    <input type="hidden" name="userId" value="${sessionScope.user.userId }">
    
<table class="table" align="center" cellpadding="10" cellspacing="2" width="90%">
	<thead>
	    <tr class="table-default">
	      <td colspan="4">
	      	<h4>스터디 수정</h4>
	      </td>
	    </tr>
    </thead>
    <tbody>
     <tr>
    	<td colspan="4">
      	<h4></h4>
      </td>
    </tr>
    <tr>
    <tr>
    	<td scope="table-primary" width="30%" height="80" valign="middle">
				<h6 align="center">태그번호</h6>
		</td>
		<td scope="table-primary"  height="20" valign="middle">
        	<select name="tagNo" id="tagNo">
				<option value="none">스터디 항목을 선택하세요</option>
				<option value="1">C/C++</option>
				<option value="2">C#</option>
				<option value="3">Python</option>
				<option value="4">Go</option>
				<option value="5">Swift</option>
				<option value="6">Perl</option>
				<option value="7">Java</option>
				<option value="8">Kotlin</option>
				<option value="9">JavaScript</option>
				<option value="10">Vue.js</option>
				<option value="11">React</option>
				<option value="12">node.js</option>
				<option value="13">Typescript</option>
				<option value="14">Ajax</option>
				<option value="15">JQuery</option>
				<option value="16">HTML</option>
				<option value="17">CSS</option>
				<option value="18">spring</option>
				<option value="19">JPA</option>
				<option value="20">Ruby</option>
				<option value="21">Mysql</option>
				<option value="22">ORACLE</option>
				<option value="23">git</option>
				<option value="24">Linux</option>
				<option value="25">Ubuntu</option>
				<option value="26">프론트엔드</option>
				<option value="27">백엔드</option>
				<option value="28">토이프로젝트</option>
				<option value="29">기타</option>
			</select>
        </td>
     <tr>
     	<td width="150" height="80" valign="middle">
				<h6 align="center">스터디 상태</h6>
		</td>
        <td width="200" height="20" valign="middle">
        	<select name="stateNo" id="stateNo">
				<option value="1" selected>모집중</option>
				<option value="2">진행중</option>
				<option value="3">스터디 종료</option>
			</select>
        </td>
     </tr>
    <tr>
        <td width="150" height="80" valign="middle">
				<h6 align="center">스터디 정원</h6>
		</td>
        <td width="200" height="20" valign="middle">
        	<input type="text" class="form-control" placeholder="스터디 정원을 입력하세요" name="studyMaxnum" value="${view.studyMaxnum}" id="studyMaxnum">
        </td>
    </tr>
    <tr>
        <td width="150" height="80" valign="middle">
				<h6 align="center">모집 마감일</h6>
		</td>
        <td width="100" height="20" valign="middle">
        	<input type="text" name="studyDuedate" value="${view.studyDuedate}" id="studyDuedate" class="form-control" placeholder="모집마감일자를 입력하세요">
        </td>
    </tr>
    <tr>
        <td width="150" height="80" valign="middle">
				<h6 align="center">스터디 요일</h6>
		</td>
        <td width="100" height="20" valign="middle">
        	<select name="dayNo" id="dayNo">
				<option value="none">=== 선택 ===</option>
				<option value="1">요일 무관</option>
				<option value="2">평일</option>
				<option value="3">주말</option>
			</select>
		</td>
    </tr>
    <tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">스터디 위치</h6>
		</td>
		<td width="450" height="20" valign="middle" valign="middle">
				<select name="addressRegion" ></select> 
				<select name="studyLocationSi" id="studyLocationSi"></select>
				<select name="studyLocationGu" id="studyLocationGu"></select>
		</td>
	</tr>
    <tr>
        <td width="150" height="80" valign="middle">
				<h6 align="center">제목</h6>
		</td>
        <td width="450" height="20" colspan="3" valign="middle">
        	<input class="form-control" placeholder="제목을 입력하세요" type="text" name="studyTitle" value="${view.studyTitle}" id="studyTitle">
        </td>
    </tr>
    <tr>
		<td width="150" height="80" valign="middle">
				<h6 align="center">내용</h6>
		</td>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
        <td width="450" height="200" valign="top" colspan="3" valign="middle">
        <textarea name="studyContent" id="studyContent" cols="50" rows="10" class="form-control">${view.studyContent}</textarea>
    </tr>
    
    <tr>
        <td width="450" height="20" colspan="2" align="center">
				<input type="submit" class="btn btn-outline-primary" value="수정하기">
				<button type="button" class="btn btn-outline-primary" onclick="cancel();">취소하기</button>
				
		</td>
    </tr>
</table>
</form>
<hr>
<!-- <div align=right><span style="font-size:9pt;">&lt;<a href="${path}/front">리스트로 돌아가기</a>&gt;</span></div> -->

</BODY>
</HTML>