<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>

	<!-- matelist.jsp -->
	<section>
	
	<header class="major">
		<h2>산책 동반인 모집 💌</h2>
	</header>
	
	<div class="posts">
	
		<c:forEach items="${list}" var="mdto">
			<article>
<!-- 				이미지부분 -->
				<c:forEach items="${mdto.files}" var="mfdto">
					<a href="/walkpet/mate/mateview?mateSeq=${mdto.mateSeq}" class="image">
						<img style="height: 200px;" src="/walkpet/resources/images/${mfdto.mateImgName}" />
					</a>
				</c:forEach>
				<a href="/walkpet/mate/mateview?mateSeq=${mdto.mateSeq}">
				<span style="color: #666;">${mdto.startDate} ~ ${mdto.endDate}</span>
				<h3>${mdto.mateSubject}</h3> 
				<h5>모집상태: ${mdto.periodState}</h5>
				<h5>희망지역: ${mdto.areaName}</h5>
<%-- 				<p style="color: #666;">${mdto.mateContent}</p> --%>
				</a>
				
<!-- 				글 작성한 사람의 반려동물 정보 보여주기 -->
				<c:forEach items="${pdto.id}" var="pdto">
					<p>이름${pdto.petName}</p>
				</c:forEach>
				
			</article>
		</c:forEach>
		
		
	</div>
	
	
	<div class="add">
		<input type="button" value="글쓰기" class="write" onclick="location.href='/walkpet/mate/mateadd';">
	</div>
	
	
</section>