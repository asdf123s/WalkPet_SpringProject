<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<form method="POST" action="/walkpet/member/findIdOk">
	<div id="login_area">
		<h1 id="login_title">아이디 찾기</h1>
		<div id="login_idpw">
			<input type="text" name="name" class="input" placeholder="이름을 입력해주세요.">
			<input type="password" name="jumin" class="input" placeholder="OOOOOO-OOOOOOO형식으로 입력해주세요.">
		</div>
		<div id="login_btns" style="margin-top: 20px;">
			<input type="button" value="아이디 찾기" class="login_btn" onclick="check();">
			<input type="button" value="취소" onclick="history.back();" class="login_btn">
		</div>
	</div>
</form>

<script>

	function check() {
		if ($('input[type=text]').val() == '') {
			alert('이름을 입력하세요.');
			$('input[type=text]').focus();
		} else if ($('input[type=password]').val() == '') {
			alert('주민번호를 입력하세요.');
			$('input[type=password]').focus();
		} else {
			$('form').submit();
		}
	}
</script>