<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<head>
<style>
	.tablediv {
		width: 1100px;
		height: auto;
		padding-top: 30px;
		padding-bottom: 50px;
		justify-content: center;
	}
	
	.petinfotable {
		background-color: white!important;
		width: 1000px;
		height: 400px;
		margin-left: 150px;
	}
	
	.petinput {
		border: none!important;;
		background-color: transparent!important;
	}
	
	.pettd {
		width: 180px;
	}
	
	#petth {
		vertical-align: middle!important;
		text-align: center!important;
	}
	
	.updatebtn {
		margin-left: 500px;
	}
	
	#allputin {
		font-size: x-small
	}
	
	#petinfobackbtn {
		border-radius: 10px;
		background-color: white;
		color: gray!important;
		box-shadow: inset 0 0 0 2px #D8D8D8!important;
	}
	
	#petinfobackbtn:hover {
		background-color: #D8D8D8;
		color: white!important;
	}
	
	#petinfoupd {
		border-radius: 10px;
		background-color: white;
		color: gray!important;
		box-shadow: inset 0 0 0 2px gray!important;
	}
	
	#petinfoupd:hover {
		background-color: gray;
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
		<h2>${sessionName}님 반려동물 정보 수정</h2> 
	</header>

	<!-- Content -->
	<h2 id="content"></h2>
	<hr>
	<div class="row">
		<form method="POST" action="/walkpet/member/petinfoupdateok">
		<c:forEach items="${petinfolist}" var="dto">
		<div class="tablediv">
			<table class="petinfotable">
				<tr>
					<th colspan='2' id="petth">반려동물 정보 <span id="allputin">&nbsp;&nbsp;(*모두 채워주시기 바랍니다.)</span></th>
				</tr>
				<tr>
					<td class="pettd">반려동물 이름: </td>
					<td><input type="text" class="petinput" id="petname" name="petname" placeholder="${dto.petName}"></td>
				</tr>
				<tr>
					<td class="pettd">반려동물 품종: </td>
					<td><input type="text" class="petinput" id="petvar" name="petvar" placeholder="${dto.petVar}"></td>
				</tr>
				<tr>
					<td class="pettd">반려동물 성별: </td>
					<td><input type="text" class="petinput" id="petgender" name="petgender" placeholder="${dto.petGender}"></td>
				</tr>
				<tr>
					<td class="pettd">반려동물 나이: </td>
					<td><input type="text" class="petinput" id="petage" name="petage" placeholder="${dto.petAge}"></td>
				</tr>
				<tr>
					<td class="pettd">반려동물 특징: </td>
					<td><input type="text" class="petinput" id="petchar" name="petchar" placeholder="${dto.petChar}"></td>
				</tr>
			</table>
			<div class="updatebtn">
				<input type="submit" id="petinfoupd" value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="petinfobackbtn" value="돌아가기" onclick="location.href='/walkpet/member/mypage';">
			</div>
		</div>
		</c:forEach>
		</form>
	</div>
	
</section>