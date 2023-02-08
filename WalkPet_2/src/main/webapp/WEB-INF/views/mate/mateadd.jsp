<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>

<!-- mateadd.jsp -->
<section id="mate">
	
	<header class="major">
		<h2>산책 동반인 모집 글쓰기 ✏️</h2>
	</header>
	
	
	<form method="POST" action="/walkpet/mate/mateaddok" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${sessionId}">
		<table>
			<tr>
				<th class="th">모집상태</th>
				<td>
					<select name="periodState" required>
<!-- 						<option>모집상태선택</option> -->
						<option value="y" >모집중</option>
						<option value="n" >모집종료</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="th">산책 지역</th>
				<td>
<!-- 					<input type="text" name="areaName" placeholder="산책할 지역을 입력해주세요 예)강남구" required> -->
					<select name="areaName" required>
						<option value="가평군" >가평군</option>
						<option value="강남구" >강남구</option>
						<option value="강동구" >강동구</option>
						<option value="강북구" >강북구</option>
						<option value="강서구" >강서구</option>
						<option value="고양시" >고양시</option>
						<option value="과천시" >과천시</option>
						<option value="관악구" >관악구</option>
						<option value="광명시" >광명시</option>
						<option value="광주시" >광주시</option>
						<option value="광진구" >광진구</option>
						<option value="구로구" >구로구</option>
						<option value="구리시" >구리시</option>
						<option value="군포시" >군포시</option>
						<option value="금천구" >금천구</option>
						<option value="김포시" >김포시</option>
						<option value="남양주시" >남양주시</option>
						<option value="노원구" >노원구</option>
						<option value="도봉구" >도봉구</option>
						<option value="동대문구" >동대문구</option>
						<option value="동두천시" >동두천시</option>
						<option value="동작구" >동작구</option>
						<option value="마포구" >마포구</option>
						<option value="부천시" >부천시</option>
						<option value="서대문구" >서대문구</option>
						<option value="서초구" >서초구</option>
						<option value="성남시" >성남시</option>
						<option value="성동구" >성동구</option>
						<option value="성북구" >성북구</option>
						<option value="송파구" >송파구</option>
						<option value="수원시" >수원시</option>
						<option value="시흥시" >시흥시</option>
						<option value="안산시" >안산시</option>
						<option value="안양시" >안양시</option>
						<option value="양주시" >양주시</option>
						<option value="양천구" >양천구</option>
						<option value="양평군" >양평군</option>
						<option value="여주시" >여주시</option>
						<option value="연천군" >연천군</option>
						<option value="영등포구" >영등포구</option>
						<option value="오산시" >오산시</option>
						<option value="용산구" >용산구</option>
						<option value="용인시" >용인시</option>
						<option value="은평구" >은평구</option>
						<option value="의왕시" >의왕시</option>
						<option value="의정부시" >의정부시</option>
						<option value="이천시" >이천시</option>
						<option value="종로구" >종로구</option>
						<option value="중구" >중구</option>
						<option value="중랑구" >중랑구</option>
						<option value="파주시" >파주시</option>
						<option value="평택시" >평택시</option>
						<option value="포천시" >포천시</option>
						<option value="하남시" >하남시</option>
						<option value="화성시" >화성시</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="th">제목</th>
				<td>
					<input type="text" name="mateSubject" placeholder="제목을 입력해주세요" required>
				</td>
			</tr>
			<tr>
				<th class="th">내용</th>
				<td>
					<textarea name="mateContent" placeholder="내용을 입력해주세요" required rows="5" cols="5"></textarea>
				</td>
			</tr>
			<tr>
				<th class="th">파일</th>
				<td>
					<div id="attachZone"></div>
					<input type="file" name="attach" id="attach" class="file">
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th class="th">태그</th>	 -->
<!-- 				<td> -->
<!-- 					<input type="text" name="tagName" id="tag" required > -->
<!-- 				</td> -->
<!-- 			</tr> -->
		</table>
		
		<div class="btns">
			<input type="button" value="돌아가기" onclick="location.href='/walkpet/mate/matelist';">
			<input type="submit" value="쓰기">
		</div>
		
		</form>

</section>


<!-- <script src="../resources/js/jQuery.tagify.min.js"></script> -->
<script src="/walkpet/resources/js/jQuery.tagify.min.js"></script>

<script>

$('#tag').tagify();

</script>









