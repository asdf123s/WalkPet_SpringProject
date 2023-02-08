<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/walkpet/resources/css/board.css"/>

				<section>
					<header class="major">
						<h2>강아지 게시판🐶</h2>
					</header>
					
					<div id="write">
						<input style="float:right; margin-bottom:50px;" type="button" value="글쓰기" onclick="location.href='/walkpet/board/add';">
					</div>
					
					<div class="posts">
						<c:forEach items="${dogBoard}" var="dto"> 
						<article>
							<a href="/walkpet/board/boardDetail.do?boardSeq=${dto.boardSeq}" class="image"><img
								src="../resources/images/${dto.imgName}" onerror=this.src="../resources/images/pet.jpg" alt="" /></a>
							<h3>${dto.subject}</h3>
							<p>${dto.content} <br><br> 작성일 : ${dto.regdate}<br> 조회수 : ${dto.viewCnt }</p>
							<ul class="actions">
								<li><a href="/walkpet/board/boardDetail.do?boardSeq=${dto.boardSeq}" class="button">자세히 보기</a></li>
							</ul>
						</article>
						</c:forEach> 
						
						
					</div>
				</section>