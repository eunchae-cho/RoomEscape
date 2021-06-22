<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[room escape] 관리자</title>
<link href="<%=request.getContextPath() %>/fullcalendar/main.css" rel="stylesheet">
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
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
<jsp:include page="./sidebar.jsp"></jsp:include>  

 <main  class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

<div style="margin-top: 50px; border-bottom: solid;"><h3>SCHEDULER</h3></div>
 <div id='calendar' style="margin-block: 30px;"></div>

 </main>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/fullcalendar/main.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      initialView: 'dayGridMonth',
	      themeSystem : 'bootstrap',
	      height : 700,
		  eventSources: [{
		      events: function(info, successCallback, failureCallback) {
		    	  $.ajax({
		    		  url: 'scheduler',
		    		  type: 'post',
		    		  dataType: 'json',
		    		  success: function(data) {
		    			  console.log(data)
		    			  successCallback(data);
		    		  }
		    	  });
		      }
		  }],
		//   eventClick : function(info) {
		// 	  var eventObj = info.event;
		// 	  window.location = '<%=request.getContextPath() %>/admin/reservation/detail?no=' + eventObj.id;
		//   } 
	    
	    });
	    calendar.render();
	    
	  });
  
</script>
</body>
</html>