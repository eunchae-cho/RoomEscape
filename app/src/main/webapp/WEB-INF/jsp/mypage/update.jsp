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
	        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	          <div class="carousel-inner">
	            <div class="carousel-item active">
	              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
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
			        	<p>아이디: &nbsp; ${sessionScope.loginUser.id}</p>
			        	<p>이름: &nbsp; ${sessionScope.loginUser.name}</p>
			        	<div style="margin-bottom: 1rem;">
				        	<label for="email">이메일: </label>
				        	<input type="email" name="email" class="inputBox">
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="phone">연락처: </label>
			        		<input type="text" name="phone" class="inputBox">
			        	</div>
			        	<div style="margin-bottom: 1rem;">
			        		<label for="password">비밀번호: </label>
			        		<input type="password" name="password" class="inputBox">
		        	    </div>
		        	    <div style="margin-bottom: 1rem;">
			        		<label for="againPassword">비밀번호 확인: </label>
			        		<input type="password" name="againPassword" class="inputBox">
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
		var result = confirm('수정 하시겠습니까?');
		if(result) {
			location.replace('<%=request.getContextPath()%>/mypage/');
		} else {
		}
	});
</script>
 </body>
 </html>