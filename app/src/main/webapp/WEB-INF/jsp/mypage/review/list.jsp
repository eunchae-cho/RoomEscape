<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 리뷰</title>
  </head>
  <body>
  <jsp:include page="../../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        
	        <div class="mypage-container">
	        <div class="my_wrap">
	        	
	         <jsp:include page="../sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">리뷰 보기</h5>
	        		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col" style="width: 11%">리뷰 번호</th>
					      <th scope="col" style="width: 20%">사진</th>
					      <th scope="col" style="width: 20%">참여 테마</th>
					      <th scope="col" style="width: 30%">제목</th>
					      <th scope="col" style="width: 13%">작성자</th>
					      <th scope="col" style="width: 11%"></th>
					    </tr>
					  </thead>
					  <tbody style="border-bottom: #41464b; border-bottom-style: hidden;">
					    <c:forEach items="${list}" var="review">
					    	<tr>
						      <td style="height: 150px; table-layout: fixed ;vertical-align: middle;">${review.no}</td>
						      <td style="height: 150px; table-layout: fixed; padding-block: 20px;">
						      	<div style="width: 100px; height: 120px; margin: 0 auto;">
						      	</div>
						      	</td>
						      <td style="height: 150px; table-layout: fixed;word-break:break-all; vertical-align: middle;">${review.room.title}</td>
						      <td style="height: 150px; table-layout: fixed;word-break:break-all; vertical-align: middle;">${review.title}</td>
						      <td style="height: 150px; table-layout: fixed; vertical-align: middle;">${review.user.id}</td>
						      <td style="height: 150px; table-layout: fixed; vertical-align: middle;">
						      	<div style="padding-bottom: 5px;"><a href="" style="color: darksalmon;">수정</a></div>
						      	<div><a href="" style="color: darksalmon;">삭제</a></div>
						      </td>
					   	   </tr>
					    </c:forEach>
					  </tbody>
					</table>
	        	</div>
	        </div>
	        
	    	</div>
	    </div>
	 </main>

 <jsp:include page="../../footer.jsp"></jsp:include>  
 <script>
	
	
 </script>
 </body>
 </html>