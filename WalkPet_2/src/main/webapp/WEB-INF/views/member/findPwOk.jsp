<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="login_area">
	<c:if test="${not empty dto }">
		<h1 id="login_title" style="text-align: center;">비밀번호 찾기</h1>
		<p style="text-align: center;">${dto.name }님의 비밀번호는 '${dto.pw }'입니다.</p>
		<div id="login_btns" style="margin-top: 20px;">
			<input type="button" value="로그인" onclick="location.href='/walkpet/member/login'" class="login_btn">
			<input type="button" value="아이디 찾기" onclick="location.href='/walkpet/member/findId'" class="login_btn">
		</div>
	</c:if>
	
	<!--  -->
	<c:if test="${empty dto }">
		<script>
			alert('존재하지 않는 정보입니다.');
			
			history.back();
		</script>
	</c:if>
</div>