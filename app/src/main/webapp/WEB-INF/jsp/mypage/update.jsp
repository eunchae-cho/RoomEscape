<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 회원 정보 수정</title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	          <div class="carousel-inner">
	            <div class="carousel-item active">
	              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#212121" stroke="#808080"/></svg>
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
	       	 <div class="item"  style="width: 250px;">
			        <p>아이디: &nbsp; ${sessionScope.loginUser.id}</p>
			        <p>이름: &nbsp; ${sessionScope.loginUser.name}</p>
			         <button type="button" class="btn btn-style" id="logout">로그아웃</button>
			        <hr class="featurette-divider" style="margin: 0; margin-block: 30px;">
			        <h5><a href="<%=request.getContextPath()%>/mypage/reservation" id="category">예약 확인</a></h5>
			        <h5 ><a href="#">이용 내역</a></h5>
			        <h5><a href="#">내 리뷰 보기</a></h5>
		        </div>
	          
		        <div id="edit" class="item" style="flex-grow: 2;">
			      <form action="update" method="post">
			      	<input type="hidden" name="no" value="${sessionScope.loginUser.no}">
		        	<div style="width: 500px; margin: 0 auto;">
			        	<p>아이디: &emsp;&emsp;&emsp;&emsp;&emsp; ${sessionScope.loginUser.id}</p>
			        	<p>이름: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ${sessionScope.loginUser.name}</p>
			        	<div style="margin-bottom: 1rem;">
				        	<label for="email">이메일: </label>
				        	<input type="email"  id="email" name="email" class="inputBox" style="margin-left: 79px;" value="${sessionScope.loginUser.email}" required>
			        		<div id="email-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="phone">연락처: </label>
			        		<input type="tel" id="phone" name="phone" class="inputBox" style="margin-left: 79px;" value="${sessionScope.loginUser.phone}" required>
			        		<div id="phone-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="password">새 비밀번호: </label>
			        		<input type="password" id="password" name="password" class="inputBox" style="margin-left: 44px;" minlength="8" maxlength="16" required>
							<div id="password-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>	        	    
		        	    </div>
		        	    <div style="margin-bottom: 1rem;">
			        		<label for="againPassword">새 비밀번호 확인: </label>
			        		<input type="password" id="confirmPassword" name="confirmPassword" class="inputBox"minlength="8" maxlength="16" required>
			        		<div id="confirmPassword-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px;"></div>
		        	    </div>
		        	</div>
		        	<div style="text-align: center; margin-top: 50px;">
		        	<button type="submit" id="updateBtn" class="btn btn-style">수정</button>
		        	</div>
				 </form>
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
	
	// 수정 버튼 클릭 시
	$('#updateBtn').on('click', function() {
		 if (!checkEmail($('#email').val())) {
			return false;
		}
		 if (!checkPhone($('#phone').val())) {
			 return false;
		 }
		 if (!checkPassword($('#password').val())) {
			 return false;
		 } 
		 if (!checkConfirm()) {
			 return false;
		 }
			 confirm('수정하시겠습니까?');
			 return true;
	});
	
	function empty(value) {
		if (value == '') {
			return true;
		}
		return false;
	}
	
	function checkEmail(email) {
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		if (!emailRegExp.test(email) || empty(email)) {
			$('#email-feedback').html('이메일 형식으로 입력해주세요.');
			return false;
		}
		return true;
	}
	
	function checkPhone(phone) {
		var phoneRegExp = /^0[0-9]{1,2}-[0-9]{3,4}-[0-9]{4}$/;
		if (!phoneRegExp.test(phone) || empty(phone)) {
			$('#phone-feedback').html(' "-"을 포함해 입력해주세요.');
		}
		$('#phone-feedback').html('');
		return true;
	}
	
	// 비밀번호 조건 확인
	function checkPassword(password) {
		if (password < 8 || password > 16 || empty(password)) {
			$('#password-feedback').html('최소 8 ~ 16자 이내로 입력해주세요.');
			return false;
		}
		$('#password-feedback').html('');
		return true;
	}
	
	function checkConfirm() {
		// 비밀번호 확인
	 	$('#confirmPassword').on('keyup', function(){
	 		if ($('#password').val() == $('#confirmPassword').val()) {
	 			$('#confirmPassword-feedback').css('color', 'lightgreen');
	 			$('#confirmPassword-feedback').html('  비밀번호가 일치합니다.');
	 			return true;
	 		}	else {
	 			$('#confirmPassword-feedback').css('color', 'crimson');
	 			$('#confirmPassword-feedback').html('  비밀번호가 같지 않습니다.');
	 			return false;
	 		}
	 	});
	}
	
</script>
 </body>
 </html>