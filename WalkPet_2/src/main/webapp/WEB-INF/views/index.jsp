<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

				<!-- Header -->
				<header id="header">
					<a href="/walkpet/index" class="logo"><strong>WalkPet</strong></a>
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

				<!-- Banner -->
				<section id="banner">
					<div class="content">
					<h2 class="shop_title">&nbsp;&nbsp;&nbsp;&nbsp;Hot Place</h2>
						<center>
							<form>
							<div id="area">
								<select name="area" id="areasel">
								<c:if test="${not empty seoul}">
									<optgroup label="서울">
									<c:forEach items="${seoul}" var="seoul">
										<option value="${seoul.areaName }">${seoul.areaName }</option>
									</c:forEach>
									</optgroup>
								</c:if>
								<c:if test="${not empty gyeong}">
									<optgroup label="경기도">
									<c:forEach items="${gyeong }" var="gyeong">
										<option>${gyeong.areaName }</option>
									</c:forEach>
									</optgroup>
								</c:if>
								</select>
							</div>
							</form>
							<div id="map"></div>
							
							
							
							<div class="shop_category">
								<a href="javascript:;" onclick="category(this);" style="color: #f56a6a;">카페</a>
								<a href="javascript:;" onclick="category(this);">음식점</a>
								<a href="javascript:;" onclick="category(this);">쇼핑몰</a>
								<a href="javascript:;" onclick="category(this);">미용</a>
								<a href="javascript:;" onclick="category(this);">숙소</a>
							</div>
						
							
							<div id="cafe">
							<a href="/walkpet/place/cafe" class="more">더보기 +</a>
							<c:forEach items="${cafe}" var="cafe">
							
								<div class="item">
									<div class="shopImg">
										<img src="/walkpet/resources/images/${cafe.shopImgImage}">
									</div>
									<div class="item_title">${cafe.shopName }</div>
									<div class="item_address">${cafe.shopAddress }</div>
									<input type="button" value="더보기" class="btn" onclick="location.href='/walkpet/shop/shopDetail?seq=${cafe.shopSeq}'">
								</div>
							</c:forEach>
							</div>
							
							<div id="food" style="display: none;">
							<a href="/walkpet/place/food" class="more">더보기 +</a>
							<c:forEach items="${food}" var="food">
								<div class="item">
									<div class="shopImg">
										<img src="/walkpet/resources/images/${food.shopImgImage}">
									</div>
									<div class="item_title">${food.shopName }</div>
									<div class="item_address">${food.shopAddress }</div>
									<input type="button" value="더보기" class="btn" onclick="location.href='/walkpet/shop/shopDetail?seq=${food.shopSeq}'">
								</div>
							</c:forEach>
							</div>
							
							<div id="shopping" style="display: none;">
							<a href="/walkpet/place/shopping" class="more">더보기 +</a>
							<c:forEach items="${shopping}" var="shopping">
								<div class="item">
									<div class="shopImg">
										<img src="/walkpet/resources/images/${shopping.shopImgImage}">
									</div>
									<div class="item_title">${shopping.shopName }</div>
									<div class="item_address">${shopping.shopAddress }</div>
									<input type="button" value="더보기" class="btn"onclick="location.href='/walkpet/shop/shopDetail?seq=${shopping.shopSeq}'">
								</div>
							</c:forEach>
							</div>
							
							<div id="beauty" style="display: none;">
							<a href="/walkpet/place/beauty" class="more">더보기 +</a>
							<c:forEach items="${beauty}" var="beauty">
							
								<div class="item">
									<div class="shopImg">
										<img src="/walkpet/resources/images/${beauty.shopImgImage}">
									</div>
									<div class="item_title">${beauty.shopName }</div>
									<div class="item_address">${beauty.shopAddress }</div>
									<input type="button" value="더보기" class="btn" onclick="location.href='/walkpet/shop/shopDetail?seq=${beauty.shopSeq}'">
								</div>
							</c:forEach>
							</div>
							
							<div id="rest" style="display: none;">
							<a href="/walkpet/place/accommodation" class="more">더보기 +</a>
							<c:forEach items="${rest}" var="rest">
							
								<div class="item">
									<div class="shopImg">
										<img src="/walkpet/resources/images/${rest.shopImgImage}">
									</div>
									<div class="item_title">${rest.shopName }</div>
									<div class="item_address">${rest.shopAddress }</div>
									<input type="button" value="더보기" class="btn" onclick="location.href='/walkpet/shop/shopDetail?seq=${rest.shopSeq}'">
								</div>
							</c:forEach>
							</div>
							
						</center>
					</div>
				</section>
				
				<section id="mate">
					<div class="content">
						<h2 class="shop_title" style="width: 150px;">동반인 모집</h2>
						<a href="#" class="more matemore">더보기 +</a>

						<div class="items">
						<c:forEach items="${mate}" var="mate">
						<a href="#" class="itemlink">
						<div class="item">
							<div class="info">
								<div class="subject">${mate.mateSubject }</div>
								
								<div class="content">
									<c:choose>
									<c:when test="${fn:length(mate.mateContent) gt 30}">
									<c:out value="${fn:substring(mate.mateContent, 0, 30)}">...
									</c:out></c:when>
									<c:otherwise>
									<c:out value="${mate.mateContent}"></c:out>
									</c:otherwise>
									</c:choose>
								</div>
								<div class="date"><span class="start">${mate.startDate }</span> ~ <span class="end">${mate.endDate }</span></div>
								<div class="id">${mate.id }</div>
							</div>
						</div>
						</a>
						</c:forEach>
						</div>
						
					</div>
				</section>
				
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902b2028b9315270cdff50a6e9f81c9a"></script>
				<script src="/walkpet/resources/js/jquery.min.js"></script>
				
