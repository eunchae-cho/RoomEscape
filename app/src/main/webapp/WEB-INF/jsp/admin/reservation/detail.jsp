<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 예약 상세 보기</title>

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
 <h3 style="margin-block: 50px; border-bottom: solid;">예약 상세 보기</h3>  
 
  <div style="margin: 50px;">
    <p ><b style="background: turquoise;">사용자 정보</b></p>
	 <div style="margin-bottom: 10px; margin-left: 20px;">
	 	<label><b>예약자:</b> </label>
	 	<div style="width: 94%; float: right; padding-left: 15px;">${res.user.name}</div>
	</div>
	<div style="margin-left: 20px;">
 	 	<label><b>전화번호: </b></label>
	 	<div style="width: 94%; float: right; padding-left: 15px;">${room.user.phone}</div>
	</div>
	
	<hr style="margin-block: 30px;">
	
	<p><b style="background: turquoise;">예약 정보</b></p>
	<div style="margin-block: 10px; margin-left: 20px;">
	    <p style="color: darkgrey"><b>예약번호:</b>&emsp;&nbsp;${res.no}</p>
	    <p style="color: darkgrey"><b>예약날짜:</b> &emsp;&nbsp;${res.reservatedDate}</p>
	    <br>
	    <p><b>이용날짜:</b> &emsp;&nbsp;${res.doDate}</p>
		<p><b>이용시간:</b> &emsp;&nbsp;${res.roomTime}</p>
		<p><b>룸 테마:</b> &emsp;&nbsp;${res.room.title}</p>
		<p><b>예약인원:</b> &emsp;&nbsp;${res.participant}</p>
		<p><b>결제금액:</b> &emsp;&nbsp;${res.price}</p>
		<br>
		<div style="display:inline-flex;"><label><b>예약상태:</b></label><p id="status" style="margin-left: 25px;">${res.status}</p></div>
		<p><b>탈출여부:</b> &emsp;&nbsp;${res.escape}</p>
	</div>
 </div>
 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$(function() {
	console.log($('#status').val())
	if ($('#status').text() == 0) {
		$('#status').text('예약');
	} else if ($('#status').text() == 1) {
		$('#status').text('예약취소');
	} else if ($('#status').text()== 2) {
		$('#status').text('종료');
		}
});
</script>
</body>
</html>