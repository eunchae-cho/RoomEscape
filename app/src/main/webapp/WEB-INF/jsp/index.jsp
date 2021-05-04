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
          
        <c:forEach items="${roomList}" var="room">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
              <div class="container">
                <div class="carousel-caption">
                  <h1><a href="room/detail?no=${room.no}">${room.title}</a></h1>
                  <p>${room.content}</p>
                </div>
              </div>
            </div>
           </div>
       </c:forEach>
         
          <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">왼쪽으로 넘기기</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">오른쪽으로 넘기기</span>
          </button>
        </div>
  
	   <c:forEach items="${roomList}" var="room">
	      <hr class="featurette-divider">
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading"><a href="room/detail?no=${room.no}">${room.title}</a></h2>
	          <p class="lead">${room.content}</p>
	        </div>
	        <div class="col-md-5">
	          <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>
	        </div>
	      </div>
	      <hr class="featurette-divider">
	  </c:forEach>
  </div>
   
      <script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
  </html>