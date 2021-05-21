<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 로그아웃</title>
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
<body>
	<c:if test="${empty loginUser}">
	</c:if>

</body>
</html>