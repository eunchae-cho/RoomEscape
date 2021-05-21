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
  
 <div class="signup-container">
  <main>
    <div class="py-5 text-center" style="margin-top: 100px">
      <h2>회원가입</h2>
    </div>

    <div class="row g-5" style="justify-content: center;">
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">회원 정보</h4>
        
        <form class="needs-validation" action="signup" method="post" novalidate>
         
          <div class="row g-3">

            <div class="col-12">
              <label for="lastName" class="form-label">이름</label>
              <input type="text" class="form-control" id="name" name="name" placeholder="username" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" id="id" name="id" placeholder="id" required>
              <div class="invalid-feedback">
                  아이디를 입력해주세요.
                </div>
              </div>
            </div>
            
             <div class="col-12">
              <label for="address" class="form-label">비밀번호<span class="text-muted">(최소 8~ 16자)</span></label>
              <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
              <div class="invalid-feedback">
                 비밀번호를 입력해주세요.
              </div>
            </div>

            <div class="col-12">
              <label for="email" class="form-label">이메일 </label>
              <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
              <div class="invalid-feedback">
                이메일을 입력해주세요.
              </div>
            </div>
            
            <div class="col-12">
              <label for="email" class="form-label">연락처 </label>
              <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' 없이 숫자만">
              <div class="invalid-feedback">
                연락처를 입력해주세요.
              </div>
            </div>

          </div>
          <button class="w-100 btn btn-primary btn-lg" type="submit" id="signupBtn" style="margin-top: 45px;">회원가입</button>
        </form>
        
      </div>
    </div>
  </main>
</div>
  
  <jsp:include page="../footer.jsp"></jsp:include>  
  <script>
  (function () {
    'use strict'

    var forms = document.querySelectorAll('.needs-validation')

    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }

          form.classList.add('was-validated')
        }, false)
      })
  })()
  
  $('#signupBtn').on('click', function() { 
	  alert("회원가입이 완료되었습니다.");
  })
  </script>
  </body>
  </html>