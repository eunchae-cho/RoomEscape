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
	         <jsp:include page="./sidebar.jsp"></jsp:include>  
	          
		        <div id="edit" class="item" style="flex-grow: 2;">
			      <form action="update" method="post">
			      	<input type="hidden" name="no" value="${sessionScope.loginUser.no}">
		        	<div style="width: 500px; margin: 0 auto;">
			        	<p>아이디: &emsp;&emsp;&emsp;&emsp;&emsp; ${sessionScope.loginUser.id}</p>
			        	<p>이름: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ${sessionScope.loginUser.name}</p>
			        	<div style="margin-bottom: 1rem;">
				        	<label for="email">이메일: </label>
				        	<input type="email"  id="email" name="email" class="inputBox" style="margin-left: 79px;" value="${sessionScope.loginUser.email}">
			        		<div id="email-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="phone">연락처: </label>
			        		<input type="tel" id="phone" name="phone" class="inputBox" style="margin-left: 79px;" value="${sessionScope.loginUser.phone}">
			        		<div id="phone-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="password">새 비밀번호: </label>
			        		<input type="password" id="password" name="password" class="inputBox" style="margin-left: 44px;" minlength="8" maxlength="16">
							<div id="password-feedback" style="padding-left: 28%; margin-top:3px; font-size: 14px; color: crimson;"></div>	        	    
		        	    </div>
		        	    <div style="margin-bottom: 1rem;">
			        		<label for="againPassword">새 비밀번호 확인: </label>
			        		<input type="password" id="confirmPassword" name="confirmPassword" class="inputBox"minlength="8" maxlength="16">
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
	// 수정 버튼 클릭 시
 	$('#updateBtn').on('click', function() {
 		var resultEmail = checkEmail($('#email').val());
 		var resultPhone = checkPhone($('#phone').val());
 		var resultPassword = checkPassword($('#password').val());
 		var resultConfirmPassword = checkAgainPassword($('#password').val(), $('#confirmPassword').val());
		var validCnt = resultEmail + resultPhone + resultPassword + resultConfirmPassword;
		 
		 if (validCnt == 0) {
			 var result = confirm('수정 하시겠습니까?');
				if(result) {
					location.href('<%=request.getContextPath()%>/mypage/');
				} else {
					return false;
				}
		 } else {
			 return false;
		 }
 	});
	
	// 값이 비었는지 확인
	function checkEmpty(value) {
		if (value == '') {
			return true;
		}
		return false;
	}
	
	// 이메일 확인
	function checkEmail(email) {
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		if (!emailRegExp.test(email) || checkEmpty(email)) {
			$('#email-feedback').html('이메일 형식으로 입력해주세요.');
			return 1;
		}
		return 0;
	}
	
	// 연락처 확인
	function checkPhone(phone) {
		var phoneRegExp = /^0[0-9]{1,2}-[0-9]{3,4}-[0-9]{4}$/;
		if (!phoneRegExp.test(phone) || checkEmpty(phone)) {
			$('#phone-feedback').html(' "-"을 포함해 입력해주세요.');
			return 1;
		}
		$('#phone-feedback').html('');
		return 0;
	}
	
	// 새 비밀번호 확인 
	function checkPassword(password) {
		if (password.length< 8 || password.length > 16) {
			$('#password-feedback').html('최소 8 ~ 16자 이내로 입력해주세요.');
			return 1;
		}
		$('#password-feedback').html('');
		return 0;
	}
	
	// 새 비밀번호 확인의 확인
	function checkAgainPassword(password, confirmPassword) {
		if (password != confirmPassword || checkEmpty(confirmPassword)) {
			$('#confirmPassword-feedback').css('color', 'crimson');
	 		$('#confirmPassword-feedback').html('비밀번호가 같지 않습니다.');
			return 1;
		}
		$('#confirmPassword-feedback').html('');
		return 0;
	}
	
	// 비밀번호 확인
	$('#confirmPassword').on('keyup', function() {
	 	if ($('#password').val() == $('#confirmPassword').val()) {
	 		$('#confirmPassword-feedback').css('color', 'lightgreen');
	 		$('#confirmPassword-feedback').html('비밀번호가 일치합니다.');
	 		return true;
	 	}	else {
	 		$('#confirmPassword-feedback').css('color', 'crimson');
	 		$('#confirmPassword-feedback').html('비밀번호가 같지 않습니다.');
	 		return false;
	 	}
	 });
	
</script>
 </body>
 </html>