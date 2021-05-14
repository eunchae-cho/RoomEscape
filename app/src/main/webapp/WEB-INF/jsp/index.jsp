<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>index</title>
  </head>
  <body>
  <jsp:include page="./header.jsp"></jsp:include>  
<main>
  <div class="container marketing" style="padding-top: 50px;">
        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
            
          <c:forEach items='${roomList}' var="room">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/>
               </svg>
                <div class="container">
                  <div class="carousel-caption">
                    <h1><a href='./room/detail?no=${room.no}' class="nav-link px-2" style="color: aliceblue;   text-shadow: 1px 1px black;">${room.title}</a></h1>
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
    
          <hr class="featurette-divider">

          <div class="album py-5">
            <div class="container">
        
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                  <div class="card shadow-sm" style="background-color: black;">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder:" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect></svg>
        
                    <div class="card-body">
                      <p class="card-text">이벤트 제목</p>
                      <p class="card-text">내용</p>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <div class="card shadow-sm" style="background-color: black;">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder:" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect></svg>
        
                    <div class="card-body">
                      <p class="card-text">이벤트 제목</p>
                      <p class="card-text">내용</p>
                    </div>
                  </div>
                </div>
            
              </div>
            </div>
          </div>
    </div>
  </main>
 
  <jsp:include page="./footer.jsp"></jsp:include>  
  <script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
  </html>