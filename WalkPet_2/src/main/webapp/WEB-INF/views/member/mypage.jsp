<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
	.mypagefirst {
		width: 1100px;
		height: auto;
		padding-top: 30px;
		padding-bottom: 50px;
		display: flex;
		justify-content: center;
	}
	
	.mypagefirstleft {
		margin-left: 100px;
	}
	
	.mypagefirstright {
		margin: 0 100px;
	}
	
	.petupdatebtn {
		margin-top: 30px;
		margin-bottom: 10px;
		margin-left: 5px;
	}
	
	.mypagesecond {
		width: 1100px;
		height: auto;
		padding-bottom: 50px;
		display: flex;
		justify-content: center;
		border-bottom: 1px solid #E5E4E2;
	}
	
	.mypagesecondbtn {
		margin: 0 10px;
	}
	
	.search-item-img-mypage {
		background-color: #DDD;
		width: 100px;
		height: 100px;
		display: flex;
		align-items: center;
		margin-left: 20px;
		border-radius:50%;
		overflow:hidden;
	}
	
	.mypagethird {
		width: 1100px;
		height: auto;
		padding-top: 30px;
		padding-bottom: 50px;
		display: flex;
		justify-content: center;
	}
	
	.mypagebtns {
		display: flex;
		justify-content: center;
	}
	
	.wishtable {
		width: 1000px;
	}
	
	.boardtable {
		width: 1000px;
	}
	
	.reviewtable {
		width: 1000px;
	}
	
	#putupdatebtn {
		border-radius: 10px!important;
		background-color: white!important;
		color: gray!important;
		box-shadow: inset 0 0 0 2px gray!important;
	}
	
	#putupdatebtn:hover {
		background-color: gray!important;
		color: white!important;
	}
	
	#mypagesecondbtn {
		border-radius: 10px;
		background-color: white;
		color: gray!important;
		box-shadow: inset 0 0 0 2px #D8D8D8!important;
	}
	
	#mypagesecondbtn:hover {
		background-color: #D8D8D8;
		color: white!important;
	}
	.search-item-img-mypage img{
	width:100%;
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
		<h2>${sessionName}??? ???????????????</h2> 
	</header>

	<!-- Content -->
	<h2 id="content"></h2>
	<hr>
	<div class="row">
		<div class="mypagefirst">
			<div class="mypagefirstleft">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;[ ???????????? ]</h3>
				<div class="search-item-img-mypage">
					<img src="/walkpet/resources/images/${petimg}">
				</div>
				<form method="POST" action="/walkpet/member/petinfoupdate"><input class="petupdatebtn" id="putupdatebtn" type="submit" value="???????????? ?????? ??????"></form>
			</div>
			<div class="mypagefirstright">
				<h3>&nbsp;&nbsp;&nbsp;[ ${sessionName}??? ]</h3>
				<br>
				<p>????????? ?????? ??? : ${boardlistsize}</p>
				<p>?????? ?????? ???: ${reviewlistsize}</p>
				<p>??? ???: ${wishlistsize}</p>
			</div>
		</div>
		
		<div class="mypagesecond">
			<div class="mypagebtns">
				<form method="POST" action="/walkpet/member/note"><input class="mypagesecondbtn" id="mypagesecondbtn" type="submit" value="?????????"></form>
				<form method="POST" action="/walkpet/member/petdiary"><input class="mypagesecondbtn" id="mypagesecondbtn" type="submit" value="???????????? ????????????"></form>
				<input class="mypagesecondbtn" id="mypagesecondbtn" type="submit" value="???????????? ??????">
			</div>
		</div>
		
		
		<!-- Break -->
		<div class="mypagethird">
			<div class="col-4 col-12-medium">
				<h3>??? ??????</h3>
				<table class="wishtable">
					<tr>
						<th>??????</th>
						<th>??????</th>
						<th>????????????</th>
						<th>????????????</th>
					</tr>
					<c:forEach items="${wishlist}" var="dto">
					<tr>
						<td>${dto.shopName}</td>
						<td>${dto.shopAddress}</td>
						<td>${dto.tel}</td>
						<td>${dto.hours}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div class="mypagethird">
			<div class="col-4 col-12-medium">
				<h3>????????? ???</h3>
				<table class="boardtable">
					<tr>
						<th>????????????</th>
						<th>??????</th>
						<th>????????????</th>
						<th>?????????</th>
					</tr>
					<c:forEach items="${boardlist}" var="dto">
					<tr>
						<td>${dto.boardCategory}</td>
						<td>${dto.subject}</td>
						<td>${dto.regdate}</td>
						<td>${dto.viewCnt}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		
		<div class="mypagethird">
			<div class="col-4 col-12-medium">
				<h3>????????? ??????</h3>
				<table class="reviewtable">
					<tr>
						<th>??????</th>
						<th>??????</th>
						<th>????????????</th>
					</tr>
					<c:forEach items="${reviewlist}" var="dto">
					<tr>
						<td>${dto.shopName}</td>
						<td>${dto.reviewContent}</td>
						<td>${dto.regdate}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</section>
