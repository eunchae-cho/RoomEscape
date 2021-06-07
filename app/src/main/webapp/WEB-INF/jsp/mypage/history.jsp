<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 이용 내역</title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        
	        <div class="mypage-container">
	        <div class="my_wrap">
	        	
	         <jsp:include page="./sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">이용 내역</h5>
	        		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 11%">예약 번호</th>
					      <th scope="col" style="width: 15%">날짜</th>
					      <th scope="col" style="width: 11%">시간</th>
					      <th scope="col" style="width: 30%">룸 테마</th>
					      <th scope="col" style="width: 10%">상태</th>
					      <th scope="col" style="width: 15%"></th>
					    </tr>
					  </thead>
					  <tbody style="border-bottom: #41464b; border-bottom-style: hidden;">
					      <c:forEach items="${historyList}" var="res">
						    <tr>
						      <td style="padding-block: 15px;">${res.no}</td>
						      <td style="padding-block: 15px;">${res.reservatedDate}</td>
						      <td style="padding-block: 15px;">${res.roomTime}</td>
						      <td style="padding-block: 15px;">${res.room.title}</td>
						       <td id="td_status" style="padding-block: 15px;"><input type="hidden" id="status" value="${res.status}"></td>
						       <td style="padding-block: 15px;"><button type="button" id="reviewBtn" class="btn btn-review me-2" 
						       onClick="location.href='<%=request.getContextPath()%>/mypage/review/add'">리뷰 쓰기</button></td>
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
	$(function() {
		// 상태 번호별로 알맞게 출력
		var length = $('.table tbody tr').length;
		
		for(var i = 0; i < length; i++) {
			var status = $('#status').val();
			if(status == 2) {
			  	$('.table tbody tr')[i].children[4].innerText = '종료';
			} else {
				$('.table tbody tr')[i].children[4].innerText = '';
			} 
		}
	});
	
</script>
 </body>
 </html>