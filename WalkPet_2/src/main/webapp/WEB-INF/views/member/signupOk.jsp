<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:if test="${result == 1}">  
<div id="login_area">
	<h1 id="login_title" style="text-align: center">회원가입 완료</h1>
	<p style="text-align: center">환영합니다 ${dto.name }님</p>
	<div id="login_btns">
		<input type="button" value="홈" class="login_btn" onclick="location.href='/walkpet/index'">
		<input type="button" value="로그인" class="login_btn" onclick="location.href='/walkpet/member/login'">
	</div>
	
</div>

</c:if>
<c:if test="${result == 0}">
<script>
	alert('회원가입에 실패했습니다.');
	history.back;
</script>
</c:if>