<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article style="width: 70%; margin: 30px auto;" id="article">
	<h3>
		${dto.id }(${ dto.name}) <small><c:if test="${dto.state eq 'y'}">활동중</c:if><c:if test="${dto.state eq 'n'}">탈퇴</c:if></small>
	</h3>
	<table id="admin_tbl">
		<tr>
			<td>이메일 : ${dto.email }</td>
			<td>성별 : <c:if test="${dto.gender eq 'f' }">여자</c:if><c:if test="${dto.gender eq 'm' }">남자</c:if></td>
		</tr>
		<tr>
			<td>주민번호 : ${dto.jumin }</td>
			<td>패스워드 : ${dto.pw }</td>
		</tr>
	</table>
</article>
<div class="admin_cards">
	<c:forEach items="${petList}" var="dto">
	<div class="admin_card">
		<div class="admin_card_img">
			<img src="/walkpet/resources/images/${dto.petImgName }">
		</div>
		<div class="admin_card_bottom">
			<div class="admin_card_bt_name">
				<h3>${dto.petName }(${dto.petAge }살)</h3>
			</div>
			<div class="admin_card_bt_age"><c:if test="${dto.petGender eq 'm' }">남자</c:if><c:if test="${dto.petGender eq 'f' }">여자</c:if></div>
			<div class="admin_card_bt_introduce">${dto.petChar }</div>
		</div>
	</div>
	</c:forEach>


</div>

<div class="admin_user_btn">
	<button class="admin_userdel_btn" onclick="del('${dto.id}');">탈퇴하기</button>
</div>

<script>
	function del(id){
		if(confirm("탈퇴시겠습니까?")){
			location.href='/walkpet/admin/userDel?id=' + ${dto.id};
		}
	};
</script>