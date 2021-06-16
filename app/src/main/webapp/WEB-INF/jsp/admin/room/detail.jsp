<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 룸 테마 보기</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>
<body>
<jsp:include page="../sidebar.jsp"></jsp:include>  
      
 <main  class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 <h3 style="margin-block: 50px; border-bottom: solid;">룸 테마 보기</h3>  
  <p style="margin-left: 50px;"><b>no. ${room.no}</b></p>
  <div style="margin: 50px;">
  <div style="margin-block: 50px;">
  	<img src="<%=request.getContextPath()%>/img/${room.photo}" style="max-width: 700px;">
  </div>
	 <div style="margin-bottom: 30px;">
	 	<label><b>제목:</b> </label>
	 	<div style="width: 94%; float: right; padding-left: 15px;">${room.title}</div>
	</div>
	<div>
 	 	<label><b>내용: </b></label>
	 	<div style="width: 94%; float: right; padding-left: 15px;">${room.content}</div>
	</div>
	<div style="margin-top: 30px; display: inline-flex;">
		<label><b>시간대: </b></label>
		<div style="margin-left: 30px;">
			<c:forEach items="${roomTimeList}" var="rt">
			${rt.roomTime} <br>
			</c:forEach>
		</div>
	</div>
	<div style="margin-block: 30px;">
		<p style="padding-block: 20px;"><b>난이도:</b> &emsp;&nbsp;${room.level}</p>
		<p><b>추리력:</b> &emsp;&nbsp;${roomAttr.reasoning}</p>
		<p><b>관찰력:</b> &emsp;&nbsp;${roomAttr.observation}</p>
		<p><b>공포:</b> &emsp;&emsp;${roomAttr.horror}</p>
		<p><b>활동력:</b> &emsp;&nbsp;${roomAttr.activity}</p>
		<p style="padding-block: 20px;"><b>참여 가능 인원:</b> &emsp;&nbsp${room.participant} 명</p>
	</div>
	<div style="text-align: center; margin-top: 100px;">
	<button type="button" class="btn btn-secondary updateBtn" style="font-size: 12px;">수정</button>
	<button type="button" class="btn btn-secondary deleteBtn" style="font-size: 12px;">삭제</button>
 	</div>
 </div>
 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$('.updateBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/admin/room/update?no=${room.no}';
	});
	
	$('.deleteBtn').on('click', function() {
		var result = confirm('삭제하시겠습니까?');
		if(result) {
			alert('삭제되었습니다.');
			location.href = '<%=request.getContextPath()%>/admin/room/delete?no=${room.no}';
		} else {
		}
	});
</script>
</body>
</html>