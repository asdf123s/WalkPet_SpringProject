<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<section id="hi" class="container commuWrite_con">
		
		<h1 class="title_commuwrite title">글쓰기</h1>
		<form method="POST" action="/walkpet/board/addok" enctype="multipart/form-data">
			<div class="writeform">
			<input type="hidden" name="id" value="${id}">
				<table>
					<tr>
						<td class="commu_sel">
							<select name="boardCategory" class="writeType">
								<option value="" selected id="default">글을 작성하고 싶은 게시판을 선택해주세요.</option>
								<option value="반려동물 갤러리">반려동물 갤러리</option>
								<option value="강아지">강아지</option>
								<option value="고양이">고양이</option>
								<option value="다른 친구들">다른 친구들</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="content">
							<input type="text" name="subject" size="150" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<td class="content">
							<textarea rows="10" cols="150" name="content" required></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="file" name="attach" class="full" multiple>
							<!-- <input type="file" name="attach" class="full" multiple>
							<input type="file" name="attach" class="full" multiple> -->
							<div id="attachZone"></div>
							<input type="file" name="attach" id="attach" class="full" style="display: none;">
						</td>
					</tr>
					
				</table>



				<div class="commu_btns">
					<input type="submit" class="backbtn submitbtn" value="등록하기">
					<button type="button" class="backbtn" onclick="history.back();">뒤로가기</button>
				</div>
				
			</div>
		</form>

	</section>
	
	<script>
	
	//첨부 파일 선택 화면 구현
	let fileList = []; //첨부파일들
	
	$('#attachZone').on('dragenter', function(e) {
						//$(this).css('background-color', 'tomato');
						e.preventDefault();
						e.stopPropagation();
					})
	                .on('dragover', function(e) {
	                	//$(this).css('background-color', 'gold');
	                	e.preventDefault();
						e.stopPropagation();
	                })
	                .on('dragleave', function(e) {
	                	//$(this).css('background-color', 'cornflowerblue');
	                	e.preventDefault();
						e.stopPropagation();
	                })
	                .on('drop', function(e) {
	                	//$(this).css('background-color', 'yellowgreen');
	                	e.preventDefault();
	                	
	                	let files = e.originalEvent.dataTransfer.files;
	                	console.log(files);
	                	
	                	if (files != null & files != undefined) {
	                		
	                		let temp = '';
	                		
	                		for (let i=0; i<files.length; i++) {
	                			
	                			let f = files[i];
	                			
	                			let filename = f.name;
	                			let filesize = f.size / 1024 / 1024;
	                			filesize = filesize < 1 ? filesize.toFixed(2) : filesize.toFixed(1); 
	                			
	                			temp += `<div>
	                						<span>\${filename}</span>
	                						<span>\${filesize}MB</span>
	                					 </div>`;
	                			
	                		}//for
	                		
	                		$(this).append(temp);
	                		
	                		//<input type="file" files="">
	                		$('#attach').prop('files', files);
	                		
	                	}
	                	
	                });
	
	</script>