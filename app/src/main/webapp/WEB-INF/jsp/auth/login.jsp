<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 로그인</title>
<link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css?var=2"  rel="stylesheet"  >
<link href="<%=request.getContextPath() %>/bootstrap/css/style.css?var=2"  rel="stylesheet"  >
<style>
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: flex;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: black;
	}
</style>
</head>
<body class="text-center">
 <main class="form-signin">
 
  <form action="login" method="POST">
  	<input type="hidden" id="check" name="check" value="true">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
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
    <button id="loginBtn" class="w-100 btn btn-lg btn-primary" type="submit" style="margin-bottom: 20px">login</button>
  	<a href="<%=request.getContextPath() %>/auth/signup">회원가입</a>	
    <p class="mt-5 mb-3 text-muted">&copy; sandoll 2021</p>
  </form>
</main>
<script>
	$(function() {
		var check = $('#check').val();
		
		if (check == false) {
			alert('아이디 혹은 비밀번호가 맞지 않습니다.');
		}
	});
</script>
</body>
</html>