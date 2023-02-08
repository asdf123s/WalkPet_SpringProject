<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<head>
<style>
	.writediv {
		width: 1039px;
		display: flex;
		justify-content: center;
		padding: 10px 0;
		margin-left: 110px;
	}
	#diarycontent {
		width: 900px;
		height: 300px;
		padding: 10px 10px;
	}
	.writebtn {
		width: 1039px;
		display: flex;
		justify-content: center;
		margin-left: 110px;
		margin-top: 50px;
	}
	.filebtn {
		width: 900px;
		height: 30px;
		margin-left: 180px;
	}
	#byname {
		font-size: small;
		font-weight: 900;
	}
</style>
</head>
<!-- Header -->
<header id="header">
	<a href="#" class="logo"><strong>성장일기 작성하기 <span id="byname">By${sessionName}</span> </strong></a>
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
	<div class="row">
		<form method="POST" action="/walkpet/member/diarywriteok" enctype="multipart/form-data">
		<div>
			<div class="writediv"><textarea id="diarycontent" name="diarycontent" placeholder="내용을 입력해주세요."></textarea></div>
			<div><input class="filebtn" type="file" name="attach"></div>
			<div class="writebtn"><input type="submit" value="작성하기">&nbsp;&nbsp;<input type="button" value="뒤로가기" onclick="location.href='/walkpet/member/petdiary';"></div>
		</div>
		</form>
	</div>
</section>