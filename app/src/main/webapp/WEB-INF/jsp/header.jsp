<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sdc.escape.domain.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.rtl.css?var=2"  rel="stylesheet"  >
<link href="<%=request.getContextPath() %>/bootstrap/css/style.css?var=2" rel="stylesheet">
</head>
<body>
    <header class="bg-dark d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <p class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none"></p>
    
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="<%=request.getContextPath()%>/" class="nav-link px-2 font-light">Home</a></li>
          <li><a href="<%=request.getContextPath()%>/room/list" class="nav-link px-2 font-light">Rooms</a></li>
          <li><a href="<%=request.getContextPath()%>/reservation/form" class="nav-link px-2 font-light">Reservation</a></li>
          <li><a href="#" class="nav-link px-2 font-light">My page</a></li>
        </ul>
        
        <c:if test="${not empty sessionScope.loginUser}">
        <div class="col-md-3 text-end" style="display: flex; justify-content: space-around; width: 280px; margin-right: 50px;">
        	<p style="color: darksalmon; margin: auto;">${loginUser.name}님, 반갑습니다!</p>
        	<button type="button" class="btn btn-primary" onClick="location.href='<%=request.getContextPath()%>/auth/logout'">로그아웃</button>
        </div>
        </c:if>
        
        <c:if test="${empty sessionScope.loginUser}">
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2" onClick="location.href='<%=request.getContextPath()%>/auth/login'">로그인</button>
          <button type="button" class="btn btn-primary" onClick="location.href='<%=request.getContextPath()%>/auth/signup'">회원가입</button>
        </div>
        </c:if>
      </header>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>