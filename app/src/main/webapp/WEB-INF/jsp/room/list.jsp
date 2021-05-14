<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>index</title>
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  

  <main>
    <div class="container marketing" style="padding-top: 100px;">

      <c:forEach items="${roomList}" var="room">
          <div class="row featurette">
            <div class="col-md-7">
              <h2 class="featurette-heading"><a href="./detail?no=${room.no}" class="nav-link px-2" style="color: coral;">${room.title}</a></h2><br>
              <p class="lead">난이도:  ${room.level}</p>
              <p class="lead">인원:  ${room.participant} 명</p>
            </div>
            <div class="col-md-5">
              <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false">
                <image xlink:href="${room.photo}" x="0" y="0"/></svg>
            </div>
          </div>
          <hr class="featurette-divider">
      </c:forEach>
    </div>
  </main>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  <script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
  </html>