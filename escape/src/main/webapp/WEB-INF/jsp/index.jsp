<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>room escape</title>
  </head>
  <body>
  <jsp:include page="./header.jsp"></jsp:include>  
<main>
  <div class="container marketing" style="padding-top: 50px;">
     <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        
	   <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	    <div class="carousel-indicators">
	      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
	      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    </div>
	    
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	      <img src="<%=request.getContextPath()%>/img/${roomList[0].photo}" class="bd-placeholder-img" style="height: auto; filter: brightness(50%);">
	        <div class="container">
	          <div class="carousel-caption" style="text-shadow: 6px 2px 2px black;">
	            <h1><a href="./room/detail?no=${roomList[0].no}" style="text-decoration: none; color: white;">${roomList[0].title}</a></h1>
	            <br>
	            <p>${roomList[0].content}</p>
	          </div>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="<%=request.getContextPath()%>/img/${roomList[1].photo}" class="bd-placeholder-img" style="height: auto; filter: brightness(50%);">
	
	        <div class="container">
	          <div class="carousel-caption" style="text-shadow: 6px 2px 2px black;">
	           <h1><a href="./room/detail?no=${roomList[1].no}" style="text-decoration: none; color: white;">${roomList[1].title}</a></h1>
	            <br>
	            <p>${roomList[1].content}</p>
	          </div>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img src="<%=request.getContextPath()%>/img/${roomList[2].photo}" class="bd-placeholder-img" style="height: auto; filter: brightness(50%);">
	
	        <div class="container">
	          <div class="carousel-caption" style="text-shadow: 6px 2px 2px black;">
	           <h1><a href="./room/detail?no=${roomList[2].no}" style="text-decoration: none; color: white;">${roomList[2].title}</a></h1>
	            <br>
	            <p>${roomList[2].content}</p>
	          </div>
	        </div>
	      </div>
	      </div>
	    </div>
	   <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">왼쪽으로 넘기기</span>
	    </button>
	    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="visually-hidden">오른쪽으로 넘기기</span>
	    </button>
	    
	  </div>
    
          <hr class="featurette-divider">

          <div class="album py-5">
            <div class="container">
            <h3 >■ 이벤트</h3>
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" style="margin-block: 50px;">
                <c:forEach items="${eventList}" var="ev">
                <div class="col">
                  <div class="card shadow-sm" style="background-color: black;">
                    <img src="<%=request.getContextPath()%>/img/${ev.photo}" style="width: 100%; height: 225px;'">
                    <div class="card-body">
                      <p class="card-text">${ev.title}</p>
                      <p class="card-text" style="white-space:pre;">${ev.content}</p>
                    </div>
                  </div>
                </div>
             </c:forEach>
              </div>
              
              <hr class="featurette-divider">
              
              <h3 >■ 주의 사항</h3>
              <div style="margin-block: 100px; margin-inline: 100px; display: flex; flex-direction: column;">
				<div style="display: flex; margin-bottom: 50px;">
					<img src="<%=request.getContextPath()%>/img/icon1.png" style="width: 200px;">
					<div style="flex-grow: 2; padding-block: 52px; margin-left: 80px;">
						<span style="color: yellow;">입장 전 주의사항 설명, 테마 설명 등<br>
<!-- 						기본 숙지사항을 안내</span>해 드립니다.<br> -->
						원활한 게임 진행을 위해 <span style="color: yellow;">입장 10분 전 도착</span>을 권해드립니다.<br>
						<span style="color: yellow;">예약시간에 늦을 경우 플레이시간이 차감</span>될 수 있습니다.
						</div>
				</div>
				  <div style="display: flex; margin-bottom: 50px;">
				  <div style="flex-grow: 2; padding-block: 40px; margin-right: 80px; text-align: right;">입장 전 주의사항 설명, 테마 설명 등<br>
						<span style="color: yellow;">모든 소품과 콘텐츠는 외부로 유출할 수 없습니다.</span><br>
						게임 참여시 기밀 유지에 동의하는 것으로 간주하며 <span style="color: yellow;">고객의 고의 또는 과실로 인하여 내용이 유출될 경우<br>
						민 · 형사상의 책임을 부담</span>할 수 있습니다. 시작 전 <span style="color: yellow;">휴대폰, 카메라, 필기구 등의 촬영 · 기록 장치를<br>
						별도 보관함에 보관</span>해야 합니다.
						</div>
					<img src="<%=request.getContextPath()%>/img/icon2.png" style="width: 200px;">
				</div>
				<div style="display: flex; margin-bottom: 50px;">
					<img src="<%=request.getContextPath()%>/img/icon3.png" style="width: 200px;">
						<div style="flex-grow: 2; padding-block: 40px; margin-left: 80px;">입장 전 주의사항 설명, 테마 설명 등<br>
						테마 진행 공간 안에서 행동 제약이 있을 수 있습니다.<br>
						<span style="color: yellow;">비상시에는 비상 버튼을 이용하여 탈출 및 비치된 인터폰을 이용하여 직원과 연락</span>할 수 있습니다.<br>
						밀폐된 공간에서 진행되므로<span style="color: yellow;"> 화재 위험이 있는 라이터, 성냥 등의<br>
						인화성 물품은 입장 전 별도 보관함</span>에 보관해야 합니다.						
						</div>
				</div>
				<div style="display: flex; margin-bottom: 50px;">
				  <div style="flex-grow: 2; padding-block: 40px; margin-right: 80px; text-align: right;">입장 전 주의사항 설명, 테마 설명 등<br>
						자극적이거나 선정적인 내용이 포함될 수 있습니다.<br>
						따라서 <span style="color: yellow;">노약자, 임산부, 심약자 등의 경우 참여가 제한</span>될 수 있습니다.<br>
						고객들의 안전을 위해 CCTV를 설치, 운영하여 <span style="color: yellow;">비상상황에 즉각 대응</span>할 수 있도록 관리하고 있습니다.<br>
						이외의 <span style="color: yellow;">궁금한 사항은 전화 문의</span>를 통하여 해결해 드립니다.
						</div>
					<img src="<%=request.getContextPath()%>/img/icon4.png" style="width: 200px;">
				</div>
            </div>

			   <hr class="featurette-divider">
			   
			<div>
			 <h3 >■ 찾아오는 길</h3>
			 	<div style="display: flex; margin-top: 100px;">
			 		<div style="flex-grow: 2; text-align: right; margin-right: 50px; border-right: solid; border-width: thin; padding-right: 50px; padding-block: 68px;">
			 			우편번호 01010<br>
						서울특별시 00구 000로 00길 00<br>
						0000건물<br><br>
						<span style="border-weight: 700">룸 이스케이프</span><br>
			 		</div>
			 		<div>
			 			<img src="<%=request.getContextPath()%>/img/karte.png" style="width: 300px;">
			 		</div>
			 	</div>
			</div>
			
			</div>
          </div>
    </div>
  </main>
 
  <jsp:include page="./footer.jsp"></jsp:include>  
  </body>
  </html>