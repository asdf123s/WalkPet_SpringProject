<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header id="header">
	<h2 style="margin-bottom: 0; display:inline-block"><strong>${sessionId }</strong> 관리자님</h2> 
</header>

<h3 style="display:inline-block; margin-top:30px;">유저관리</h3>
<small>더보기</small>
<div class="admin_cards">
	<c:forEach items="${memberList}" var="dto">
		<div class="admin_card">
			<div class="admin_card_bottom">
				<div class="admin_card_bt_name">
					<h3>
						${dto.name } <small><c:if test="${dto.state eq 'y' }">활동중</c:if>
							<c:if test="${dto.state eq 'n' }">탈퇴</c:if></small>
					</h3>
				</div>
				<div class="admin_card_bt_age">${dto.email }</div>
				<div class="admin_card_bt_introduce">${dto.address }</div>
				<div class="admin_card_bt_introduce">${dto.tel }</div>
			</div>
			<button onclick="location.href='/walkpet/admin/userDetail?id=${dto.id}'" style="margin-top:30px;">View</button>
		</div>
	</c:forEach>


</div>


<h3 style="display:inline-block; margin-top:30px;">게시판관리</h3>
<div class="admin_cards">
	<c:forEach items="${boardList}" var="dto" begin="0" end="3" varStatus="status" step="1">
		<div class="admin_card">
			<div class="admin_card_bottom">
				<div class="admin_card_bt_name">
					<h3>${dto.subject}</h3>
					<h3>
						${dto.id }
					</h3>
				</div>
				<div class="admin_card_bt_age">${dto.content }</div>
				<div class="admin_card_bt_introduce">${dto.regdate }</div>
			</div>
			<button onclick="location.href='/walkpet/admin/boardDetail?seq=${dto.boardSeq}'" style="margin-top:30px;">View</button>
		</div>
	</c:forEach>


</div>