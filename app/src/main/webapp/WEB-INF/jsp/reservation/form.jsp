<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 예약하기</title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  

  <main>
    <div class="container marketing" style="padding-top: 50px;">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
              <div class="container">
                <div class="carousel-caption">
                  <h1>예약 안내</h1>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="reservation-container">
            <hr class="featurette-divider">
                <div class="reservation-content">
                   
                    <form id="reserveForm" action="/reserve" method="POST">
						
						<div class="select-box">
	                        <label for="selectRoom">룸테마: </label>
	                        <select id="select-room" style="width: 200px; margin-left: 50px;">
	                            <option selected>선택</option>
	                            <c:forEach items="${roomList}" var="room">
	                                <option value="${room.no}">${room.title}</option>
	                            </c:forEach>
	                          </select>
                          </div>
                          
                           <div class="select-box">
	                        <label for="select-date">날짜: </label>
	                            <input type="date" id="select-date" name="date" style="margin-left: 50px">
	                        </div>
                   
                   			<div class="select-box">
	                        <label for="selectRoom">시간: </label>
	                        <select id="select-room" style="width: 200px; margin-left: 50px;">
	                            <option selected>선택</option>
	                            <c:forEach items="${timeList}" var="time">
	                                <option value="">${time.roomTime}</option>
	                            </c:forEach>
	                          </select>
                          </div>
                          
                          <div class="select-box">
	                        <label for="selectRoom">인원: </label>
	                        <select id="select-room" style="width: 200px; margin-left: 50px;">
	                            <option selected>선택</option>
	                            <c:forEach items="${roomList}" var="room">
	                                <option value="${room.participant}">${room.participant}</option>
	                            </c:forEach>
	                          </select>
                          </div>

                    <br>
                    
                    <div class="select-box">
                        예약자:
                        <input type="text" style="margin-left: 50px;" readonly>
                    </div>
                    <div class="select-box">
                        연락처:
                        <input type="text" style="margin-left: 50px;" readonly>
                    </div>

                    <br>

                    <div class="select-box" style="color: burlywood;">
                        가격:
                    </div>
                </form>
                </div>
            <hr class="featurette-divider">
            <div style="text-align: center;">
                <button type="button" class="btn btn-primary">예약하기</button>
            </div>
        </div>

    </div>
  </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
 <script>
     function submit() {
         // 룸테마 값 넘기기
         reserveForm.selectRoom.value = $('#seletedRoom').val();

         document.reserveForm.submit();
     }
 </script>
 </body>
 </html>