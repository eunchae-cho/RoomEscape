<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 예약 확인 </title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	          <div class="carousel-inner">
	            <div class="carousel-item active">
	              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"fill="#212121" stroke="#808080"/></svg>
	              <div class="container">
	                <div class="carousel-caption">
	                  <h1>회원 정보</h1>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	        
	        <div class="mypage-container">
	        <h3 style="margin-left: 70px;"><a href="<%=request.getContextPath()%>/mypage/" style="text-decoration: none; color: white;">내 정보</a></h3>
	        <hr class="featurette-divider">
	        
	        <div class="category-container">
	       	  <jsp:include page="./sidebar.jsp"></jsp:include>  
	        
		        <div class="item" style="flex-grow: 2;">
		        	<table class="table table-sm">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 10%">예약 번호</th>
					      <th scope="col" style="width: 15%">날짜</th>
					      <th scope="col" style="width: 15%">시간</th>
					      <th scope="col" style="width: 30%">룸 테마</th>
					      <th scope="col" style="width: 15%">상태</th>
					      <th scope="col" style="width: 15%"></th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${list}" var="res">
					    <tr>
					      <td scope="row">${res.no}</td>
					      <td>${res.reservatedDate}</td>
					      <td>${res.roomTime}</td>
					      <td>${res.room.title}</td>
					      <td id="td_status"><input type="hidden" id="status" value="${res.status}"></td>
					       <c:if test="${res.cancel == 0}">
					       		<td><button type="button" id="cancelBtn" class="btn btn-cancel me-2" value="${res.no}">예약 취소</button></td>
					       </c:if>
					    </tr>
					    </c:forEach>
					  </tbody>
					</table>
		        </div>
	        </div>
	        
	        <hr class="featurette-divider">
	    	</div>
	     </div>
	  </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script>
	// 로그아웃 버튼 클릭 시
	$('#logout').on('click', function() {
		var result = confirm('로그아웃 하시겠습니까?');
		if(result) {
			location.replace('<%=request.getContextPath()%>/auth/logout');
		} else {
		}
	});
	
	// 예약 취소 버튼 클릭 시
	$('#cancelBtn').on('click', function() {
		var result = confirm('예약을 취소 하시겠습니까?');
		if(result) {
			location.href = "<%=request.getContextPath()%>/mypage/cancel?no=" + $(this).val();
		} else {
		}
	});
	
	$(function() {
		// 상태 번호별로 알맞게 출력
		var length = $('.table tbody tr').length;
		
		for(var i = 0; i < length; i++) {
			var status = $('#status').val();
			console.log(status);
			if(status == 0) {
			  	$('.table tbody tr')[i].children[4].innerText = '예약';
			} else if (status == 1) {
				$('.table tbody tr')[i].children[4].innerText = '취소';
			} 
		}
	});
</script>
 </body>
 </html>