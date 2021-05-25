<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 룸테마</title>
  </head> 
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  

  <main>
    <div class="container marketing" style="padding-top: 100px;">

      <c:forEach items="${roomList}" var="room">
          <div class="row featurette">
            <div class="col-md-7">
              <h2 class="featurette-heading"><a href="./detail?no=${room.no}" class="nav-link px-2" style="color: indianred;">${room.title}</a></h2><br>
              <p class="lead">난이도: &nbsp ${room.level}</p>
              <p class="lead">인원: &nbsp ${room.participant} &nbsp 명</p>
            </div>
            <div class="col-md-5">
              <img src="${room.photo}" width="500px" height="500px">
                <image xlink:href="${room.photo}" x="0" y="0"/></svg>
            </div>
          </div>
          <hr class="featurette-divider">
      </c:forEach>
    </div>
  </main>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  </body>
  </html>