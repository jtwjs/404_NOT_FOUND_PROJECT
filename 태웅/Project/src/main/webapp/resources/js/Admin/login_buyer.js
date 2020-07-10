/*카카오로그인*/

 // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('d4d29a30acb6ffa8f830ad6b929fcf26');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());
Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });


/*네이버*/
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "PwoJg7kCVtAGKGAjhm72",
			callbackUrl: "http://localhost:8080/project/Index.in",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
	
	 var form = document.getElementById('login_form'),
 	 submitBtn = document.querySelector('.submitBtn'),
 	idInput = document.getElementById('userId'),
 	pwInput = document.getElementById('userPw');
 	
submitBtn.addEventListener('click',function(){
	 if(idInput.value == '' || pwInput.value == ''){
		 alert('아이디 또는 비밀번호를 입력하세요');
		 return false;
	 }else {
		 form.submit();
	 }
}) 
