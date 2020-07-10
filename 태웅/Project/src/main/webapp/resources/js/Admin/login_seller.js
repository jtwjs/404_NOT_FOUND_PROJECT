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
