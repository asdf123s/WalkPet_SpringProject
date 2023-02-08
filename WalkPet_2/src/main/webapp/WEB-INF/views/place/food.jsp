<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=490437ce50e900f35617a529b717619d&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- login.jsp -->
	<section id="place_section">
		<h1>아이들과 함께</h1>
		<h2>음식점</h2>
		<hr>
		<div class="place_main">
			<div class="place_main_choice">
				<p>지역 검색</p>
				<select id="select">
					<option value="a">선택</option>
					<option value="s">서울</option>
					<option value="g">경기</option>
				</select>
				<div class="place_main_choice_list" id="g">
				<ul>
					<li class="가평군">가평군</li>
					<li class="고양시">고양시</li>
					<li class="과천시">과천시</li>
					<li class="광명시">광명시</li>
					<li class="광주시">광주시</li>
					<li class="구리시">구리시</li>
					<li class="군포시">군포시</li>
					<li class="김포시">김포시</li>
					<li class="남양주시">남양주시</li>
					<li class="동두천시">동두천시</li>
					<li class="부천시">부천시</li>
					<li class="성남시">성남시</li>
					<li class="수원시">수원시</li>
					<li class="시흥시">시흥시</li>
					<li class="안산시">안산시</li>
					<li class="안양시">안양시</li>
					<li class="양주시">양주시</li>
					<li class="양평군">양평군</li>
					<li class="여주시">여주시</li>
					<li class="연천군">연천군</li>
					<li class="오산시">오산시</li>
					<li class="용인시">용인시</li>
					<li class="의왕시">의왕시</li>
					<li class="의정부시">의정부시</li>
					<li class="이천시">이천시</li>
					<li class="파주시">파주시</li>
					<li class="평택시">평택시</li>
					<li class="포천시">포천시</li>
					<li class="하남시">하남시</li>
					<li class="화성시">화성시</li>
				</ul>
				</div>
				<div class="place_main_choice_list" id="s">
				<ul>
					<li class="강남구">강남구</li>
					<li class="강동구">강동구</li>
					<li class="강북구">강북구</li>
					<li class="강서구">강서구</li>
					<li class="관악구">관악구</li>
					<li class="광진구">광진구</li>
					<li class="구로구">구로구</li>
					<li class="금천구">금천구</li>
					<li class="노원구">노원구</li>
					<li class="도봉구">도봉구</li>
					<li class="동대문구">동대문구</li>
					<li class="동작구">동작구</li>
					<li class="마포구">마포구</li>
					<li class="서대문구">서대문구</li>
					<li class="서초구">서초구</li>
					<li class="성동구">성동구</li>
					<li class="성북구">성북구</li>
					<li class="송파구">송파구</li>
					<li class="양천구">양천구</li>
					<li class="영등포구">영등포구</li>
					<li class="용산구">용산구</li>
					<li class="은평구">은평구</li>
					<li class="종로구">종로구</li>
					<li class="중구">중구</li>
					<li class="중랑구">중랑구</li>
				</ul>
				</div>
			</div>
			<div class="place_main_map" id="map" style="width:700px; height:400px; margin-top:0;"></div>
		</div>
		<hr class="place_hr">
			<c:forEach items="${placeList}" var="pdto">
			<div class="place_main_content default">
				<div class="place_main_content_image"><img src="/walkpet/resources/images/${pdto.shopImgImage }"></div>
				<div class="place_main_content_text">
					<h3>${pdto.shopName } <span>좋아요 ${pdto.likeCount }</span></h3>
					<ul>
						<li>${pdto.areaName }</li>
						<li>${pdto.shopAddress}</li>
					</ul>
				</div>
				<div class="place_main_content_button">
					<button type="button" onclick="location.href='#'">더보기</button>
				</div>
			</div>
			</c:forEach>
	</section>
	
