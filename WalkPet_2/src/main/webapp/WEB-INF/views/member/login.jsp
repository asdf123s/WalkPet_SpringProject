<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- login.jsp -->
	
	<form method="POST" action="/walkpet/member/loginok">
		<div id="login_area">
			<h1 id="login_title">로그인</h1>
			
			<div id="login_idpw">
				<input type="text" name="id" class="input" placeholder="아이디">
				<input type="password" name="pw" class="input" placeholder="비밀번호">
			</div>
			
			<div id="login_etc">
				<a href="/walkpet/member/findId">아이디 찾기</a> / <a href="/walkpet/member/findPw">비밀번호 찾기</a> / <a href="/walkpet/admin/login">관리자 로그인</a>
			</div>
			
			<div id="login_btns">
				<input type="button" value="로그인" class="login_btn" id="login_btn" onclick="check();">
				<input type="button" value="회원가입" id="sign_btn" class="login_btn" onclick="location.href='/walkpet/member/signup'">
			</div>
		</div>
		
		
	</form>
	
	
<script>
	function check(){
		if($('input[type=text]').val() == ''){
			alert('아이디를 입력하세요.');
			$('input[type=text]').focus();
		} else if($('input[type=password]').val() == ''){
			alert('비밀번호를 입력하세요.');
			$('input[type=password]').focus();
		} else {
			$('form').submit();
		}
	}
</script>