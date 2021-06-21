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
					      <th scope="col" style="width: 23%">제목</th>
					      <th scope="col" style="width: 21%">참여 테마</th>
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
							      		<c:if test="${photo.photo != null}">
							      			<c:if test="${photo.revNo == review.no}">
							      				<img src="<%=request.getContextPath()%>/upload/${photo.photo}" style="width: 100%; height: auto;">
							      			</c:if>
							      		</c:if>
							      	</div>
						      	</td>
						      <td style="height: 150px; table-layout: fixed;word-break:break-all; vertical-align: middle;">
						      	<a href="<%=request.getContextPath()%>/mypage/review/detail?no=${review.no}" class="review-title">${review.title}</a></td>
						      <td style="height: 150px; table-layout: fixed;word-break:break-all; vertical-align: middle;">${review.room.title}</td>
						      <td style="height: 150px; table-layout: fixed; vertical-align: middle;">${review.user.id}</td>
						      <td style="height: 150px; table-layout: fixed; vertical-align: middle;">
						      	<div style="padding-bottom: 5px;">
						      	<a href="<%=request.getContextPath()%>/mypage/review/update?no=${review.no}" style="color: darksalmon;">수정</a></div>
						      	<div><a href="<%=request.getContextPath()%>/mypage/review/delete?no=${review.no}" onclick="checkDelete();"style="color: darksalmon;">삭제</a></div>
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
	
	function checkDelete() {
		var result = confirm('해당 리뷰를 삭제하시겠습니까?');
		if(result) {
			alert('삭제되었습니다.');
		} else {
			alert('삭제가 취소되었습니다.');
		}
	}
 </script>
 </body>
 </html>