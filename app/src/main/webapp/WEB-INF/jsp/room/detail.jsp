<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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
<jsp:include page="../header.jsp"></jsp:include>  

<main>
  <div class="container marketing" style="padding-top: 50px;">
      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
              <div class="container">
                <div class="carousel-caption">
                  <h1>테마 보기</h1>
                  <p>원하는 테마 정보를 살펴보세요!</p>
                </div>
              </div>
            </div>
          </div>
      </div>

      <div style="text-align: center; margin-top: 200px;">
        <img src="${room.photo}" width="500" height="500">
      </div>
      <div class="col-md-5" style="margin: 0 auto; margin-bottom: 200px; text-align: center;">
        <h2 style="text-align: center; padding-block:50px;">${room.title}</h2>
        <p style="text-align: center;">${room.level}</p>
        <p style="text-align: center;">${room.participant}명</p>
        <p style="text-align: center;">${room.content}</p>
    </div>
  </div>

      <hr class="featurette-divider">

</main>

<!-- <jsp:include page="../footer.jsp"></jsp:include>   -->
<script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>