<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 리뷰쓰기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  </head>
  <body>
  <jsp:include page="../../header.jsp"></jsp:include>  
	<main>
	    <div class="container marketing" style="padding-top: 50px;">
	        
	        <div class="mypage-container">
	        <div class="my_wrap">
	        	
	         <jsp:include page="../sidebar.jsp"></jsp:include>  
	        	
	        	<div class="article_right">
	        	<div style="border-bottom: solid">
	        		<h5 style="margin-bottom: 10px; margin-left: 10px;">리뷰 쓰기</h5>
	        	</div>
	        	<div style="margin: 30px; margin-top: 50px; font-size: 14px;">
		          <div style="margin-block: 10px;">
		        		<label>룸 테마: </label><span style="margin-left: 35px;">${res.room.title}</span>
		          </div>
		          <div style="margin-block: 10px;">
		        		<label>이용 날짜: </label><span style="margin-left: 20px;">${res.doDate}</span><br>
		          </div>
		          <div style="margin-block: 10px;">
		        		<label>이용 시간: </label><span style="margin-left: 20px;">${res.roomTime}</span><br>
		          </div>
		          <div  style="margin-block: 10px; padding-bottom: 30px; border-bottom: solid; border-width:thin;">
		        		<label>탈출: </label><span style="margin-left: 50px;">${res.escape} <c:if test="${res.escape == '성공'}">(${res.escapedTime})</c:if></span>
		          </div>
	        	 </div>
	        	 
	        	 <form action="add" method="post" enctype="multipart/form-data">
	        	 <input type="hidden" name="resNo" value="${res.no}">
	        	 <input type="hidden" name="roomNo" value="${res.room.no}">
	        	 <input type="hidden" name="userNo" value="${res.user.no}">
	        	 <div style="margin: 30px; font-size: 14px;">
	        	 	<div style="padding-block: 20px;">
	        	 		<label for="title">제목: </label>
	        	 		<input type="text" id="review-text" name="title">
	        	 		<div style="margin-left: 80px; margin-top: 5px; color: darkgrey;">최대 60자</div>
	        	 	</div>
	        	 	<div style="padding-block: 20px;">
	        	 		<label for="content" style="vertical-align: top;">내용: </label>
	        	 		<textarea id="review-textarea" name="content" ></textarea>
	        	 	</div>
	        	 	<div style="padding-block: 20px;">
	        	 		<label> 사진 선택: </label>
	        	 		<input  type="file" id="photos" name="photos[]" style="margin-left: 20px;" multiple>
	        	 		<div style="color: darkgrey; margin-left: 86px; margin-top: 5px;">최대 10장</div>
	        	 		<div id="img-box">
	        	 			<ul id="img-wrap"></ul>
	        	 		</div>
	        	 		<div style="text-align: center; margin-block: 100px;">
	        	 			<button type="button" id="addBtn" class="btn btn-find">완료</button>
	        	 		</div>
	        	 	</div>
	        	 </div>
	        	 
	        	 </form>
	        	
	        	</div>
	        </div>
	        
	    	</div>
	    </div>
	 </main>

 <jsp:include page="../../footer.jsp"></jsp:include>  
 <script>
	var selectedfiles = [];
	var count = 0;
	
	$(function() {
		$('#photos').on('change', selectFile);
	});
	
	function selectFile(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		if (count > 1) {
			alert('최대 10개의 사진 첨부만 가능합니다.');
			return;
		} 
		
		filesArr.forEach(function(f) {
			if (!f.type.match('image.*')) {
				$('#img-wrap li').each(function() {
					alert('확장자는 이미지 파일만 가능합니다.');
					return;
				})
			}
			selectedfiles.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var idx = new Date().getTime();
				var img_htmls = '';
				img_htmls += '<li class="img-container" id="'+idx+'">';
				img_htmls += '<a href="#" onclick="deletePhoto('+idx+');" style="color: white;"><i class="bi bi-x-square close-icon"></a></i>';
				img_htmls += '<img src='+ e.target.result  +'>';
			    img_htmls += '</li>';
			    
				$('#img-wrap').append(img_htmls);
			}
			reader.readAsDataURL(f);
			count = count + 1;
			console.log(count);
		});
	}
	
	function deletePhoto(idx) {
		$('#'+idx).remove();
		count = count - 1;
		if (count == 0) {
			$('#photos').val('');
		}
		console.log(count)
	}
	
 </script>
 </body>
 </html>