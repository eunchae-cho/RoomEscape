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
    		<h4 style="margin: 20px;">Review (65)</h4>
    	</div>
    	<div class="review-container">
    		<section >
    		<div class="gallery">
    			<ul style="position:relative; margin-left: 70px;">
    				<li class="gallery-list"><img class="gallery-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    				<li class="gallery-list"><img class="gallery-img"  src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    				<li class="gallery-list"><img class="gallery-img"  src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    				<li class="gallery-list"><img class="gallery-img"  src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    				<li class="gallery-list"><img class="gallery-img"  src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기"></li>
    				<li class="gallery-list"><img class="gallery-img"  src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg" 
    				data-reviewid="104476367" alt="갤러리 이미지" title="갤러리 상세 보기">
    				</li>
    				<li class="gallery-list-last">
    					<div class="gallery-list-count">55</div>
    					<div class="gallery-list-more">더보기></div>
    				</li>
    			</ul>
    		</div>
    		</section>
    		<section>
    			<article class="review-list">
    				<div class="review-user-info">
    				  	<div class="user-info">
    				  	<span style="font-size:14px;">2021-06-07</span><br>
    				  	<span style="font-size:14px;">닉네임</span>
    				  	</div>				
	    				<div class="do-info">◇  참여 날짜: 2021-06-05</div>
	    				<div class="escape-or-not">◇  탈출 여부: <span style="font-weight: bold; color: darksalmon;">성공 (45분 66초)</span></div>
    				</div>
    				<div class="review-photo">
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    				</div>
    				<div class="review-title">
    					대만족. 조립하고 스스로 정리정돈도합니다..
    				</div>
    				<div class="review-content-conainer">
    					<div class="review-content">
    						레고 첫 시작으로 좋아요.<br>
    						어린 나이에도 할 수 있겠네요.<br>
    						쉬워서 금방 완성합니다.<br>
    						<br>
    					 	너무 강추해요.<br>
    					 	아이들이 좋아해요.<br>
    					 	사시면 후회 안하실 거에요.<br>
    					</div>
    				</div>
    			</article>
    			<hr>
    			<article class="review-list">
    				<div class="review-user-info">
    				  	<div class="user-info">
    				  	<span style="font-size:14px;">2021-06-07</span><br>
    				  	<span style="font-size:14px;">닉네임</span>
    				  	</div>				
	    				<div class="do-info">◇  참여 날짜: 2021-06-05</div>
	    				<div class="escape-or-not">◇  탈출 여부: <span style="font-weight: bold; color: dimgrey;">실패</span></div>
    				</div>
    				<div class="review-photo">
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    					<div class="review-photo-list">
    						<img class="reivew-img" src="https://thumbnail7.coupangcdn.com/thumbnails/local/320/image2/PRODUCTREVIEW/202003/1/2535897684266459244/695e44c6-a354-4185-bbba-e2389d90e881.jpg">
    					</div>
    				</div>
    				<div class="review-title">
    					대만족. 조립하고 스스로 정리정돈도합니다..
    				</div>
    				<div class="review-content-conainer">
    					<div class="review-content">
    						레고 첫 시작으로 좋아요.<br>
    						어린 나이에도 할 수 있겠네요.<br>
    						쉬워서 금방 완성합니다.<br>
    						<br>
    					 	너무 강추해요.<br>
    					 	아이들이 좋아해요.<br>
    					 	사시면 후회 안하실 거에요.<br>
    					</div>
    				</div>
    			</article>
    			<hr>
    		</section>
    	</div>
    </div>
  </div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>  
<script>
//로그인이 필요한 링크 알림 설정
function checkLogin() {
	var loginUser = $('#loginUser').val();
	 console.log(loginUser);
	if (loginUser == '') {
		alert('로그인이 필요합니다.');
		$('.needLogin').attr('href', '<%=request.getContextPath()%>/auth/login');
	}
};
</script>
</body>
</html>