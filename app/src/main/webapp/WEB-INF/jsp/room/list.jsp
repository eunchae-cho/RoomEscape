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
    <div class="container marketing" style="padding-top: 100px;">

      <c:forEach items="${roomList}" var="room">
          <div class="row featurette">
            <div class="col-md-7">
              <h2 class="featurette-heading"><a href="./detail?no=${room.no}" class="nav-link px-2" style="color: coral;">${room.title}</a></h2><br>
              <p class="lead">${room.level}</p>
              <p class="lead">${room.participant}명</p>
              <p class="lead">${room.content}</p>
              <br><br>
              <a href="#" style="font-size: 20px;">예약하러 가기>></a>
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

  <!-- <jsp:include page="../footer.jsp"></jsp:include>   -->
  <script src="/<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
  </html>