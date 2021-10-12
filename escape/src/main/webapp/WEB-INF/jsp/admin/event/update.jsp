<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 이벤트 수정</title>

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
 <h3 style="margin-block: 50px; border-bottom: solid;">이벤트 수정</h3>  
  <div style="margin-block: 50px;">
  <hr>

	
	<form action="update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="no" value="${event.no}">
	 <div class="input-group input-group-sm mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
	  <input type="text"  id="title" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${event.title}">
	</div>
	<div class="input-group input-group-sm " style="margin-block: 30px;">
 	 <span class="input-group-text">내용</span>
 	 <textarea id="content" name="content" class="form-control" aria-label="With textarea" style="resize: none; height: 300px;">${event.content}</textarea>
	</div>
	<div class="mb-3">
	  <input type="hidden" id="photo" value="${photoMap.eventPhotoName}">
	  <input name="eventPhoto" class="form-control form-control-sm" id="formFileSm" type="file">
	</div> 
	<div style="text-align: center;">
	<button type="submit" class="btn btn-secondary updateBtn" style="font-size: 12px;">수정</button>
 	</div>
 	</form>
 </div>
 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(function() {
		$('input[name=eventPhoto')[0].name = $('#photo').val();
	})

	$('.updateBtn').on('click', function() {
		if ($('#title').val() == '') {
			alert('제목을 입력해주세요.');
			return false;
		}
		if($('#content').val() == '') {
			alert('내용을 입력해주세요.');
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