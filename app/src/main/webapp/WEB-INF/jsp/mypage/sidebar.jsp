<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>마이페이지 - 사이드바</title>
  </head>
  <body>
  
  <div class="item"  style="width: 250px;">
	 <p>아이디: &nbsp; ${sessionScope.loginUser.id}</p>
	 <p>이름: &nbsp; ${sessionScope.loginUser.name}</p>
	 <button type="button" class="btn btn-style" id="logout">로그아웃</button>
	 <hr class="featurette-divider" style="margin: 0; margin-block: 30px;">
	 <h5><a href="<%=request.getContextPath()%>/mypage/reservation" id="category">예약 확인</a></h5>
     <h5 ><a href="<%=request.getContextPath()%>/mypage/history">이용 내역</a></h5>
      <h5><a href="#">내 리뷰 보기</a></h5>
  </div>

</body>
</html>