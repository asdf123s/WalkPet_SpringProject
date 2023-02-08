<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section>
	<header class="main">
		<h2>${dto.subject }</h2>
	</header>
	<c:forEach items="${imgList }" var="idto">
		<c:if test="${idto.boardSeq == dto.boardSeq }">
			<img src="/walkpet/resources/images/${idto.imgName }" alt=""
				style="max-height: 300px; margin-bottom:30px;" />
		</c:if>
	</c:forEach>

	

	<p>${dto.content }</p>
	
	<hr class="major" />
	
<div class="admin_user_btn">
	<button class="admin_userdel_btn" onclick="del('${dto.boardSeq}');">삭제하기</button>
</div>

<script>
	function del(seq){
		if(confirm("탈퇴시겠습니까?")){
			location.href='/walkpet/admin/boardDel?seq=' + seq;
		}
	};
</script>