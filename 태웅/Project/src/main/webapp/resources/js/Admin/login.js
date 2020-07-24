///*카카오로그인*/
//
// // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
//Kakao.init('d4d29a30acb6ffa8f830ad6b929fcf26');
//
//// SDK 초기화 여부를 판단합니다.
//console.log(Kakao.isInitialized());
//Kakao.Auth.createLoginButton({
//            container: '#kakao-login-btn',
//            success: function (authObj) {
//                alert(JSON.stringify(authObj));
//            },
//            fail: function (err) {
//                alert(JSON.stringify(err));
//            }
//        });

	

	 var form = document.getElementById('login_form'),
 	 submitBtn = document.querySelector('.submitBtn'),
 	idInput = document.getElementById('userId'),
 	pwInput = document.getElementById('userPw');

	 if(form != null) {
submitBtn.addEventListener('click',function(){
	 if(idInput.value == '' || pwInput.value == ''){
		 alert('아이디 또는 비밀번호를 입력하세요');
		 return false;
	 }else {
		 form.submit();
	 }
})

	 }