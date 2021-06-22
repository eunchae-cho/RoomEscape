<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>마이페이지 - 사이드바</title>
  </head>
  <body>
  
  	<div class="article_left">
	        		<section class="my_my">
	        			<div style="margin-bottom: 100px;">
	        				<h5>${sessionScope.loginUser.name}</h5>
	        				<ul>
	        					<li></li>
	        					<li></li>
	        				</ul>
	        			</div>
	        		</section>
	        			<section class="my_list">
	        			<div>
	        				<h5>나의 예약정보</h5>
	        				<ul>
	        					<li style="font-weight: 100;"><a href="<%=request.getContextPath()%>/mypage/reservation" id="category">예약 확인/취소</a></li>
	        					<li style="font-weight: 100;"><a href="<%=request.getContextPath()%>/mypage/history">이용 내역</a></li>
	        				</ul>
	        			</div>
	        		</section>
	        			<section class="my_list">
	        			<div>
	        				<h5>나의 리뷰보기</h5>
	        				<ul>
	        					<li style="font-weight: 100;"><a href="<%=request.getContextPath()%>/mypage/review/list">리뷰 조회</a></li>
	        				</ul>
	        			</div>
	        		</section>
	        		<section class="my_list">
	        			<div>
	        				<h5>나의 계정설정</h5>
	        				<ul>
	        					<li style="font-weight: 100;"><a href="<%=request.getContextPath()%>/mypage/info">회원 정보 수정</a></li>
	        					<li id="removeAccount" style="font-weight: 100; cursor: pointer;">회원 탈퇴</li>
	        				</ul>
	        			</div>
	        		</section>
	   </div>

</body>
<script>
//로그아웃 버튼 클릭 시
$('#logoutSidebar').on('click', function() {
	var result = confirm('로그아웃 하시겠습니까?');
	if(result) {
		location.replace('<%=request.getContextPath()%>/auth/logout');
	} else {
	}
});

// 회원탈퇴 버튼 클릭 시
$('#removeAccount').on('click', function() {
	window.open('<%=request.getContextPath()%>/mypage/account/delete', '회원탈퇴', 'width=700px, height=500px, crollbar=yes');
});
</script>
</html>