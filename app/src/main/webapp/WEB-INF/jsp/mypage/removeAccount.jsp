<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 마이페이지 - 회원 탈퇴</title>
  <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css?var=2"  rel="stylesheet"  >
  </head>
  <body>
  
  <main class="container" style="margin-top: 50px;">
  <div class="bg-light p-5 rounded mt-3">
    <h3 style="margin-block: 20px; text-align: center;">회원 탈퇴</h3>
    <div style="margin: auto; width:395px;">
	    <p class="lead" style="font-size: unset;">계정을 삭제하면 이전의 기록과 정보들은 모두 사라지게 됩니다.<br>
	    	이에 동의하고 진행하겠습니까?
    	</p>
    </div>
    <div style="text-align: center;">
	    <input type="checkbox" name="agreement" value="yes"> 예 &nbsp;&nbsp;
	    <input type="checkbox" name="agreement" value="no"> 아니요
    </div>
    <div style="text-align: center; margin-block: 20px;">
    	<label for="password" style="font-size: unset;">비밀번호: </label>
    	<input type="password" id="password" name="password">
    	<button type="button" id="passwordBtn" class="btn" 
    		style="padding-block:3px; font-size: unset; color: white; background-color: darkgrey; border-color: darkgray; margin-bottom: 4px;">확인</button>  
    		<div id="password-feedback" style="font-size: smaller; margin-left: 127px; text-align: left;"></div>
    </div>
    <div style="text-align: center; margin-top: 45px;">
    	<input type="hidden" name="no" value="${sessionScope.loginUser.no}">
	    <a id="removeBtn" class="btn btn-lg btn-primary" href="#" role="submit" style="font-size: unset; padding-block: 4px;'">탈퇴하기</a>
    </div>
  </div>
</main>
 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 	
 <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script>
 	var checkPassword = 0;
 	var checkAgreement= 0;
 	
 	// checkbox 단일 선택 
 	$('input[name=agreement]').on('click', function() {
 		if ($(this).prop('checked')) {
 			$('input[name=agreement]').prop('checked', false);
 			$(this).prop('checked', true);
 			
 			if ($(this).val() == 'yes') {
 				checkAgreement = 1;
 			} else {
 				checkAgreement = 0;
 			}
 		}
 	});
 	
 	// 비밀번호 확인 버튼 클릭 시
 		$('#passwordBtn').on('click', function() {
 			var password = $('#password').val();
 			checkPassword = 0;
 			
 			$.ajax({
 				url: 'confirmPassword',
 				type: 'POST',
 				data: {
 					password : password
 				},
 				dataType: 'text',
 				success: function(data) {
 					if (data == 'ok') {
 						checkPassword = 1;
 						$('#password-feedback').css('color', 'lightgreen');
 						$('#password-feedback').html('비밀번호 인증이 확인되었습니다.');
 					} else if (data == 'fail') {
 						$('#password-feedback').css('color', 'crimson');
 						$('#password-feedback').html('비밀번호가 맞지 않습니다.');
 					} else {
 						$('#password-feedback').css('color', 'crimson');
 						$('#password-feedback').html('비밀번호 인증이 필요합니다.');
 					}
 				},
 				error: function() {
 					console.log('error');
 				}
 			});
 		});
 	
 	// 탈퇴하기 버튼 클릭 시
 	$('#removeBtn').on('click', function() {
 		if (checkAgreement == 0) {
 			alert('회원 탈퇴에 대해 동의해주세요.');
 			return false;
 		} else if (checkPassword == 0) {
 			alert('비밀번호 인증을 해주세요.');
 			return false;
 		} else {
 			var result = confirm('회원 탈퇴를 하시겠습니까?');
 			if (result) {
 				location.href('<%=request.getContextPath()%>/mypage/removeAccount/remove');
 				self.close();
 				window.opener.location.href='<%=request.getContextPath()%>/';
 			}
 		}
 	});
 </script>
 </body>
 </html>