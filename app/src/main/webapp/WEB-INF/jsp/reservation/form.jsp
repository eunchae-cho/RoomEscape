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
              
               <form id="reserveForm" action="reserve" method="POST">
              
                   <div class="reservation-content">
						<div class="select-box">
	                        <label for="selectRoom">룸테마: </label>
	                        <select id="selectRoom" name="roomNo" onchange="setRoomNo(this.value);" style="width: 200px; margin-left: 36px;">
	                            <option selected>선택</option>
	                            <c:forEach items="${roomList}" var="room">
	                                <option value="${room.no}">${room.title}</option>
	                            </c:forEach>
	                          </select>
                          </div>
                          
                           <div class="select-box">
	                        <label for="selectDate">날짜: </label>
	                            <input type="date" id="selectDate" name="date" style="width: 200px; margin-left: 50px;">
	                        </div>
                   
                   			<div class="select-box">
	                        <label for="selectTime">시간: </label>
	                        <select id="selectTime" name="roomTime" style="width: 200px; margin-left: 50px; "></select>
                          </div>
                          
                          <div class="select-box">
	                        <label for="selectParticipant">인원: </label>
	                        <input type="radio" id="participant" name="participant" style="margin-left:50px" value="2">2
	                        <input type="radio" id="participant" name="participant" style="margin-left:50px" value="3">3
	                        <input type="radio" id="participant" name="participant" style="margin-left:50px" value="4">4
	                        <input type="radio" id="participant" name="participant" style="margin-left:50px" value="5">5
	                        <input type="radio" id="participant" name="participant" style="margin-left:50px" value="6">6
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
		
		                   <div class="select-container">
		                   		<div>가격: </div>
		                   		<div id="selectPrice"></div>
		                   		<input type="hidden" id="price" name="price" value="">
		                   		<div>원</div>
		                   </div>
                </div>
            <hr class="featurette-divider">
            <div style="text-align: center;">
                <button type="submit" id="reservationBtn" class="btn btn-primary">예약하기</button>
            </div>
		  
		  </form>
        
        </div>

    </div>
  </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
 <script>
 
		/*  [룸테마] 선택(onchange) 시 발생  */
     	function setRoomNo(param) {
     		var $target = $('#selectTime option:selected').val();
     		
     		if (param == "") {
     			$target.append('<option value="">선택</option>');
     			return;
     		}
     		
     		$.ajax({
     			url: "roomTimeList",
     			type: "POST",
     			data: {
     				no : param
     			},
     			dataType: "json",
     			success: function(data) {
     				console.log(data);
     				if (data.length < 1) { 
     					$('#selectTime').append('<option value="">선택</option>');
     				} else {
     					$('#selectTime').append('<option value="">선택</option>');
     					$(data).each(function(i){
     						$('#selectTime').append('<option value="'+ data[i].roomTime +'">'+ data[i].roomTime +'</option>');
     					})
     				}
     			},
     			error: function() {
     				console.log("error");
     			}
     		});
     	}
     	
     	/*  [인원] 라디오 버튼 선택 시 발생  */
       $('input:radio[name=participant]').on('click', function() {
	     	var price = 22000;
     		var participant = $('#participant:checked').val();
		   	var total = price * participant;
		   	$('#selectPrice').text(total);
		   	$('#price').val(total);
	   	});
     	
     	$('#reservationBtn').on('click', function() {
     		 alert("예약되었습니다.");
     	});
     	
 </script>
 </body>
 </html>