<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>

	<!-- mateview.jsp -->
	<section id="mate">
	
	<header class="major">
		<h4>모집상태: ${mdto.periodState }</h4>
	</header>
	
	<div class="content">
		<div class="title">
			<h2>${mdto.mateSubject}</h2>
			<p>${mdto.startDate} ~ ${mdto.endDate}</p>
		</div>
	</div>
	
		<div class="txt">
<!-- 		이미지부분 -->
			<c:forEach items="${mdto.files}" var="mfdto">
				<img style="height: 400px;" src="/walkpet/resources/images/${mfdto.mateImgName}">
			</c:forEach>
			
<!-- 			지역이름 -->
			<h3>희망지역: ${mdto.areaName }</h3>
			
			<p>${mdto.mateContent}</p>
			
			<hr>
			
			<div class="info">
				<h3>💌${mdto.id}님의 반려동물</h3>
				<c:forEach items="${petInfo}" var="mdto">
				<table class="petinfo">
				<tbody>
					<tr>
						<th>종류</th>
						<td>${mdto.petType }</td>
					</tr>
					<tr>
						<th>종</th>
						<td>${mdto.petVar }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${mdto.petName }</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${mdto.petGender }</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>${mdto.petAge }</td>
					</tr>
					<tr>
						<th>특징</th>
						<td>${mdto.petChar }</td>
					</tr>
				</tbody>
				</table>
				</c:forEach>
			</div>
			
			<hr>
			
			
		</div>
	
		<div>
<!-- 			글 작성한 사람의 반려동물 정보 보여주기 -->
		</div>
		
		<div class="btns">
			<input type="button" value="돌아가기" onclick="location.href='/walkpet/mate/matelist';">
			<input type="button" value="쪽지보내기"  onclick="location.href='/walkpet/note/noteadd';">
		</div>
	
	</section>
	
	<script>
	
	</script>