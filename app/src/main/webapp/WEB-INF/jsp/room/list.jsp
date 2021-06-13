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
    <div class="container marketing" style="padding-top: 100px; width: 900px;">

      <c:forEach items="${roomList}" var="room">
          <div class="row featurette">
            <div class="col-md-7" style="width: 50%;">
              <h4 class="featurette-heading">
              <a href="./detail?no=${room.no}" class="nav-link px-2" style="color: white; font-family: twaysky;font-size: xx-large; text-shadow: 4px 4px 6px darkgrey;">${room.title}</a>
              </h4><br>
              <div style="margin: 20px;">
	              <p class="lead" style="font-size: 14px; font-weight: 400;''">난이도: &nbsp ${room.level}</p>
	              <p class="lead" style="font-size: 14px; font-weight: 400;'">인원: &nbsp ${room.participant} &nbsp 명</p>
              </div>
            </div>
            <div class="col-md-5" style="width: 50%;">
              <img src="${room.photo}" width="100%" height="100%">
            </div>
          </div>
          <hr class="featurette-divider">
      </c:forEach>
    </div>
  </main>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  </body>
  </html>