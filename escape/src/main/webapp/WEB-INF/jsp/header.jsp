<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sdc.escape.domain.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.rtl.css?var=2"  rel="stylesheet"  >
<link href="<%=request.getContextPath() %>/bootstrap/css/style.css?var=2" rel="stylesheet">
</head>
<body>
    <header class="bg-dark d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <p class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none"></p>
        
         <input type="hidden" id="loginUser" value="${sessionScope.loginUser}">
    
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="<%=request.getContextPath()%>/" class="nav-link px-2 font-light" style="font-weight: 700">Home</a></li>
          <li><a href="<%=request.getContextPath()%>/room/list" class="nav-link px-2 font-light" style="font-weight: 700">Room</a></li>
          <li><a href="<%=request.getContextPath()%>/reservation/" class="nav-link px-2 font-light needLogin" onClick="checkLogin()" style="font-weight: 700; color: #fff;">Reservation</a></li>
          <li><a href="<%=request.getContextPath()%>/mypage/" class="nav-link px-2 font-light needLogin" onClick="checkLogin()" style="font-weight: 700; color: #fff;">My page</a></li>
        </ul>
        
        <c:if test="${not empty sessionScope.loginUser}">
        <div class="col-md-3 text-end" style="display: flex;">
        	<p style="margin: auto; margin-inline: 20px;"><u><b>${loginUser.name}</b></u> 님, 반갑습니다!</p>
        	<button type="button" id="logout" class="btn btn-outline-color">로그아웃</button>
        </div>
        </c:if>
        
        <c:if test="${empty sessionScope.loginUser}">
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-color me-2" onClick="location.href='<%=request.getContextPath()%>/auth/login'" style="margin-right: 2px;">로그인</button>
          <button type="button" class="btn btn-outline-color" onClick="location.href='<%=request.getContextPath()%>/auth/signup'">회원가입</button>
        </div>
        </c:if>
      </header>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
	// 로그아웃 버튼 클릭 시
	$('#logout').on('click', function() {
		var result = confirm('로그아웃 하시겠습니까?');
		if(result) {
			location.replace('<%=request.getContextPath()%>/auth/logout');
		} else {
		}
	});
	
	// 로그인이 필요한 링크 알림 설정
	function checkLogin() {
		var loginUser = $('#loginUser').val();
		 console.log(loginUser);
		if (loginUser == '') {
			alert('로그인이 필요합니다.');
			$('.needLogin').attr('href', '<%=request.getContextPath()%>/auth/login');
		}
	};
</script>
</body>
</html>