<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<header class="major">
		<h2>
			${type }
		</h2>
	</header>
	<div class="admin_board_search_wrap">
		<form method="GET" action="/walkpet/admin/boardList" class="admin_board_search">
		<input type="hidden" name="boardCategory" value="${type }">
		<input type="text" name="word" id="admin_board_search_txt">
		<input type="submit" value="검색">
		</form>
	</div>
	<div class="posts">
	<c:forEach items="${list }" var="dto">
		<article>
		<div class="admin_board_img" style="display:flex;">
		<c:forEach items="${imgList }" var="idto">
		<c:if test="${idto.boardSeq == dto.boardSeq }">
			<a href="/walkpet/admin/boardDetail?seq=${dto.boardSeq }" class="image"><img src="/walkpet/resources/images/${idto.imgName }"
				alt="" style="max-height:300px;"/></a>
		</c:if>
		</c:forEach>
		</div>
			<h3>${dto.subject }</h3><h5>${dto.regdate }</h5>
			<p>${dto.content }</p>
			<ul class="actions">
				<li><a href="/walkpet/admin/boardDetail?seq=${dto.boardSeq }" class="button">More</a></li>
			</ul>
		</article>
	</c:forEach>
	</div>
	
	<div class="pagebarWrap">
	<div class="pagebar">
	${pagebar }
	</div>
	</div>
</section>
