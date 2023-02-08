<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=902b2028b9315270cdff50a6e9f81c9a&libraries=services"></script>

<div class="shop-detail-top">
	<div class="flex">
		<div class="container shop-detail-left">

			<div class="feature">
				<figure class="featured-item image-holder r-3-2 transition"></figure>
			</div>

			<div class="gallery-wrapper">
				<div class="gallery">
					<div class="item-wrapper">
						<figure class="gallery-item image-holder r-3-2 active transition"></figure>
					</div>
					<div class="item-wrapper">
						<figure class="gallery-item image-holder r-3-2 transition"></figure>
					</div>
					<div class="item-wrapper">
						<figure class="gallery-item image-holder r-3-2 transition"></figure>
					</div>

				</div>
			</div>

		</div>
		<div class="shop-detail-right">
			<h2>${dto.shopName }</h2>
			<div class="shop-address">${dto.shopAddress }</div>
			<div class="shop-address">${dto.tel }</div>
			<div class="shop-address">${dto.hours }</div>
			<div class="review-thumbs-count">
				<div class="thumbs-up">
					<img src="/walkpet/resources/images/thumbs-up.png"> 123개 좋아요를
					받은 ${dto.shopCategory }!
				</div>

			</div>
			<a href="#" class="myButton"><i class="fa-solid fa-heart"></i> 찜
				등록</a>

		</div>
	</div>


	<div id="map" class="detailMap"
		style="width: 90%; height: 400px; background-color: antiquewhite;"></div>


	<div id="review">
		<h2>리뷰</h2>
		<div class="review-items">
		<c:forEach items="${review }" var="dto">
			<div class="review-item">
				<div class="review-left">
					<div class="review-memberimg" style="background-image: url(/walkpet/resources/images/member.jpg);"></div>
					<div class="review-thumb">
						<c:if test="${dto.reviewLike eq 'y'}">
						<img src="/walkpet/resources/images/thumbs-up.png">
						</c:if>
						<c:if test="${dto.reviewLike eq 'n'}">
						<img src="/walkpet/resources/images/thumbs-down.png">
						</c:if>
						
					</div>

				</div>
				<div class="review-right">
					<c:if test="${not empty dto.reviewImg }">
					<div class="review-img">
						<img src="/walkpet/resources/images/${dto.reviewImg }">
					</div>
					</c:if>
					<div class="review-id">${dto.id }</div>
					<div class="review-regdate">${dto.regdate }</div>
					<div class="review-content">
						${dto.reviewContent }
					</div>
				</div>
			</div>
			</c:forEach>
		</div>


		<!-- 댓글달기 -->
		<div class="review-form">
			<textarea title="리뷰를 작성해주세요."></textarea>
			<label for="file"> <i class="fa-regular fa-images"></i>
			</label> <input type="file" id="file">

			<div class="review-form-btn">
				<a href="#" class="myButton review-btn">리뷰등록</a>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=490437ce50e900f35617a529b717619d"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(${dto.lat}, ${dto.longg}),
			level : 1
		};

		var map = new kakao.maps.Map(container, options);
		
		var markerPosition = new kakao.maps.LatLng(${dto.lat}, ${dto.longg});

		var marker = new kakao.maps.Marker({
		    position:markerPosition 
		});
		
		marker.setMap(map);
		
</script>
	
	
	

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/browser.min.js"></script>
	<script src="resources/js/breakpoints.min.js"></script>
	<script src="resources/js/util.js"></script>
	<script src="resources/js/main.js"></script>
	
	<script>
    var gallery = document.querySelector('.gallery');
	var galleryItems = document.querySelectorAll('.gallery-item');
	var numOfItems = gallery.children.length;


var featured = document.querySelector('.featured-item');

function selectItem(e) {
	if (e.target.classList.contains('active')) return;
	
	featured.style.backgroundImage = e.target.style.backgroundImage;
	
	for (var i = 0; i < galleryItems.length; i++) {
		if (galleryItems[i].classList.contains('active'))
			galleryItems[i].classList.remove('active');
	}
	
	e.target.classList.add('active');
}



//Start this baby up
(function init() {
	var images = [
		'/walkpet/resources/images/shop_${dto.shopSeq}_1.jpeg',
		'/walkpet/resources/images/shop_${dto.shopSeq}_2.jpeg',
		'/walkpet/resources/images/shop_${dto.shopSeq}_3.jpeg'
	];
	
	//Set Initial Featured Image
	featured.style.backgroundImage = 'url(' + images[0] + ')';
	
	//Set Images for Gallery and Add Event Listeners
	for (var i = 0; i < galleryItems.length; i++) {
		galleryItems[i].style.backgroundImage = 'url(' + images[i] + ')';
		galleryItems[i].addEventListener('click', selectItem);
	}
})();
        
        
        
        
        
        
</script>