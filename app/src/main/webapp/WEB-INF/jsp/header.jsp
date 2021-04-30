<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.rtl.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/bootstrap/css/index.css" rel="stylesheet">
</head>
<body>
    <header class="bg-dark d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-decoration-none">
          <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        </a>
    
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 font-light">Info</a></li>
          <li><a href="#" class="nav-link px-2 font-light">Rooms</a></li>
          <li><a href="#" class="nav-link px-2 font-light">Reservation</a></li>
          <li><a href="#" class="nav-link px-2 font-light">My page</a></li>
        </ul>
    
        <div class="col-md-3 text-end">
          <button type="button" class="btn btn-outline-primary me-2">로그인</button>
          <button type="button" class="btn btn-primary">회원가입</button>
        </div>
      </header>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>