<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>WalkPet</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/walkpet/resources/css/main.css" />
<link rel="stylesheet" href="/walkpet/resources/css/shopDetail.css">
<link rel="stylesheet" href="/walkpet/resources/css/hansol.css">
<link rel="stylesheet" href="/walkpet/resources/css/place.css">
<link rel="stylesheet" href="/walkpet/resources/css/board.css">
<script src="https://kit.fontawesome.com/e31c434757.js"
	crossorigin="anonymous"></script>
<style>
.search-item-name div:first-child {
	color: gray;
	font-size: 14px;
	margin: 5px;
}

.search-item-name div:nth-child(2) {
	font-weight: bold;
	font-size: 15px;
	margin: 5px;
	color: black;
}

.search-item-btn button {
	background-color: #fff;
	border: solid 1.3px black;
	border-radius: 20px;
	width: 100px;
	height: 40px;
	font-weight: bold;
	cursor: pointer;
	transition: color 0.15s ease-in-out, background-color 0.15s;
}

.search-item-btn button:hover {
	background-color: #28a745;
	color: white;
	border-color: #28a745;
}

.search-item-img img {
	width: 100px;
}

.search-item-img {
	background-color: #DDD;
	width: 100px;
	height: 100px;
	display: flex;
	align-items: center;
	margin-right: 20px;
	border-radius: 50%;
	overflow:hidden;
}

.search-item {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 200px;
	margin: 20px auto;
}

#search {
	max-height: 300px;
	overflow: auto;
}

.search-plus {
	width: 100px;
	height: 100px;
	text-align: center;
	font-size: 2rem;
	line-height: 98px;
	cursor: pointer;
	color: gray;
	border: 2px solid gray;
	background-color: transparent;
	border-radius: 50%;
}

.search-plus-wrap {
	background-color: transparent;
}

.pet-add {
	color: black !important;
	font-weight: bold;
}

header.major > :last-child {
	border: none;
}

.left_title {
	display: inline-block;
	margin-right: 10px;
}

.icon {
	font-size: 18px;
	cursor: pointer;
}

#mate > .content {
	border: none;
}

