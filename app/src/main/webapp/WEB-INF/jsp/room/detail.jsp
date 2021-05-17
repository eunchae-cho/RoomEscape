<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>룸테마보기</title>
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
              <h1>테마 소개</h1>
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
      <p style="text-align: center;">${room.level}</p
      ><br>
      <p style="text-align: center;">인원: ${room.participant} 명</p>
      <p style="text-align: center;">추리력: ${roomAttr.reasoning}</p>
      <p style="text-align: center;">관찰력: ${roomAttr.observation}</p>
      <p style="text-align: center;">공포: ${roomAttr.horror}</p>
      <p style="text-align: center;">활동성: ${roomAttr.activity}</p>
      <br>
      <p style="text-align: center;">${room.content}</p>
    </div>

    <div style="text-align: center;">
      <h3><a href="#">예약하러 가기>></a></h3>
    </div>
  </div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>  
</body>
</html>