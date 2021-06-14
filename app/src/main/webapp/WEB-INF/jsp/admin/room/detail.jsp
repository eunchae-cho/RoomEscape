<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 룸 테마 보기</title>

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
 <h2 style="margin-block: 50px;">룸 테마 보기</h2>  
  <p style="margin-left: 50px;">no. ${room.no}</p>
  <div style="margin: 50px;">
  <div style="margin-block: 50px;">
  	<img src="<%=request.getContextPath()%>/img/${room.photo}">
  </div>
	 <div style="margin-bottom: 30px;">
	 	<label>제목: </label>
	 	<div style="width: 94%; float: right;">${room.title}</div>
	</div>
	<div>
 	 	<label>내용: </label>
	 	<div style="width: 94%; float: right;">${room.content}</div>
	</div>
	<div style="text-align: center; margin-top: 100px;">
	<button type="button" class="btn btn-secondary updateBtn" style="font-size: 12px;">수정</button>
	<button type="button" class="btn btn-secondary deleteBtn" style="font-size: 12px;">삭제</button>
 	</div>
 </div>
 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
<script>
	$('.updateBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/admin/event/update?no=${event.no}';
	});
	
	$('.deleteBtn').on('click', function() {
		var result = confirm('삭제하시겠습니까?');
		if(result) {
			alert('삭제되었습니다.');
			location.href = '<%=request.getContextPath()%>/admin/event/delete?no=${event.no}';
		} else {
		}
	});
</script>
</body>
</html>