.left_title > span {
	cursor: pointer;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<tiles:insertAttribute name="content"></tiles:insertAttribute>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
			
			
			<c:if test="${not empty sessionId and sessionId ne 'admin'}">
				<header class="major" style="border-bottom:none; margin:0px;">
					<h2 class="left_title">
						<span style="color: #f56a6a;" onclick="location.href='/walkpet/member/mypage'">${sessionId }</span>님 반려동물 정보</h2>
					<c:if test="${not empty note}">
					<form method="POST" action="/walkpet/member/note" class="note_form">
						<div class="icon" onclick="note_submit();"><i class="fas fa-bell"></i></div>
					</form>
					</c:if>
					<c:if test="${empty note }">
					<form method="POST" action="/walkpet/member/note" class="note_form">
						<div class="icon" onclick="note_submit();"><i class="far fa-bell"></i></div>
					</form>
					</c:if>
				</header>
				
				
				<section id="search" class="alt">
				
					<!-- 강아지 정보 -->
					
					<c:forEach items="${petdto}" var="dto">
					<div class="search-item search-add-items">
						<input type="hidden" name="productSeq" value="\${item.productSeq}">
						<div class="search-item-img">
							<img src="/walkpet/resources/images/${dto.petImgName}">
						</div>
						<div class="search-item-name">
							<div>${dto.petType }</div>
							<div>${dto.petName }</div>
						</div>
					</div>
					</c:forEach>
					
					<div class="search-item search-add-items">
						<input type="hidden" name="productSeq" value="\${item.productSeq}">
						<div class="search-item-img search-plus-wrap">
						<div class="search-plus" onclick="location.href='/walkpet/pet/petadd'">
							+
						</div>
						</div>
						<div class="search-item-name">
							<div class="pet-add">등록하기</div>
						</div>
					</div>
					
					
				</section>
				</c:if>

				
				<!-- Menu -->
				<c:if test="${sessionId != 'admin' }">
					<nav id="menu">
						<header class="major">
							<a href="/walkpet/index"><h2>WalkPet</h2></a>
						</header>
						<ul>
							<li><span class="opener">커뮤니티</span>
								<ul>
									<li><a href="/walkpet/board/galary">반려동물 갤러리</a></li>
									<li><a href="/walkpet/board/dogBoard">강아지</a></li>
									<li><a href="/walkpet/board/catBoard">고양이</a></li>
									<li><a href="/walkpet/board/friendsBoard">다른 친구들</a></li>
								</ul></li>
							<li><span class="opener">아이들과 함께</span>
								<ul>
									<li><a href="/walkpet/place/cafe">카페</a></li>
									<li><a href="/walkpet/place/food">음식점</a></li>
									<li><a href="/walkpet/place/shopping">쇼핑몰</a></li>
									<li><a href="/walkpet/place/beauty">미용</a></li>
									<li><a href="/walkpet/place/accommodation">숙소</a></li>
								</ul></li>
							<li><a href="/walkpet/mate/matelist">산책 동반인 모집</a></li>
							
							<li><a href="/walkpet/member/petdiary">반려동물 성장 일기</a></li>
							<c:if test="${empty sessionId }">
							<li><a href="/walkpet/member/login">로그인</a></li>
							</c:if>
							<c:if test="${not empty sessionId }">
							<li><a href="/walkpet/member/logout">로그아웃</a></li>
							</c:if>
						</ul>
					</nav>
				</c:if>		
				<!-- Section -->
				<section>
					<header class="major">
						<h2>반려동물 성장일기</h2>
					</header>
					<div class="mini-posts">
						<c:if test="${empty sessionId}">
							<p>로그인 후에 이용이 가능합니다.</p>
							<input type="button" class="login" value="로그인" onclick="location.href='/walkpet/member/login'">
						</c:if>
					
						<c:if test="${empty diary && not empty sessionId}">
							<p>나만의 반려동물 성장 일기를 작성해보세요!</p>
							<input type="button" class="diary_write" value="글쓰기" onclick="diary_submit();">
						</c:if>
						<c:if test="${not empty sessionId && sessionId != 'admin' }">
						<c:forEach items="${diary }" var="diary">
							<article>
							<a href="#" class="image"><img
								src="/walkpet/resources/images/${diary.diaryImg}"></a>
							<p>${diary.diaryContent}</p>
							<p>${diary.regdate}</p>
						</article>
						</c:forEach>
						</c:if>
						
					</div>
					<c:if test="${not empty sessionId && not empty diary }">
					<ul class="actions">
						<li><a href="/walkpet/member/petdiary" class="button">More</a></li>
					</ul>
					</c:if>
				</section>

				<c:if test="${sessionId eq 'admin' }">
					<nav id="menu">
						<header class="major">
							<h2>Menu</h2>
						</header>
						<ul>
							<li><a href="/walkpet/admin/user">회원관리</a></li>
							<li><span class="opener">게시물관리</span>
								<ul>
									<li><a href="/walkpet/admin/boardList?boardCategory=반려동물 갤러리">반려동물 갤러리</a></li>
									<li><a href="/walkpet/admin/boardList?boardCategory=강아지">강아지</a></li>
									<li><a href="/walkpet/admin/boardList?boardCategory=고양이">고양이</a></li>
									<li><a href="/walkpet/admin/boardList?boardCategory=다른 친구들">다른 친구들</a></li>
								</ul></li>
							<li><a href="/walkpet/admin/logout">로그아웃</a></li>
						</ul>
					</nav>
				</c:if>
				
				

				<!-- Section -->
				<section>
					<header class="major">
						<h2>워크펫</h2>
					</header>
					<p></p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">walkpet@untitled.tld</a></li>
						<li class="icon solid fa-phone">(123) 010-0000-0000</li>
						<li class="icon solid fa-home">1234<br /> Nashville, TN
							00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. WalkPet
					</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="/walkpet/resources/js/jquery.min.js"></script>
	<script src="/walkpet/resources/js/browser.min.js"></script>
	<script src="/walkpet/resources/js/breakpoints.min.js"></script>
	<script src="/walkpet/resources/js/util.js"></script>
	<script src="/walkpet/resources/js/main.js"></script>
	
	
	<script>
		function note_submit(){
			$('.note_form').submit();
		}
		function diary_submit(){
			$('.diary_form').submit();
		}
	</script>

</body>
</html>