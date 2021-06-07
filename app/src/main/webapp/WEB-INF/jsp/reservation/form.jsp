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

  <main style="height: 1750px;">
    <div class="container marketing" style="padding-top: 50px; margin-bottom: 700px;">
        <div class="reservation-container">
        	
        	<form action='reserve' method='post'>
		
				<div class="left-box">
					<div class="room-list">
						<div style="text-align: center; margin-bottom: 60px;">
							<h4 style="border-bottom: solid; margin: 0 auto; width: 130px;">실시간 예약</h4>
						</div>
						<div class="card border-light mb-3" style="width: 100%; background-color: black; flex-direction: unset; padding-block: 10px;">
						  <div class="card-header" style="text-align: center; padding-top: 19px;">
						  	<h5>날짜 선택</h5>
						  </div>
						  <div class="card-body">
							  <input type="date" id="selectDate" name="date" style="width: 50%;" min="1899-01-01" max="2000-13-13">
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
									<input type="hidden"  id="roomTitle" value="${room.title}">
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
					  <h5 style="margin-left: 5px; color: darksalmon; margin-bottom: 50px;">■ 예약 정보</h5>
						<dl>
							<dt>
								<label for="reservedRoom">테마명: </label>
							</dt>
							<dd>
								<p  id="reservedRoom" style="font-weight: 400; margin-bottom: 22px; padding-left: 105px; padding-top: 3px;" value=""><br></p>
							</dd>
						</dl>
						<dl>
							<dt>
								<label for="reservedRoomTime">예약 시간대: </label>
							</dt>
							<dd>
								<p  id="reservedRoomTime" style="font-weight: 400; margin-bottom: 22px; padding-left: 105px; padding-top: 3px;;" value=""><br></p>
							</dd>
						</dl>
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
		                <div style="margin-top: 20px;">
		                	<textarea style="height: 120px; width: 100%; font-size: 13px; resize:none; margin-bottom: 7px;">
ο 테마플레이시 반드시 마스크 착용하셔야합니다. (미착용시 플레이불가 및 환불불가)
ο 예약시 예약확인 문자받으신 후 홈페이지내 예약확인탭에서 '예약실패/환불진행'이라고 뜨실 경우, 예약이 진행되지 않은것입니다. (동시간대 선결제자 우선 / 예약금 환불은 카드사 승인후 진행)
ο 예약 결제진행 후, 예약확인 문자 못받으신 경우 예약이 되지 않은것이니 궁금하신 사항있으시면 매장으로 연락부탁드립니다. (동시간대 선결제자 우선 / 예약금은 환불은 카드사 승인후 진행)
ο 예약확인 전화 혹은 문자를 받지 못하신 분은 예약이 되지 않으신 것이니 궁금하신 사항있으시면 매장으로 연락부탁드립니다. (동시간대 선결제자 우선 / 예약금은 환불은 카드사 승인후 진행)
ο 테마시작시간으로부터 24시간 이내 취소시에는 예약금 환불이 불가능하니 유의바랍니다. (매장통화 가능시간 11:00 - 22:30)
ο 24시간 이내 예약취소 시 다른 날짜로 변경은 불가합니다.
ο 잘못된 번호 기입으로 연락이 되지 않을경우 테마시작 24시간 전 예약취소 진행됩니다. (예약했으나 예약확인 문자 못받으신 경우 매장으로 연락부탁드립니다)
ο 예약취소는 전화취소만 가능하며 매장 통화가능시간은 11:00 - 22:30 까지 입니다.
ο 전액결제를 하신 경우에도, 게임시작시간 직전이나 이후에는 결제한금액은 환불이 불가능합니다.
ο 현장에서 선결제하신 예약금을 제외한 차액만 추가 결제하시면 됩니다.
ο 인원변동 가능성이 있으신 경우에는 현장에서 변경된 인원에 맞게 차액 결제해주세요.
ο 예약시간 10분전에 매장도착 해주셔야합니다. 지각을 하실 경우 다음 게임 예약자에게 피해가 가지 않기 위해 시간을 차감하여 진행합니다.
ο 게임이 마감된 이후에는 어떠한 경우에도 환불이 불가능합니다. 
ο 게임 진행시 편한 복장을 추천드리며 (치마X) 매장에서 실내화로 갈아신고 게임 진행됩니다.
ο 예약확인 전화 3회 미수신시 예약취소 진행됩니다.
ο 음주시 입장 제한됩니다.
							</textarea>
							<textarea style=" height: 120px; width: 100%; font-size: 13px; resize:none;">
