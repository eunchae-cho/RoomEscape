<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 룸 테마 등록</title>

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
      
  <form action="add" method="post" enctype="multipart/form-data">
  
 <main  class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
 <h2 style="margin-block: 50px;">룸 테마 등록</h2>  
  <div style="margin-block: 50px;">
	 <div class="input-group input-group-sm mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
	  <input type="text" id="title" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	</div>
	
	<div class="input-group input-group-sm " style="margin-block: 30px;">
 	 <span class="input-group-text">내용</span>
 	 <textarea id="content" name="content" class="form-control" aria-label="With textarea" style="resize: none; height: 300px;"></textarea>
	</div>
	
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
  <input type="text" name="participant" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
	
	<div class="mb-3" style="margin-block: 30px;">
	  <input name="photo" class="form-control form-control-sm" id="formFileSm" type="file">
	</div>
	
	<div style="text-align: center; margin-block: 50px;">
	<button type="submit" name="photo" class="btn btn-secondary addBtn" style="font-size: 12px;">등록</button>
 	</div>
 </div>
 </main>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
<script>


$('.addBtn').on('click', function() {
	/* if ($('#title').val() == '') {
		alert('제목을 입력해주세요.');
		return false;
	}
	if($('#content').val() == '') {
		alert('내용을 입력해주세요.');
		return false;
	}
	else {
		var result = confirm('이벤트를 등록하시겠습니까?');
		if(result) {
			alert('등록되었습니다.');
		}
		else {
		}
	} */
	$('.checkRoomTime:checked').each(function(i, value) {
		 var test = $(this).val();
		console.log(test);
	});
});
</script>
</body>
</html>