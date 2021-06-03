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
	        	
	        	<div class="article_right">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">내 정보</h5>
	        		<div id="edit" class="item" style="flex-grow: 2;  margin-top: 50px;">
		        	<div style="width: 500px; margin: 0 auto;">
			        	<p>아이디: &nbsp; ${sessionScope.loginUser.id}</p>
			        	<p>이름: &nbsp; ${sessionScope.loginUser.name}</p>
			        	<p>이메일: &nbsp; ${sessionScope.loginUser.email}</p>
			        	<p>연락처: &nbsp; ${sessionScope.loginUser.phone}</p>
		        	</div>
		        	<div style="text-align: center; margin-top: 50px;">
		        	<button type="button" id="editBtn" class="btn btn-style">회원 정보 수정</button>
		        	</div>
		        </div>
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