<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자</title>
<link href="<%=request.getContextPath() %>/bootstrap/css/admin.css?var=2" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">

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
  
  <body class="text-center" style="padding-block: 250px;">
    
<main class="form-signin">
  <form action="login" method="post">
    <h1 class="h3 mb-3 fw-normal">관리자 로그인</h1>

    <div class="form-floating">
      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="id">
      <label for="floatingInput">id</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button id="loginBtn" class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  </form>
</main>


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
//로그인 버튼 클릭 시
// 아이디와 비밀번호가 올바른지 확인
$('#loginBtn').on('click', function() {
	var formData = $('#form').serialize();
	var prevPage = '${sessionScope.prevPage}'
	 $.ajax({
			 url: 'login',
			 type: 'POST',
			 data: formData,
			 success: function(data) {
				 if (data == 'ok') {
					 location.href = '<%=request.getContextPath() %>/admin/';
				 } else if (data == 'fail') {
					 alert('아이디 혹은 비밀번호가 맞지 않습니다.');
				 }
			 },
			 error: function() {
				 console.log('error');
			 }
	});
});
// 로그인 버튼 엔터 시
$('#password').on('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#loginBtn').click();
	}
});
</script>
</body>
</html>