<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 예약하기</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  

  <main>
    <div class="container marketing" style="padding-top: 50px; margin-bottom: 700px;">
        <div class="reservation-container">
        	
        	<form action='reserve' method='post'>
		
				<div class="left-box">
					<div class="room-list">
					
						<div class="card border-light mb-3" style="width: 100%; background-color: black; flex-direction: unset; padding-block: 10px;">
						  <div class="card-header" style="text-align: center; padding-top: 17px;">
						  	<h4>날짜 선택</h4>
						  </div>
						  <div class="card-body">
							  <input type="date" id="selectDate" name="date" style="width: 50%;">
						  </div>
						</div>
						
						<ul class="thema-list">
							<c:forEach items="${roomList}" var="room">
							<li>
								<p style="width: 140px; height: 180px; float: left;">
									<img src="${room.photo}"  style="width: 100%;">
								</p>
								<div class="thema-content">
									<h5 style="margin-left: 5px; color: darksalmon;">■ ${room.title}</h5>
									<ul class="time-list">
										<c:forEach items="${roomTimeList}" var="roomTime">
										<input type="hidden" id="roomNo" name = "roomNo" value="">
										<input type="hidden" id="roomTime" name="roomTime" value="">
											 <c:if test="${room.no == roomTime.rno }">
											<li><button type="button" class="res-btn" value="${roomTime.rno}">${roomTime.roomTime}</button></li>
											</c:if> 
										</c:forEach>
									</ul>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
						
					<div style="border-bottom-style: solid; border-bottom-width: thin; height: 155px;"> 
						<ul style="margin-top: 30px; margin-bottom: 60px; float: right; font-size: 14px;">
							<li><span class="poss"></span>예약 가능</li>
							<li><span class="sold"></span>예약 불가능</li>
							<li><span class="select"></span>선택</li>
						</ul>
					</div>
					
					<div class="res-box">
						<dl>
							<dt>
								<label for="name">예약자: </label>
							</dt>
							<dd>
								<input type="text" id="name" name="name" value="${sessionScope.loginUser.name}">
							</dd>
						</dl>
						<dl>
							<dt>
								<label for="phone">연락처: </label>
							</dt>
							<dd>
								<input type="text" id="phone" name="phone" value="${sessionScope.loginUser.phone}">
							</dd>
						</dl>
						<div class="select-box">
	                        <label for="selectParticipant">인원: </label>
	                        <input type="radio" id="participant" name="participant" style="margin-left:56px" value="2"> 2
	                        <input type="radio" id="participant" name="participant" style="margin-left:30px" value="3"> 3
	                        <input type="radio" id="participant" name="participant" style="margin-left:30px" value="4"> 4
	                        <input type="radio" id="participant" name="participant" style="margin-left:30px" value="5"> 5
	                        <input type="radio" id="participant" name="participant" style="margin-left:30px" value="6"> 6
                          </div>
						<div class="select-container">
		                   		<div>가격: </div>
		                   		<div id="selectPrice"></div>
		                   		<input type="hidden" id="price" name="price" value="">
		                   		<div>원</div>
		                </div>
					</div>
					  <div style="text-align: center;">
                		<button type="submit" id="reservationBtn" class="btn btn-find" style="width: 100% ;padding-top: 6px; padding-block: 10px;">예약하기</button>
            		</div>
				</div>
			
			</form>
				
				<div class="right-box">
					<ul class="info">
						<li>
							<p style="color: darksalmon; font-size: 16px;">■ 예약 방법</p>
							<p>
								1. 날짜선택<br>
								2. 테마와 시간대를 선택<br>
								3. 이름, 연락처 등 예약정보를 입력하고<br>
								꼭! 주의 사항 안내를 읽은 후  동의 체크<br>
								4. 비밀번호 입력 후 예약버튼 누르기
							</p>
						</li>
					</ul>
				</div>
	 	</div>
    </div>
  </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
 <script>
	
 		// 날짜 선택 시
		$('#selectDate').on('change', function() {
			var selectedDate = $(this).val();
			
			$.ajax({
				url: 'selectDate',
				type: 'post',
				data: {
					date : $(this).val()
				},
				dataType: 'json',
				success: function(data) {
					console.log(data);
						// 예약된 각각의 데이터들
						$(data).each(function() {
							// 넘어오는 각 데이터를 담은 변수
							var rno = this.rno;
							var roomTime = this.roomTime;
							var doDate = this.doDate;
							console.log("dodate: "+doDate)
							console.log("selectedDate: " +selectedDate)
								// 날짜마다 존재하는 테마별 모든 시간대들의 각 데이터들
								$('.res-btn').each(function(i) {
									if ($(this).val() == rno 
											&& $(this).text() == roomTime 
											&& selectedDate == doDate) {
												console.log(roomTime)
												$(this).addClass('disable');
												$('.res-btn').css('background-color', 'white');
												$('.disable').css('background-color', 'dimgrey');
												$(this).attr('disabled',  true);
										}
								})
							
						});
				},
				error: function() {
					console.log('error');
				}
			
			});
		});
		
 	// 시간대 선택하는 버튼 클릭 시
 	var cnt = 0;
 	 $('.res-btn').on('click', function(e) {
	 		 var date = document.getElementById('selectDate').value;
	 		 if (date == '') {
	 			 alert('날짜를 먼저 선택해주세요.');
	 			 return false;
	 		 }
	 		 
		 	 $('.res-btn').css('background-color', 'white');
		 	 $('.disable').css('background-color', 'dimgrey');
	 		 $(this).css('background-color', 'darksalmon');
	 		 $('#roomTime').val($(this).text());
	 		 $('#roomNo').val($(this).val());
 	 });
 	
     	/*  [인원] 라디오 버튼 선택 시 발생  */
       $('input:radio[name=participant]').on('click', function() {
	     	var price = 22000;
     		var participant = $('#participant:checked').val();
		   	var total = price * participant;
		   	$('#selectPrice').text(total);
		   	$('#price').val(total);
	   	});
     	
     	
     	$('#reservationBtn').on('click', function() {
     		if ( $('#roomTime').val() == '') {
     			alert('원하는 시간대를 선택해주세요.');
     			return false;
     		}
     		if (!$('input:radio[name=participant]:checked').val()) {
     			alert('인원 수를 선택해주세요.');
     			return false;
     		}
     		
     		alert("예약되었습니다.");
     		return true;
     	});
 </script>
 </body>
 </html>