<script>
	var flag = false;
	
	
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.3932800, 126.9516527), //지도의 중심좌표.
		level: 10 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	<c:forEach var = "vo"  items="${placeList}" varStatus="status">   

	   geocoder.addressSearch("${vo.shopAddress}", function(result, status) {
		   
		   var html = "<div class='place_info'>";
	         
	          // 정상적으로 검색이 완료됐으면 
	           if (status === kakao.maps.services.Status.OK) {

	             var coords  = new kakao.maps.LatLng(result[0].y, result[0].x);
	             var imageSrc = "/walkpet/resources/images/marker.png"; // 마커이미지의 주소입니다 
	             var imageSize = new kakao.maps.Size(40, 40); // 마커이미지의 크기입니다
	             var imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	               
	            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	             	               
	           // 결과값으로 받은 위치를 마커로 표시합니다
	           var marker = new kakao.maps.Marker({
	               map: map,
	               position: coords,
	               image: markerImage // 마커이미지 설정 
	           });	 
	           
	           var html2 = '<div class="place_title">${vo.shopName}<p class="mclose">X</p></div>'+' <div class="body">' 
	            + '<div class="desc"><div class="ellipsis">[${vo.areaName}] ${vo.shopAddress}</div>'
	            + '<p class="place_tel">☎) ${vo.tel}</p><p class="plase_hours">운영시간) ${vo.hours}</p>'
	            + '<div><a href="" target="_blank" class="link">더보기</a></div>' 
	            + '</div></div></div>';  
	            
	               html += html2;
	           
	           kakao.maps.event.addListener(marker, 'click', function() {              
	               infowindow.setContent(html);
	               infowindow.open(map, marker);       
	               
	               $(".mclose").click(function() {
	                     infowindow.close();
	                  });
	               
	           });       
	        
	       }   
	});
	   
	</c:forEach>
	
	function setCenter(addr) {
		geocoder.addressSearch(addr, function(result, status) {
		    // 지도를 1레벨 올립니다 (지도가 확대됩니다)
		    map.setLevel(8);

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {  
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x); 
		        
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     }
		});
	}

	$(document).ready(function() {
		$("#select").on("change", function(){
			if($(this).val() == "s") {
				$("#s").css("display", "block");
				$("#g").css("display", "none");
			} else if($(this).val() == "g") {
				$("#g").css("display", "block");
				$("#s").css("display", "none");
			} else {
				$("#g").css("display", "none");
				$("#s").css("display", "none");
			}
		});
		
		$(".place_main_choice_list li").click(function() {			
			var addr = $(this).attr("class");
        	var addListHtml="";
			setCenter(addr);
			$.ajax({
                type: "post",
                url: "place_choice",             
                data:{addr:addr,
                	  shopCategory:"음식점"
                	  },
                success: function (result) {
                	var jdata = JSON.parse(result);	
                	if(jdata.jlist == ""){
                		addListHtml = "<div style='text-align:center' class='place_add_text'>등록된 장소가 없습니다.</div>";
					}
					for(var i in jdata.jlist){
						addListHtml += '<div class="place_main_content place_add">';
						addListHtml += '<div class="place_main_content_image"><img src="/walkpet/resources/images/' + jdata.jlist[i].shopImgImage + '"></div>';
						addListHtml += '<div class="place_main_content_text">';
						addListHtml += '<h3>' + jdata.jlist[i].shopName +'<span> 좋아요 '+ jdata.jlist[i].likeCount + '</span></h3>'
						addListHtml += '<ul><li>' + jdata.jlist[i].areaName+ '</li><li>' + jdata.jlist[i].shopAddress + '</li></ul>';
						addListHtml += '</div><div class="place_main_content_button"><button type="button">더보기</button></div></div>';
					}
					$(".default").remove();
					$(".place_add").remove();
					$(".place_add_text").remove();
					$(".place_hr").after(addListHtml);
                },
           }); 
			
		});


	});
	
	
</script>