<script>

	//날짜 자르기
	$('.start').each(function(){
		var start = $(this).text();
		var result = start.substr(0, 10);
		var rep = result.replace('-', '.');
		$(this).text(rep);
	});
	
	$('.end').each(function(){
		var end = $(this).text();
		var result = end.substr(0, 10);
		var rep = result.replace('-', '.');
		$(this).text(rep);
	});
	
	
	//지도
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(37.52522087820043, 126.96195798951149),
		level: 10
	};

	var map = new kakao.maps.Map(container, options);
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];

	// 마커 하나를 지도위에 표시합니다 
	<c:forEach items="${cafe}" var="cafe">
	addMarker(new kakao.maps.LatLng(${cafe.lat}, ${cafe.longg}));
	</c:forEach>

	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        position: position
	    });

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}

	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i].setMap(map);
	    }            
	}

	
	//셀렉박스
	$('#areasel').on('change', function(){
		
		setMarkers(null);
		
		$.ajax({
			type : 'POST',
			url : '/walkpet/mapArea',
			data : {
				area : $('#areasel').val()
			},
			success : function(result) {
				
				
				 //마커 배열
			      let mlist = [];
			      
			      
			      result.forEach((item)=>{
			         
			    	 addMarker(new kakao.maps.LatLng(item.lat, item.longg));
			    	 
			    	 
			         //let p = new kakao.maps.LatLng(item.lat, item.longg);
			         
			         //let m = new kakao.maps.Marker({ position: p });
			         //m.setTitle(item.shopName); //툴팁
			         //m.setImage(mimg); //마커 이미지
			         
			         
			         //m.setMap(map);
			         
			         //mlist.push(m); //마커 배열에 추가
			         
			         
			      });

			},

			error : function(a, b, c) {
				console.log(a, b, c);
			}
		});
		
	});
	
	
	
	
	
	//카테고리
	function category(ths){
		
		var category = $(ths).text();
		$('.shop_category > a').css('color', '#7f888f');
		$(ths).css('color', '#f56a6a');
		if(category == '카페'){
			$('#food').css('display', 'none');
			$('#shopping').css('display', 'none');
			$('#beauty').css('display', 'none');
			$('#rest').css('display', 'none');
			$('#cafe').css('display', 'block');
		} else if(category == '음식점'){
			$('#food').css('display', 'block');
			$('#shopping').css('display', 'none');
			$('#beauty').css('display', 'none');
			$('#rest').css('display', 'none');
			$('#cafe').css('display', 'none');
		} else if(category == '쇼핑몰'){
			$('#food').css('display', 'none');
			$('#shopping').css('display', 'block');
			$('#beauty').css('display', 'none');
			$('#rest').css('display', 'none');
			$('#cafe').css('display', 'none');
		} else if(category == '미용'){
			$('#food').css('display', 'none');
			$('#shopping').css('display', 'none');
			$('#beauty').css('display', 'block');
			$('#rest').css('display', 'none');
			$('#cafe').css('display', 'none');
		} else if(category == '숙소'){
			$('#food').css('display', 'none');
			$('#shopping').css('display', 'none');
			$('#beauty').css('display', 'none');
			$('#rest').css('display', 'block');
			$('#cafe').css('display', 'none');
		}
		
	}
</script>
