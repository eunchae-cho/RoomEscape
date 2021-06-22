<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 이벤트 등록</title>

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
 <h3 style="margin-block: 50px; border-bottom: solid;">이벤트 등록</h3>  
  <div style="margin-block: 50px;">
	 <div class="input-group input-group-sm mb-3">
	  <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
	  <input type="text" id="title" name="title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
	</div>
	<div class="input-group input-group-sm " style="margin-block: 30px;">
 	 <span class="input-group-text">내용</span>
 	 <textarea id="content" name="content" class="form-control" aria-label="With textarea" style="resize: none; height: 300px;"></textarea>
	</div>
	<div class="mb-3">
	  <input name="photo" class="form-control form-control-sm" id="formFileSm" type="file">
	</div>
	<div style="text-align: center;">
	<button type="submit" name="photo" class="btn btn-secondary addBtn" style="font-size: 12px;">등록</button>
 	</div>
 </div>
 </main>
</form>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
$('.addBtn').on('click', function() {
	if ($('#title').val() == '') {
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
	}
});
</script>
</body>
</html>