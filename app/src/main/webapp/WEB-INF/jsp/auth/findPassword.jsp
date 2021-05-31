<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 회원가입 - 비밀번호 찾기</title>
  <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css?var=2"  rel="stylesheet"  >
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
  
  <main>
   <div class="signup-container" style="width: 500px;">
    <div class="py-5 text-center" style="margin-top: 100px;">
      <h3>비밀번호 찾기</h3>
    </div>

    <div class="row g-5" style="justify-content: center;">
    <p style="margin-bottom: 30px; text-align: center;">준비중...!</p>
      <!-- <div class="col-md-7 col-lg-8 showId">
	     <div class="row g-3">
	       <p style="margin-bottom: 30px; text-align: center;">가입한 이름과 이메일을 입력해주세요.</p>
            <div class="col-12">
              <label for="lastName" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="username" value="" required>
            </div>
            <div class="col-12">
              <label for="email" class="form-label">이메일 </label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
            </div>
            <div class="" style="margin-top: 30px; text-align: center;"></div>
          </div>
         <button class="w-100 btn btn-lg btn-find" type="button" id="findIdBtn">확인</button>
       </div> -->
      </div>
    </div>
  </main>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  <script>
  	// 확인 버튼 클릭 시
  	$('#findIdBtn').on('click', function() {
  		var name = $('#name').val();
  		var email = $('#email').val();
  		
  		$.ajax({
  			url: 'findId',
  			type: 'POST',
  			data: {
  				name : name,
  				email : email
  			},
  			dataType: 'text',
  			success: function(data) {
  				var htmls = '';
  				var obj = JSON.parse(data);
  				
  				if (data != '') {
  				 	htmls += '<div style="text-align: center; margin-top: 50px">';
  					htmls += '<p>가입된 아이디는</p>'
  					htmls += '<p style="color: bisque;"> '+ obj.id +'</p>입니다.';
  					htmls += '<div style="margin-top: 50px;">';
  					htmls += '<a id="go-login" href="<%=request.getContextPath() %>/auth/findPassword" style="text-decoration: none; font-size: larger; color: dimgrey;">비밀번호 찾기 >></a>';
  					htmls += '</div>';
  					htmls += '<div style="margin-top: 10px;">';
  					htmls += '<a id="go-login" href="<%=request.getContextPath() %>/auth/login" style="text-decoration: none; font-size: larger; color: darksalmon;">로그인하러 가기 >></a>';
  					htmls += '</div>';
  					htmls += '</div>';
  					$('.showId').html(htmls);
  				} else {
  					alert('이름 또는 이메일을 다시 한 번 확인해주세요.');
  					location.reload();
  				}
  			},
  			error: function() {
  				console.log('error');
  			}
  		});
  	});
  </script>
  </body>
  </html>