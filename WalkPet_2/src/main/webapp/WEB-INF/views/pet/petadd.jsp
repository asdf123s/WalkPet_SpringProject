<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>

	<!-- petadd.jsp -->
	<section id="pet">
	
		<h2>반려동물 등록하기 ✨</h2>
		
		<hr>
		
		<form method="POST" action="/walkpet/pet/petaddok" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${sessionId}">
		<table>
			<tr>
				<th>사진</th>
				<td>
					<div id="attachZone"></div>
					<input type="file" name="attach" id="attach" class="file">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="petName" placeholder="아이의 이름을 입력해주세요" required>
				</td>
			</tr>
			<tr>
				<th>종</th>
				<td>
					<input type="text" name="petType" placeholder="아이의 종을 입력해주세요 예)강아지,고양이" required>
				</td>
			</tr>
			<tr>
				<th>품종</th>
				<td>
					<input type="text" name="petVar" placeholder="아이의 품종을 입력해주세요 예)말티즈,푸들" required>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="petGender" value="m" checked> 남 
					<input type="radio" name="petGender" value="f"> 여 
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="number" class="number" name="petAge" min=1 max=50 required>
				</td>
			</tr>
			<tr>
				<th>특징</th>
				<td>
					<input type="text" name="petChar" placeholder="아이의 특징을 입력해주세요" required>
				</td>
			</tr>
		</table>
		
		<div class="btns">
			<input type="button" value="돌아가기" onclick="location.href='../index';">
			<input type="submit" value="등록하기">
		</div>
		
		</form>
	
	</section>
	
	<script>
	
	</script>