<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 룸 테마 수정</title>

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
      
  <form action="update" method="post" enctype="multipart/form-data">
  <input type="hidden" name="no" value="${room.no}">
 <main  class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 <h3 style="margin-block: 50px; border-bottom: solid;">룸 테마 수정</h3>  
  <div style="margin-block: 50px;">
	 <div class="input-group input-group-sm mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
	  <input type="text" id="title" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${room.title}">
	</div>
	
	<div class="input-group input-group-sm " style="margin-block: 30px;">
 	 <span class="input-group-text">내용</span>
 	 <textarea id="content" name="content" class="form-control" aria-label="With textarea" style="resize: none; height: 300px;" >${room.content}</textarea>
	</div>
	
	<c:forEach items="${roomTimeList}" var="rt">
		<input type="hidden" class="rtList" value="${rt.roomTime}">
	</c:forEach>
	
<p style="font-size: 15px; margin-top: 30px;">시간대 선택</p>
	<div style="display: flex;">
		<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime"  class="form-check-input mt-0 checkRoomTime" type="checkbox" value="10:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="10:00">
		</div>
		<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="12:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="12:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="14:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="14:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="16:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="16:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="18:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="18:00">
		</div>
	</div>
	

	<div style="display: flex;">
		<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="11:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="11:00">
		</div>
		<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="13:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="13:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="15:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="15:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="17:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="17:00">
		</div>
			<div class="input-group mb-3" style="width: 150px; margin-inline: 10px;">
		  <div class="input-group-text">
		    <input name="roomTime" class="form-check-input mt-0 checkRoomTime" type="checkbox" value="19:00" aria-label="Checkbox for following text input">
		  </div>
		  <input type="text" class="form-control" aria-label="Text input with checkbox" value="19:00">
		</div>
	</div>
	
	<div class="input-group mb-3" style="width: 600px; margin-block: 30px;">
	  <label class="input-group-text" for="inputGroupSelect01" style="font-size: 14px;">난이도</label>
	  <select name="level" class="form-select" id="inputGroupSelect01" style="font-size: 14px;">
	    <option selected>선택</option>
	    <option value="1">★☆☆☆☆</option>
	    <option value="2">★★☆☆☆</option>
	    <option value="3">★★★☆☆</option>
	    <option value="4">★★★★☆</option>
	    <option value="5">★★★★★</option>
	  </select>
	</div>
	
  <div class="input-group mb-3" style="width: 600px; margin-block: 30px;">
	  <label class="input-group-text" for="inputGroupSelect01" style="font-size: 14px;">추리력</label>
	  <select name="reasoning" class="form-select" id="inputGroupSelect01" style="font-size: 14px;">
	    <option selected>선택</option>
	    <option value="1">★☆☆☆☆</option>
	    <option value="2">★★☆☆☆</option>
	    <option value="3">★★★☆☆</option>
	    <option value="4">★★★★☆</option>
	    <option value="5">★★★★★</option>
	  </select>
	</div>

 <div class="input-group mb-3" style="width: 600px; margin-block: 30px;">
  <label class="input-group-text" for="inputGroupSelect01" style="font-size: 14px;">관찰력</label>
	  <select name="observation" class="form-select" id="inputGroupSelect01" style="font-size: 14px;">
	    <option selected>선택</option>
	    <option value="1">★☆☆☆☆</option>
	    <option value="2">★★☆☆☆</option>
	    <option value="3">★★★☆☆</option>
	    <option value="4">★★★★☆</option>
	    <option value="5">★★★★★</option>
	  </select>
	</div>
	
	<div class="input-group mb-3" style="width: 600px; margin-block: 30px;">
	  <label class="input-group-text" for="inputGroupSelect01" style="font-size: 14px;">공포</label>
	  <select name="horror" class="form-select" id="inputGroupSelect01" style="font-size: 14px;">
	    <option selected>선택</option>
	    <option value="1">★☆☆☆☆</option>
	    <option value="2">★★☆☆☆</option>
	    <option value="3">★★★☆☆</option>
	    <option value="4">★★★★☆</option>
	    <option value="5">★★★★★</option>
	  </select>
	</div>
	
	<div class="input-group mb-3" style="width: 600px; margin-block: 30px;">
	  <label class="input-group-text" for="inputGroupSelect01" style="font-size: 14px;">활동력</label>
	  <select name="activity" class="form-select" id="inputGroupSelect01" style="font-size: 14px;">
	    <option selected>선택</option>
	    <option value="1">★☆☆☆☆</option>
	    <option value="2">★★☆☆☆</option>
	    <option value="3">★★★☆☆</option>
	    <option value="4">★★★★☆</option>
	    <option value="5">★★★★★</option>
	  </select>
	</div>
	
	<div class="input-group input-group-sm mb-3" style="margin-block: 30px; width: 300px;">
  <span class="input-group-text" id="inputGroup-sizing-sm">참여 가능 인원</span>
  <input type="text" id="participant" name="participant" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${room.participant}">
</div>
	
	<div class="mb-3" style="margin-block: 30px;">
	  <input name="photo" class="form-control form-control-sm" id="formFileSm" type="file">
	</div>
	
	<div style="text-align: center; margin-block: 50px;">
	<button type="submit"  class="btn btn-secondary addBtn" style="font-size: 12px;">수정</button>
 	</div>
 </div>
 </main>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>

$(function() {
	// 시간대 선택
	$('.checkRoomTime').each(function() {
		var roomTime = $(this);
		$('.rtList').each(function() {
			var rtList = $(this);
			if (rtList.val() == roomTime.val()) {
				roomTime.prop('checked', true);
			}
		});
	});
	// 난이도
	var level = '${room.level}';
	$('select[name=level]').val(level)
	// 추리력
	var reasoning = '${roomAttr.reasoning}'	
	$('select[name=reasoning]').val(reasoning)
	// 관찰력
	var observation = '${roomAttr.observation}'	
	$('select[name=observation]').val(observation)
	// 공포
	var horror = '${roomAttr.horror}'	
	$('select[name=horror]').val(horror)
	// 활동력
	var activity = '${roomAttr.activity}'	
	$('select[name=activity]').val(activity)
	// 참여 가능 인원
});


$('.addBtn').on('click', function() {
	 if ($('#title').val() == '') {
		alert('제목을 입력해주세요.');
		return false;
	}
	if($('#content').val() == '') {
		alert('내용을 입력해주세요.');
		return false;
	}
	
	var cnt = 0;
	var chkbox = $('.checkRoomTime');
	for (var i = 0; i < chkbox.length; i++) {
		if (chkbox[i].checked == true) {
			cnt++;
		}
	}
	if (cnt == 0) {
		alert('시간대를 선택해 주세요.');
		return false;
	}

	if ($('select[name=level]').val() == '선택') {
		alert('난이도를 선택해주세요.');
		return false;
	}
	if ($('select[name=reasoning]').val() == '선택' ) {
		alert('추리력을 선택해주세요.');
		return false;
	}
	if ($('select[name=observation]').val() == '선택') {
		alert('관찰력을 선택해주세요.');
		return false;
	}
	if ($('select[name=horror]').val() == '선택') {
		alert('공포를 선택해주세요.');
		return false;
	}
	if ($('select[name=activity]').val() == '선택') {
		alert('활동력을 선택해주세요.');
		return false;
	}
	if ($('#participant').val() == '') {
		alert('참여 가능 인원을 입력해주세요.');
		return false;
	}
	else {
		var result = confirm('수정하시겠습니까?');
		if(result) {
			alert('수정되었습니다.');
		}
		else {
		}
	} 
});
</script>
</body>
</html>