■ 수집하는 개인정보 항목
회사는 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
ο 수집항목 : 이름 , 휴대전화번호, 이메일
ο 개인정보 수집방법 : 홈페이지(회원가입)
 
■ 개인정보의 수집 및 이용목적
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산콘텐츠 제공
ο 서비스신청 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달
ο 마케팅 및 광고에 활용, 이벤트 등 광고성 정보 전달

■ 개인정보의 보유 및 이용기간
원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
보존 항목 : 이름 , 휴대전화번호 , 이메일
보존 근거 : 회사내부방침
보존 기간 : 회원탈퇴시까지
							</textarea>
							<p style="text-align: center; margin-top: 20px; font-weight: 400;"> 이용 약관 및 개인정보취급방침에 대해 동의합니까? </p>
							<div  style="text-align: center;">
								<input type="radio" id="yes" name="agreement">  동의함
								<input type="radio" id="no" name="agreement" style="margin-left: 20px;">  동의안함
							</div>
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
 
 // 지난 날짜 선택할 수 없게
 $(function() {
	 	var today = new Date();
	 	var dd = today.getDate();
	 	var mm = today.getMonth() + 1;
	 	var yyyy = today.getFullYear();
	 	if (dd < 10) {
	 		dd = '0' + dd;
	 	}
	 	if (mm < 10) {
	 		mm = '0' + mm;
	 	}
	 	today = yyyy + '-' + mm + '-' + dd;
	 	$('#selectDate').attr('min', today);
 });
	
 		// 날짜 선택 시
		$('#selectDate').on('change', function() {
			var selectedDate = $(this).val();
			$('.res-btn').removeClass('disable');
			$('.res-btn').attr('disabled', false);
			$('.res-btn').css('background-color', 'white');
			$.ajax({
				url: 'selectDate',
				type: 'post',
				data: {
					date : $(this).val()
				},
				dataType: 'json',
				success: function(data) {
					console.log(data);
					if (data.length < 0) {
						
					} else {
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
												$(this).addClass('disable');
												$('.res-btn').css('background-color', 'white');
												$('.disable').css('background-color', 'dimgrey');
												$(this).attr('disabled',  true);
										}
								})
							
						});
					}
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
	 			 $('.selectDate').css('focus', true)
	 			 return false;
	 		 }
	 		 
		 	 $('.res-btn').css('background-color', 'white');
		 	 $('.disable').css('background-color', 'dimgrey');
	 		 $(this).css('background-color', 'darksalmon');
	 		 $('#roomTime').val($(this).text());
	 		 $('#roomNo').val($(this).val());
	 		 $('#reservedRoom').text($('#roomTitle').val());
	 		 $('#reservedRoomTime').text($(this).text());
	 		 
 	 });
 	
     	/*  [인원] 라디오 버튼 선택 시 발생  */
       $('input:radio[name=participant]').on('click', function() {
	     	var price = 22000;
     		var participant = $('#participant:checked').val();
		   	var total = price * participant;
		   	$('#selectPrice').text(total);
		   	$('#price').val(total);
	   	});
     	
     	// 예약하기 버튼 클릭 시
     	$('#reservationBtn').on('click', function() {
     		if ( $('#roomTime').val() == '') {
     			alert('원하는 시간대를 선택해주세요.');
     			return false;
     		}
     		if (!$('input:radio[name=participant]:checked').val()) {
     			alert('인원 수를 선택해주세요.');
     			return false;
     		}
     		if(!$('#yes').is(':checked')) {
     			alert('이용약관 및 개인정보취급방침에 동의해주세요.')
     			return false;
     		}
     		
     		alert("예약되었습니다.");
     		return true;
     	});
 </script>
 </body>
 </html>