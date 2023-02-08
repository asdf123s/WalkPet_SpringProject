<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<head>
<style>
	.notefirst {
		width: 1100px;
		height: auto;
		padding-top: 30px;
		padding-bottom: 50px;
		display: flex;
		justify-content: center;
	}
	
	.notetable {
		width: 1000px;
		margin-left: 200px;
	}
	
	.backbtn {
		width: 1039px;
		display: flex;
		justify-content: center;
		padding: 10px 0;
		margin-left: 140px;
	}
	
	#noteback {
		border-radius: 10px;
		background-color: white;
		color: gray!important;
		box-shadow: inset 0 0 0 2px #D8D8D8!important;
	}
	
	#noteback:hover {
		background-color: #D8D8D8;
		color: white!important;
	}
	
</style>
</head>


<!-- Header -->
<header id="header">
	<a href="#" class="logo"><strong>MYPAGE</strong></a>
	<ul class="icons">
		<li><a href="#" class="icon brands fa-twitter"><span
				class="label">Twitter</span></a></li>
		<li><a href="#" class="icon brands fa-facebook-f"><span
				class="label">Facebook</span></a></li>
		<li><a href="#" class="icon brands fa-snapchat-ghost"><span
				class="label">Snapchat</span></a></li>
		<li><a href="#" class="icon brands fa-instagram"><span
				class="label">Instagram</span></a></li>
		<li><a href="#" class="icon brands fa-medium-m"><span
				class="label">Medium</span></a></li>
	</ul>
</header>

<section>

	<header class="main">
		<h2>${sessionName}님 쪽지함</h2> 
	</header>

	<!-- Content -->
	<h2 id="content"></h2>
	<hr>
	<div class="row">
		
		<div class="notefirst">
			<div class="col-4 col-12-medium">
				<table class="notetable">
					<tr>
						<th>발신자</th>
						<th>쪽지내용</th>
						<th>발신날짜</th>
					</tr>
					<c:forEach items="${notelist}" var="dto">
					<tr>
						<td>${dto.sendId}</td>
						<td>${dto.noteContent}</td>
						<td>${dto.regdate}</td>
					</tr>
					</c:forEach>
				</table>
				<div class="backbtn">
					<input type="button" id="noteback" value="뒤로가기" onclick="location.href='/walkpet/member/mypage';">
				</div>
			</div>
		</div>
	
	</div>
</section>