<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/walkpet/resources/css/board.css" />

<section>
	<div>
		<h2>${boardDetail.boardCategory }</h2>
		<table class="table table-strped"">

			<tbody>
				<tr>
					<td style="text-align: center;">글 제목</td>
					<td colspan="2">${boardDetail.subject }</td>
				</tr>
				<tr>
					<td style="text-align: center;">작성자</td>
					<td colspan="2">${boardDetail.id}</td>
				</tr>
				<tr>
					<td style="text-align: center; width: 200px;">작성일</td>
					<td colspan="2">${boardDetail.regdate }</td>
				</tr>
				<tr>
					<td style="text-align: center;">조회수</td>
					<td colspan="2">${boardDetail.viewCnt }</td>
				</tr>
				<tr>
					<td style="text-align: center; vertical-align: middle;">작성 내용</td>
					<td><img style="align:middle;"
								src="../resources/images/${boardDetail.imgName}" width="600" height="400" />
								<br>
								${boardDetail.content}
								<td>
				</tr>
			</tbody>
		</table>

		<div class="btns">
			<input type="submit" class="backbtn submitbtn" value="삭제하기">
			<button type="button" class="backbtn" onclick="history.back();">뒤로가기</button>
		</div>

	</div>

	<form method="POST" action="/walkpet/board/commentok" enctype="multipart/form-data">
	<div class="comment-form" style="text-align: center;">
		<div style="width: 300px; height: 200px; display: inline-block">
			<label for="content">댓글 달기</label>
			<textarea style="margin-bottom: 20px;" class="form-control" id="commentTxt" name="commentTxt" rows="3" ></textarea>
			<input type="hidden" name="boardSeq" value="${boardDetail.boardSeq}">
			<button type="submit" value="작성">작성하기</button>
		</div>
	</div>
	</form>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>내용</th>
			</tr>
			<c:forEach items="${commentList}" var="dto"> 
			<tbody>
 				<tr>
 					<th>${dto.commentSeq}</th>
 					<th>test<%-- ${dto.id} --%></th>
 					<th>${dto.commentTxt }</th>
				</tr>
			</tbody>
			</c:forEach>
		</table>
	</div>
</section>
