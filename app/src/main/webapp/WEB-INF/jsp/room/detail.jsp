<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 룸테마보기</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>  

<main>
  <div class="container marketing" style="padding-top: 50px;">
    
    <input type="hidden" id="loginUser" value="${sessionScope.loginUser}">
    
    <div style="margin-block: 100px;">
    	<h1 style="text-align: center; padding-block:50px; font-family: twaysky; text-shadow: 4px 4px 6px darkgrey;">${room.title}</h1>
    </div>
    <div style="text-align: center; margin-top: 50px;">
      <img src="${room.photo}" width="500" height="500">
    </div>
    <div class="col-md-5" style="margin: 0 auto; margin-top: 50px; margin-bottom: 100px; text-align: center;">
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
      <h4><a href="<%=request.getContextPath()%>/reservation/" class="needLogin" onClick="checkLogin()" style="text-decoration: none; color: mediumvioletred;">예약하러 가기 >></a></h4>
    </div>
    
    <div style="margin-top: 300px;">
    	<div class="review-container" style="border-top: solid; border-width: thin;">
    		<h4 style="margin: 20px;">Review (${countReview})</h4>
    	</div>
    	<div class="review-container">
    		<section >
    		<div class="gallery">
    			<ul class="dd" style="position:relative; margin-left: 70px; margin-bottom: 80px;">
    			<c:forEach items="${photoList}" var="ph">
    				<li class="gallery-list">
    				<input type="hidden" id="img" value="${ph.revNo}">
    				<img class="gallery-img" src="<%=request.getContextPath()%>/upload/${ph.photo}"
    				alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    			</c:forEach>
    				<li class="gallery-list-last">
    					<div class="gallery-list-count">${countPhoto}</div>
    					<div class="gallery-list-more">더보기></div>
    				</li>
    			</ul>
    		</div>
    		</section>
    		
    		<section>
    		<c:forEach items="${reviewList}" var="rev">
    			<article class="review-list">
    				<div class="review-user-info">
    				  	<div class="user-info">
    				  	<span style="font-size:14px;">${rev.createdDate}</span><br>
    				  	<span style="font-size:14px;">${rev.user.id}</span>
    				  	</div>	
    				  	<c:forEach items="${resList}"	 var="res">
    				  	  <c:if test="${res.no == rev.resNo}">	
	    					<div class="do-info">◇  참여 날짜: ${res.doDate}</div>
	    					<div class="escape-or-not">◇  탈출 여부: 
	    					<span style="font-weight: bold; color: darksalmon;">${res.escape} 
	    						<%-- <c:if test="${res.escape == '성공'}">(${res.escapedTime})</c:if> --%>
	    						</span></div>
	    					</c:if>
    					</c:forEach>
    				</div>
    				<div class="review-photo">
    				<c:forEach items="${photoList}" var="photo">
    					<c:if test="${photo.revNo == rev.no}">
    					<div class="review-photo-list">
    						<img class="reivew-img" src="<%=request.getContextPath()%>/upload/${photo.photo}">
    					</div>
    					</c:if>
    				</c:forEach>
    				</div>
    				<div class="review-title">
    					${rev.title}
    				</div>
    				<div class="review-content-conainer">
    					<div class="review-content">
    						${rev.content}
    					</div>
    				</div>
    			</article>
    			<hr>
    			</c:forEach>
    		</section>
    		
    		<section>
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
    		</section>
    	</div>
    </div>
  </div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>  
<script>

$(function() {
	console.log($('.gallery-list:eq(3)').html())
	var leng = $('.gallery-list').length;
	for (var i = 7; i < leng; i++) {
		$('.gallery-list:eq(i)').css('display', 'none');
	}
});

//로그인이 필요한 링크 알림 설정
function checkLogin() {
	var loginUser = $('#loginUser').val();
	 console.log(loginUser);
	if (loginUser == '') {
		alert('로그인이 필요합니다.');
		$('.needLogin').attr('href', '<%=request.getContextPath()%>/auth/login');
	}
};

$('.gallery-img').on('click', function(e) {
	e.preventDefault();
	$('.modal').modal('show');
	var src = $(this).attr('src');
	$('#modal-img').attr('src', src);
	
	if (('#img').va l() == ('#img-revNo').val()) {
		$('#review-title').append('${rev.title}');
	}
});

$('.reivew-img').on('click', function(e) {
	e.preventDefault();
	$('.modal').modal('show');
	
	if (('#img').val() == ('#img-revNo').val()) {
		$('#review-title').append('${rev.title}');
	}
});


</script>
</body>
</html>