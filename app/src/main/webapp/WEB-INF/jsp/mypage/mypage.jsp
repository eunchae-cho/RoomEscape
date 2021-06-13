<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지</title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        
	        <div class="mypage-container">
	        <div class="my_wrap">
	        	
	         <jsp:include page="./sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right" style="padding-top: 0px;">
	        		<div class="mypage-caution">
	        		* 리뷰 작성은 방탈출 이용 후에만 가능합니다.<br>
	        		* 리뷰 작성은 <i>[나의 예약정보] - [이용 내역] - [리뷰 쓰기]</i> 에서 가능합니다.
	        		
	        		</div>
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">최근 예약</h5>
	        		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 15%">예약 번호</th>
					      <th scope="col" style="width: 20%">예약 날짜</th>
					      <th scope="col" style="width: 20%">시간</th>
					      <th scope="col" style="width: 45%">룸 테마</th>
					    </tr>
					  </thead>
					  <tbody style="border-bottom: #41464b; border-bottom-style: hidden;">
					    <tr>
					      <td style="padding-block: 15px;">${recentRes.no}</td>
					      <td style="padding-block: 15px;">${recentRes.doDate}</td>
					      <td style="padding-block: 15px;">${recentRes.roomTime}</td>
					      <td style="padding-block: 15px;">${recentRes.room.title}   &nbsp;&nbsp;<c:if test="${size != 0}"> 외 ${size}건</c:if></td>
					    </tr>
					  </tbody>
					</table>
	        	</div>
	        </div>
	        
	    	</div>
	    </div>
	 </main>

 <jsp:include page="../footer.jsp"></jsp:include>  
 <script>
	
	// 회원 정보 수정 버튼 클릭 시
	 $('#editBtn').on('click', function() {
		 $.ajax({
			 	url: 'editBtn',
			 	type: 'GET',
			 	success: function(data) {
			 		var htmls = '';
			 		
			 	 	 if (data == 'ok') {
			 		 	htmls += '<div style="width: 500px; margin: 0 auto; text-align: center; margin-block: 100px;">';
			 		 	htmls += '<label for="inputPassword">비밀번호: </label>';
			 		 	htmls += '<input type="password" id="password" name="password" style="margin-inline: 20px">';
			 		 	htmls += '<button type="button" id="passwordBtn" class="btn btn-style">확인</button>';
			 		 	htmls += '</div>';
			 		 	
			 		 	$('#edit').html(htmls);
			 	  	 }
			 	},
			 	error: function() {
			 		console.log('error');
			 	}
		 });
	 });
	
	// 비밀번호 확인 버튼 클릭 시
	$(document).on('click', '#passwordBtn', function() {
		var password = $('#password').val();
		
		$.ajax({
				url: 'confirmPassword',
				type: 'POST',
				data: {
					password : password
				},
				dataType: 'text',
				success: function(data) {
					if (data == 'ok') {
						location.href = '<%=request.getContextPath()%>/mypage/update';
					} else {
						alert('잘못된 비밀번호입니다.');
						location.href = '<%=request.getContextPath()%>/mypage/';
					}
				},
				error: function() {
					console.log('error');
				}
		});
	});
	
	// 비밀번호 입력 후 엔터 시
	$(document).on('keydown', '#password', function(e) {
		if (e.keyCode == 13) {
			$('#passwordBtn').click();
		}
	});
	
	<%-- 
	$(document).ready(function() {
		var loginUserNo= ${sessionScope.loginUser.no};
		
		if (typeof loginUserNo == "undefined") {
			alert('로그인이 필요합니다.');
			location.href = '<%=request.getContextPath()%>/auth/login';
		}
	});

 --%>
 </script>
 </body>
 </html>