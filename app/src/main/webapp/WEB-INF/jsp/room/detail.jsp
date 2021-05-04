<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
  <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.rtl.css?var=2"  rel="stylesheet"  >
  <link href="<%=request.getContextPath() %>/bootstrap/css/index.css?var=2" rel="stylesheet">
</head>
<body>
    <header class="bg-dark d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none">
          <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        </a>
    
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 font-light">Info</a></li>
          <li><a href="#" class="nav-link px-2 font-light">Rooms</a></li>
          <li><a href="#" class="nav-link px-2 font-light">Reservation</a></li>
          <li><a href="#" class="nav-link px-2 font-light">My page</a></li>
        </ul>
    
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2">로그인</button>
          <button type="button" class="btn btn-primary">회원가입</button>
        </div>
      </header>

<div class="container marketing" style="padding-top: 50px;">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
            <div class="container">
              <div class="carousel-caption">
                <h1>${room.title}</h1>
                <p>${room.content}</p>
              </div>
            </div>
          </div>
        </div>
     </div>

     <div class="col-md-5" style="margin: 0 auto; margin-block: 200px; text-align: center;">
      <img width="500" height="500">
      <h2 style="text-align: center; padding-block:50px;">${room.title}</h2>
      <p style="text-align: center;">${room.content}</p>
  </div>
</div>

    <hr class="featurette-divider">
<script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>