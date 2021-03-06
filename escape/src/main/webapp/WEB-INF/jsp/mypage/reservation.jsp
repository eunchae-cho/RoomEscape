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
	        
	        <div class="mypage-container">
	         <div class="my_wrap">
	        	
	         <jsp:include page="./sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">예약 내역</h5>
	        		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 11%">예약 번호</th>
					      <th scope="col" style="width: 15%">예약 날짜</th>
					      <th scope="col" style="width: 11%">시간</th>
					      <th scope="col" style="width: 24%">룸 테마</th>
					      <th scope="col" style="width: 10%">상태</th>
					      <th scope="col" style="width: 15%"></th>
					    </tr>
					  </thead>
					  <tbody style="border-bottom: #41464b; border-bottom-style: hidden;">
					    <c:forEach items="${list}" var="res">
						    <tr>
						      <td style="padding-block: 15px;">${res.no}</td>
						      <td style="padding-block: 15px;">${res.doDate}</td>
						      <td style="padding-block: 15px;">${res.roomTime}</td>
						      <td style="padding-block: 15px;">${res.room.title}</td>
						       <td id="td_status" style="padding-block: 15px;"><input type="hidden" id="status" value="${res.status}"></td>
						       <td style="padding-block: 15px;">
						       <c:if test="${res.cancel == 0}">
					       		<button type="button" class="btn btn-cancel me-2 cancelBtn" value="${res.no}">예약 취소</button>
					       	   </c:if></td>
						    </tr>
					     </c:forEach>
					  </tbody>
					</table>
	        	</div>
	        </div>
	        
	    	</div>
	     </div>
	  </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script>
	// 예약 취소 버튼 클릭 시
	$('.cancelBtn').on('click', function() {
		var result = confirm('예약을 취소 하시겠습니까?');
		if(result) {
			alert('예약이 취소되었습니다.');
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