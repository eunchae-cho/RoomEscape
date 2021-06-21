<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
  <!DOCTYPE html>
  <html>
  <head>
  <meta charset="UTF-8">
  <title>[room escape] 회원가입</title>
  <link href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css?var=2"  rel="stylesheet"  >
  </head>
  <body>
  <jsp:include page="../header.jsp"></jsp:include>  
  
  <main>
   <div class="signup-container">
    <div class="py-5 text-center" style="margin-top: 100px">
      <h2>회원가입</h2>
    </div>

    <div class="row g-5" style="justify-content: center;">
      <div class="col-md-7 col-lg-8">
        
        <form class="needs-validation" action="signup" method="post" novalidate>
         
          <div class="row g-3">

            <div class="col-12">
              <label for="lastName" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="username" pattern="^([가-힣]){2,10}"  style="ime-mode: active;"required>
              <div class="name-feedback invalid-feedback">
               한글로 이름을 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">아이디<span class="text-muted" >(영문, 숫자만 가능,  최소 4자 이상)</span></label>
              <div class="input-group has-validation" style="justify-content: space-between;">
                <input type="text" class="id-form form-control" id="id" name="id" placeholder="id"  pattern="^[a-zA-Z0-9]{4,20}$" style="flex-grow: 0.98; border-radius: 0.25rem;" required>
                	<div>
              		  <button type="button" id="duplicateBtn" class="btn btn-find" style="margin: 0; padding-block: 6px; font-size: 15px;">중복 확인</button>
              	    </div>
              <div class="id-feedback invalid-feedback">
                 최소 4자 이상 영문 대소문자나 숫자로만 아이디를 입력해주세요.
                </div>
              </div>
                <div class="cannot-make-id" style="margin-top: 2px; color: crimson; font-size: 14px;'"> </div>
                <div class="can-make-id" style="margin-top: 2px; color: lightgreen; font-size: 14px;"> </div>
            </div>
            
             <div class="col-12">
              <label for="address" class="form-label">비밀번호<span class="text-muted" >(영문 + 숫자, 최소 8~ 16자)</span></label>
              <input type="password" class="form-control" id="password" name="password" placeholder="password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$" minlength="8" maxlength="16" required>
              <div class="password-feedback invalid-feedback">
                최소 8 ~ 16자 이내 영문과 숫자로 된 비밀번호를 입력해주세요.
              </div>
            </div>
            
            <div class="col-12">
              <label for="address" class="form-label">비밀번호 확인<span class="text-muted" ></span></label>
              <input type="password" class="password-form form-control" id="confirmPassword" name="confirmPassword" placeholder="password" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$" minlength="8" maxlength="16" required>
              <div class="confirmPassword-feedback invalid-feedback">
                비밀번호가 맞지 않습니다.
              </div>
              <div class="cannot-make-password" style="margin-top: 2px; color: crimson; font-size: 14px;'"> </div>
              <div class="can-make-password" style="margin-top: 2px; color: lightgreen; font-size: 14px;"> </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">이메일 </label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
              <div class="email-feedback invalid-feedback">
                이메일 형식으로 입력해야 합니다.
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">연락처 </label>
              <input type="tel" class="form-control" id="phone" name="phone" placeholder="010-1234-5678"  pattern="0[0-9]{1,2}-[0-9]{3,4}-[0-9]{4}" required>
              <div class="phone-feedback invalid-feedback">
                '-' 를 포함해 입력해주세요.
              </div>
            </div>

          </div>
          <div style="text-align: center;">
          <button class="btn btn-lg btn-find" type="submit" id="signupBtn" style="margin-top: 45px; padding-block: 5px; width: 100%; font-size: 18px;">회원가입</button>
         </div>
        </form>
        
      </div>
    </div>
   </div>
  </main>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  <script>
  var btnCount = 0;
  var password = $('#password').val();
  var confirmPassword = $('#confirmPassword').val();
  
  // 중복 확인 버튼 클릭 시
  $('#duplicateBtn').on('click', function() {
	  var id = $('#id').val();
	  var regexp = /^[a-zA-Z0-9]+$/;
	  var result = regexp.exec(id);
	  
	  // 아이디 관련 메세지 초기화
	  $('.cannot-make-id').html('');
	  $('.can-make-id').html('');
	  
	  // 공백으로 중복 확인 버튼을 눌었을 때
	  if (id == '') {
		  	$('.id-form').attr('class', 'is-invalid' );
			return $('.id-feedback').html('아이디를 입력해주세요.');
		} 
	  
	  // 한글로 아이디를 만들었을 때
	  if(result == null) {
		  $('.id-form').attr('class', 'is-invalid' );
		  $('.id-feedback').html('');
		  return $('.cannot-make-id').html('영어 대소문자와 숫자로만 입력해주세요.');
	  }
	  
	  $.ajax({
		  url: 'confirmId',
		  type: 'GET',
		  data: {
			  id : id
		  },
		  dataType: 'json',
		  success: function(data) {
			  console.log(data);
		   	if (data == 0) {
		   		$('.id-form').attr('class', 'is-valid' );
		   		$('.id-feedback').html('');
		   		//$('.id-feedback').css('visibility', 'hidden');
		   		$('.can-make-id').html('사용 가능한 아이디입니다.');
		   	  // 버튼 누름 확인
		  	  btnCount = 1;
			} else if (data == 1) {
				$('.id-form').attr('class', 'is-invalid' );
				$('.id-feedback').html('');
				//$('.id-feedback').css('visibility', 'hidden');
				$('.cannot-make-id').html('이미 존재하는 아이디입니다.');
			}
		  },
		  error: function() {
			  console.log('error');
		  }
	  });
  });
  

 (function () {
	 
	 // 아이디 입력창 입력 시
	 $('#id').on('keyup', function() {
		 if ($(this).val().length >= 4) {
			 $('.id-form').attr('class', 'is-valid' );
			 $('.cannot-make-id').html('중복 확인을 해주세요.');
		 }
		 $('.id-form').removeClass('is-invalid' );
	 });
	 
	 $('#password').on('keyup', function() {
		 var password = $('#password').val();
		 var  regExp = '/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/';
		 var result = password.search(regExp);
		 confirmPwd();
	 });
	 
     // 비밀번호 확인창 입력 시 
     $('#confirmPassword').on('keyup', function() {
    	 confirmPwd();
     });
     
     function confirmPwd() {
    	// 초기화
    	 if ($('#confirmPassword').val() == '') {
			 $('.password-form').removeClass('is-invalid');
			 $('.password-form').removeClass('is-valid');
			 $('.cannot-make-password').html('');
			 $('.can-make-password').html('');
			 }
    	
    		 // 비밀번호 입력 내용이 같을 때 valid 되도록 처음에 invalid로 지정
    		 $('.password-form').addClass('is-invalid');

    	 if ( $('#password').val() == $('#confirmPassword').val()) {
    		 console.log( $('#password').val());
    		 console.log( $('#confirmPassword').val());
    		 $('.cannot-make-password').html('');
    		 $('.password-form').removeClass('is-invalid');
    		 $('.password-form').addClass('is-valid');
    		 $('.cannot-make-password').html('');
    		 $('.can-make-password').html('비밀번호가 일치합니다.');
    	 } else {
    		 $('.confirmPassword-feedback').html('');
  	      	 $('.cannot-make-password').html('비밀번호가 같지 않습니다.');
  		  	 $('.can-make-password').html(''); 
    	 }
     }
     
     
  // 회원 가입 버튼 클릭 시
    var forms = document.querySelectorAll('.needs-validation')
     
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
        	
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          } 
          /* else if (btnCount == 0) {
        	alert('중복 확인을 해주세요.');  
        	 event.preventDefault()
             event.stopPropagation()
          }
          else if( $('#password').val() != $('#confirmPassword').val()) {
         	alert('비밀번호를 다시 한 번 확인해주세요.');  
         	 event.preventDefault()
             event.stopPropagation()
          }  */
          else {
        	 var result = confirm('회원가입을 하시겠습니까?');
        	 if (result) {
	        	alert("회원가입이 완료되었습니다.\n로그인 창으로 이동합니다.");
        	 } else {
        	 }
        	location.href = '<%=request.getContextPath() %>/auth/login';
          }
          form.classList.add('was-validated')
        }, false)
      })
  })() 
  

  </script>
  </body>
  </html>