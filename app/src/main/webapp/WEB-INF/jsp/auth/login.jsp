<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 로그인</title>
<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css?var=2"  rel="stylesheet"  >
<link href="<%=request.getContextPath() %>/bootstrap/css/style.css?var=2"  rel="stylesheet"  >
</head>
<body>
 <jsp:include page="../header.jsp"></jsp:include>  
 <main class="form-signin text-center" style= "margin-top: 200px">
 
  <form id="form" method="post">
  	<input type="hidden" id="check" name="check" value="true">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating" style="margin-block: 10px;">
      <input type="text" class="form-control" id="id" name="id" placeholder="id">
      <label for="floatingInput">id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="password" name="password" placeholder="password">
      <label for="floatingPassword">password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" name="rememberMe" value="remember-me"> Remember me
      </label>
    </div>
    <button id="loginBtn" class="w-100 btn btn-lg btn-find" type="button" style="margin-bottom: 20px">login</button>
  	<a href="<%=request.getContextPath() %>/auth/signup" style="text-decoration: none; color: grey;">회원가입</a> 
  	<br>
  	<a href="<%=request.getContextPath() %>/auth/findId" style="text-decoration: none; color: grey;">아이디</a> |
  	<a href="<%=request.getContextPath() %>/auth/findPassword" style="text-decoration: none; color: grey;">비밀번호 찾기</a> 
  </form>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	// 로그인 버튼 클릭 시
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
						 //location.href = prevPage;
						 location.href = '<%=request.getContextPath() %>/';
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