<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자 - 이벤트</title>

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
 <h3 style="margin-block: 50px; border-bottom: solid;">이벤트</h3>  
 <div style="text-align: right; margin-right: 10px;">
 	<button type="button" class="btn btn-light addBtn" style="font-size: 12px;">추가</button>
 </div>
  <div style="margin-top: 20px;">
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th style="width: 10%;">no.</th>
              <th style="width: 20%;">제목</th>
              <th style="width: 50%; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;">내용</th>
              <th style="width: 20%;">작성자</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list}" var="ev">
            <tr>
              <td>${ev.no}</td>
              <td><a href="<%=request.getContextPath()%>/admin/event/detail?no=${ev.no}">${ev.title}</a></td>
              <td>${ev.content}</td>
              <td>${ev.admin.id}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
   </div>

 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$('.addBtn').on('click', function() {
		location.href = '<%=request.getContextPath()%>/admin/event/add';
	});
</script>
</body>
</html>