<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
	input[type="checkbox"], input[type="radio"] {
	
		    background-color: initial;
		    cursor: default;
		    appearance: auto;
		    box-sizing: border-box;
		    margin: 3px 3px 0px 5px;
		    padding: initial;
		    border: initial;
		    z-index: 1;
		    opacity: 1;
		    float: none;
		    display: inline-block;
	}
</style>
<div id="login_area" style="width: 600px;" class="signup_area">
	<h1 id="login_title">회원가입</h1>
	<form method="POST" action="/walkpet/member/signupOk" name="signup">
		<div class="title">이름</div>
		<input type="text" name="name" class="input" placeholder="이름을 입력해주세요." id="name">
		
		<div class="title">아이디</div>
		<input type="text" name="id" class="input" placeholder="아이디를 입력해주세요." id="memId">
		<input type="button" value="중복확인" onclick="idCheck();" class="btn">
		<div class="title" id="result"></div>
		
		<div class="title">비밀번호</div>
		<input type="password" name="pw" class="input" id="pw" placeholder="특수문자 포함 8자이상으로 입력해주세요.">
		<div class="pwcomment"></div>
		
		<div class="title">비밀번호 확인</div>
		<input type="password" class="input" id="pwcheck" placeholder="비밀번호를 다시 입력해주세요.">
		<div class="title" id="pwComment"></div>
		
		<div class="title">주민등록번호</div>
		<input type="password" name="jumin" class="input" id="jumin" placeholder="'OOOOOO-OOOOOOO' 형식으로 입력해주세요.">
		
		<div class="title">성별</div>
		<input type="radio" name="gender" value="m" checked><span>남성</span>
		<input type="radio" name="gender" value="f"><span>여성</span>
		
		<div class="title">연락처</div>
		<input type="text" name="tel" class="input" id="tel" placeholder="'010-OOOO-OOOO' 형식으로 입력해주세요.">
		
		<div class="title">이메일</div>
		<input type="text" name="email" class="input" id="email" placeholder="이메일을 '@naver.com' 형식으로 입력해주세요.">
		
		<div class="title">주소</div>
		<input type="text" id="sample4_postcode" class="input" placeholder="우편번호" readonly onclick="sample4_execDaumPostcode()">
		<input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" class="input" placeholder="도로명주소" readonly>
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" class="input" placeholder="상세주소">
		<input type="hidden" name="address" class="input" id="address">
		
		<div id="login_btns">
			<input type="button" value="회원가입" onclick="check();" class="login_btn">
			<input type="button" value="취소" onclick="location.href='/walkpet/index'" class="login_btn">
		</div>
	</form>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/walkpet/resources/js/jquery.min.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } 
                else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
  
	//주소
	var addr1 = $('#sample4_postcode');
	var addr2 = $('#sample4_roadAddress');
	var addr3 = $('#sample4_detailAddress');

	addr3.blur(function() {
		$('#address')
				.val(addr1.val() + ', ' + addr2.val() + ', ' + addr3.val());
	});
	
	
	
	//유효검사

	//아이디 중복체크
	function idCheck() {
		if($('#memId').val() == ''){
			alert('아이디를 입력하세요.');
		} else {
			$.ajax({
				type : 'POST',
				url : '/walkpet/member/idCheck',
				data : {
					id : $('#memId').val()
				},
				success : function(result) {
					if (result == 1) {
						$('#result').text('');
						$('#result').text('이미 사용중인 아이디입니다.').css('color', 'tomato')
								.css('font-size', '.7rem');

					} else {
						$('#result').text('');
						$('#result').text('사용 가능한 아이디입니다.').css('color',
								'cornflowerblue').css('font-size', '.7rem');

					}
				},

				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}
		
	}

	//비밀번호 확인
	$('#pwcheck').blur(
			function() {
				if ($('#pw').val() != $('#pwcheck').val()) {
					$('#pwComment').text('비밀번호가 동일하지 않습니다.').css('color',
							'tomato').css('font-size', '.7rem');
					$('#pwcheck').val("").focus();
				} else {
					$('#pwComment').text('비밀번호가 동일합니다.').css('color',
							'cornflowerblue').css('font-size', '.7rem');
				}
			});
	
	
	function check(){
		
		var leg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		
		if($('#name').val() == ''){
			alert('이름을 입력하세요.');
			$('#name').focus();
		}
		else if($('#memId').val() == ''){
			alert('아이디를 입력하세요.');
			$('#memId').focus();
		}
		else if($('#result').text() == ''){
			alert('아이디 중복확인을 해주세요.');
		}
		else if($('#result').text() == '이미 사용중인 아이디입니다.'){
			alert('아이디 중복확인을 해주세요.');
		}
		else if($('#pw').val() == ''){
			alert('비밀번호를 입력하세요.');
			$('#pw').focus();
		}
		else if(!leg.test($('#pw').val())){
			alert('비밀번호는 영어, 숫자, 특수문자 조합으로 8~25자리내로 입력하세요.');
			$('#pw').focus();
		}
		else if($('#pwcheck').val() == ''){
			alert('비밀번호를 재입력하세요.');
			$('#pwcheck').focus();
		}
		else if($('#pwComment').text() == ''){
			alert('비밀번호를 재입력하세요.');
			$('#pwcheck').focus();
		}
		else if($('#pwComment').text() == '비밀번호가 동일하지 않습니다.'){
			alert('비밀번호를 재입력하세요.');
			$('#pwcheck').focus();
		}
		else if($('#tel').val() == ''){
			alert('연락처를 입력하세요.');
			$('#tel').focus();
		}
		else if($('#tel').val().length < 13 || $('#tel').val().length > 13){
			alert('연락처는 13자로 입력하세요.');
			$('#tel').focus();
		}
		else if(!$('#tel').val().includes('-')){
			alert("'-'을 추가해주세요.");
			$('#tel').focus();
		}
		else if($('#jumin').val().length < 14 || $('#jumin').val().length > 14){
			alert('주민등록번호는 14자로 입력하세요.');
			$('#jumin').focus();
		}
		else if($('#jumin').val() == ''){
			alert('주민등록번호를 입력하세요.');
			$('#jumin').focus();
		}
		else if(!$('#jumin').val().includes('-')){
			alert("'-'을 추가해주세요.");
			$('#jumin').focus();
		}
		else if($('#email').val() == ''){
			alert('이메일을 입력하세요.');
			$('#email').focus();
		}
		else if(!$('#email').val().includes('@') || !$('#email').val().includes('.')){
			alert('@naver.com 형식으로 입력하세요.');
			$('#email').focus();
		}
		else if($('#sample4_postcode').val() == '' || $('#sample4_roadAddress').val() == '' || $('#sample4_detailAddress').val() == ''){
			alert('주소를 입력하세요.');
			$('#sample4_detailAddress').focus();
		} else {
			signup.submit();
		}
		
	}
</script>