<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 리뷰 - 상세 보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  </head>
  <body>
  <jsp:include page="../../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        
	        <div class="mypage-container">
	        <div class="my_wrap">
	        	
	         <jsp:include page="../sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right">
	        	<div style="border-bottom: solid">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">리뷰 상세 보기</h5>
	        	</div>
	        	<div style="margin: 30px; margin-top: 50px; font-size: 14px;">
		          <div style="margin-block: 10px;">
		        		<label>룸 테마: </label><span style="margin-left: 35px;">${res.room.title}</span>
		          </div>
		          <div style="margin-block: 10px;">
		        		<label>이용 날짜: </label><span style="margin-left: 20px;">${res.doDate}</span><br>
		          </div>
		          <div style="margin-block: 10px;">
		        		<label>이용 시간: </label><span style="margin-left: 20px;">${res.roomTime}</span><br>
		          </div>
		          <div  style="margin-block: 10px; padding-bottom: 30px; border-bottom: solid; border-width:thin;">
		        		<label>탈출: </label><span style="margin-left: 50px;">${res.escape} <c:if test="${res.escape == '성공'}">(${res.escapedTime})</c:if></span>
		          </div>
	        	 </div>
	        	 
    			<article class="review-list">
    				<div class="review-photo" style="margin-bottom: 50px;">
    				<c:forEach items="${photoList}" var="photo">
    					<c:if test="${photo.revNo == rev.no}">
    					<div class="review-photo-list">
    						<img class="reivew-img" src="<%=request.getContextPath()%>/upload/${photo.photo}">
    					</div>
    					</c:if>
    				</c:forEach>
    				</div>
    				<div class="review-cdt" style="margin-bottom: 30px;">
    					<label style="font-size: 14px;">작성일: </label>  &emsp; ${rev.createdDate}
    				</div>
    				<div class="review-title">
    					<label style="font-size: 14px;">제목: </label>  &emsp; ${rev.title}
    				</div>
    				<br>
    				<div class="review-content-conainer">
    					<label style="font-size: 14px;">내용: </label>
    					<div class="review-content" style="font-size: 14px; margin: 0 30px 30px 47px;">
    						${rev.content}
    					</div>
    				</div>
    			</article>
    			
	    			<div class="modal" tabindex="-1">
					  <div class="modal-dialog" style="margin: 0 auto; margin-top: 70px; max-width: 700px; color: black;">
					    <div class="modal-content" style="width: 100%; height: auto;">
					      <div class="modal-header">
					        <h5 class="modal-title">갤러리</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin: 0;"></button>
					      </div>
					      <div class="modal-body" style="margin: 0 auto;">
					      	<div style="margin-block: 100px; max-width: 500px;">
					       	 	<img id="modal-img" class="gallery-img" src="" 
	    						alt="갤러리 이미지" title="갤러리 상세 보기" style="width: 100%; height: auto;">
	    					</div>
	    					<div>
	    					</div>
					      </div>
					    </div>
					  </div>
					</div>
		        	
	        	</div>
	        </div>
	        
	    	</div>
	    </div>
	 </main>

 <jsp:include page="../../footer.jsp"></jsp:include>  
 <script>
	
	$('.reivew-img').on('click', function(e) {
		e.preventDefault();
		$('.modal').modal('show');
		
		var src = $(this).attr('src');
		$('#modal-img').attr('src', src);
	});
	
 </script>
 </body>
 </html>