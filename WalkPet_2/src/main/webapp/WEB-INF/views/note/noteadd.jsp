<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>

<!-- mateadd.jsp -->
<section id="mate">
	
	<header class="major">
		<h2>쪽지 보내기 💌</h2>
	</header>
	
	
	<form method="POST" action="/walkpet/note/noteaddok">
	<input type="hidden" name="id" value="${sessionId}">
		<table>
			<tr>
				<th class="th">보내는 사람</th>
				<td>
					<input type="text" name="sendId" placeholder="보내는 사람을 입력해주세요" required>
				</td>
			</tr>
			<tr>
				<th class="th">내용</th>
				<td>
					<textarea name="noteContent" placeholder="내용을 입력해주세요" required rows="5" cols="5"></textarea>
				</td>
			</tr>
		</table>
		
		<div class="btns">
			<input type="button" value="돌아가기" onclick="location.href='/walkpet/mate/matelist?mateseq=${mdto.mateSeq}';">
			<input type="submit" value="보내기">
		</div>
		
		</form>

</section>








