<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<head>
<style>
   .petdiary {
      width: 1039px;
      display: flex;
      justify-content: center;
   }
   .diarydetail {
      width: 1039px;
      display: flex;
      justify-content: center;
   }
   .detailbox {
      border-radius: 30px;
      border:10px dashed gray;
      margin-left: 250px;
      width: 600px;
      height: 500px;
      justify-content: center;
      text-align: center;
      padding: 0px 30px;
   }
   .choosedate {
      margin-left: 250px;
      display: flex;
      justify-content: center;
   }
   .diaryimg {
      margin: 20px 0;
   }
   .diarytable tr:nth-child(2) {
      height: 200px;
   }
   .diarytable tr:nth-child(2) > td {
      vertical-align: middle;
   }
   #input_date {
      border-radius: 10px;
      height: 40px;
   }
   #input_submit {
      height: 50px;
      border-radius: 10px;
      background-color: gray;
      color: white!important;
      box-shadow: inset 0 0 0 2px white!important;
   }
   #input_submit:hover {
      box-shadow: 0 0 40px 40px gray inset!important;
   }
   .diaryinsert {
      width: 1039px;
      display: flex;
      justify-content: center;
      padding-top: 30px;
      padding-left: 250px;
   }
   #diaryinsertbtn {
      border-radius: 10px;
      background-color: white;
      color: gray!important;
      box-shadow: inset 0 0 0 2px gray!important;
   }
   #diaryinsertbtn:hover {
      background-color: gray;
      color: white!important;
   }
   #byname {
      font-size: small;
      font-weight: 900;
   }
   #backbtn {
      border-radius: 10px;
      background-color: white;
      color: gray!important;
      box-shadow: inset 0 0 0 2px #D8D8D8!important;
   }
   #backbtn:hover {
      background-color: #D8D8D8;
      color: white!important;
   }
</style>
</head>

<!-- Header -->
<header id="header">
   <a href="#" class="logo"><strong>반려동물 성장일기 <span id="byname">By${sessionName}</span> </strong></a>
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
   </header>

   <!-- Content -->
   <!-- <h2 id="content"></h2> -->
   <div class="row">
      <div class="petdiary">
         <div class="choosedate">
            <form method="POST" action="/walkpet/member/petdiary">
               <input name="input_date" id="input_date" type="date">
               <input id="input_submit" class="input_submit" type="submit" onclick="input()" value="검색">
            </form>
         </div>
      </div>
      
      <c:if test="${empty ddate}">
      <div class="diarydetail">
         <div class="detailbox">
            <div class="diaryimg">
               <img src="/walkpet/resources/images/woman_06.png">
            </div>
            <div class="diarytable">
               <table>
                  <tr>
                     <td>[ DATE ]</td>
                  </tr>
                  <tr>
                     <td>[ 보고싶은 일기의 날짜를 선택해주세요. ]</td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      </c:if>
      
      <c:if test="${not empty ddate}">
      <c:forEach items="${mdiary}" var="dto">
      <div class="diarydetail">
         <div class="detailbox">
            <div class="diaryimg">
               <img src="/walkpet/resources/images/${dto.diaryImg}">
            </div>
            <div class="diarytable">
               <table>
                  <tr>
                     <td>[ ${dto.regdate} ]</td>
                  </tr>
                  <tr>
                     <td>${dto.diaryContent}</td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      </c:forEach>
      </c:if>
      
      <form method="POST" action="/walkpet/member/diarywrite">
      <div class="diaryinsert">
         <input type="submit" id="diaryinsertbtn" value="성장일기 작성하기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="button" id="backbtn" value="돌아가기" onclick="location.href='/walkpet/member/mypage';">
      </div>
      </form>
      
   </div>

</section>

<script>
   function input() {
      
      /* location.reload(); */
      
      /* 
      const dday = document.querySelector("#input_date").value;
      console.log(dday);
       */
      
      
      /* 
      $.ajax({
         type: "POST",
         url: "/member/diary/diarydetail",
         data: dday,
         success: (time)=>{$("#time_text").html(time)},
         error: (log)=>{alert("실패" + log)}
      });
       */
   }
</script>