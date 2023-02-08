<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<header class="major">
		<h2>유저관리</h2>
	</header>
	<div class="posts">
		<c:forEach items="${memberList }" var="dto">
			<article>
				<a href="/walkpet/admin/userDetail?id=${dto.id }" class="image" style="height: 300px;"><img
					src="/walkpet/resources/images/dog1.png" alt="" /></a>
				<h3>
					${dto.id } <small><c:if test="${dto.state eq 'y' }">활동중</c:if><c:if test="${dto.state eq 'n' }">탈퇴</c:if></small>
				</h3>
				<p>${dto.email }</p>
				<p>
					<c:if test="${dto.gender eq 'f' }">여자</c:if>
					<c:if test="${dto.gender eq 'm' }">남자</c:if>
				</p>
				<p>${dto.tel }</p>
				<p>${dto.address }</p>
				<ul class="actions">
					<li><a href="/walkpet/admin/userDetail?id=${dto.id }" class="button">More</a></li>
				</ul>
			</article>
		</c:forEach>
		
	</div>
</section>