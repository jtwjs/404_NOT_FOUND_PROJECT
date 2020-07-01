
 /*유효성검사*/
//정규표현식
  const userNameCheck =  /^[가-힣]+$/,
		 userIdCheck = /^[a-z0-9-_]{5,20}$/,
		 userPwCheck = 	/^.*(?=^.\S{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/,
		 telCheck = /^[0-9]{4}$/;

  var irum = document.getElementById('userName'),
  	   id = document.getElementById('userId'),
  	   pw = document.getElementById('userPw'),
	   pwCheck = document.getElementById('userPwCheck'),
	   email = document.getElementById('email01'),
	   phone1 = document.getElementById('mPhone2'),
	   phone2 = document.getElementById('mPhone3');

  var nameCheckResult = document.getElementById('name_check'),
  	  idCheckResult = document.getElementById('id_check'),
   	  pwCheckResult = document.getElementById('pw_check'),
   	  pwConfirmCheckResult = document.getElementById('pwConfirm_check'),
   	  telCheckResult = document.getElementById('tel_check');
 
  //유효성검사 함수
  function check(re, what, result) {
	  if(re.test(what.value)) {
		  return true;
	  }
	  
	  switch(result){
	  case nameCheckResult:
		  nameCheckResult.innerHTML = "한글만 사용가능합니다.";
		  break;
	  case idCheckResult: 
		  idCheckResult.innerHTML  = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다";
		  console.log("result:"+idCheckResult.innerHTML);
		  break;
	  case pwCheckResult:
		  pwCheckResult.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."
		  break;
	  case telCheckResult:
		  telCheckResult.innerHTML = "숫자로만 입력해주세요"
	  }
	  
	  what.value = '';
  }
  
  
  /*이름 유효성검사*/
  irum.addEventListener('blur',function(){
	  nameCheckResult.classList.remove('hide');
	  if(!check(userNameCheck,irum,nameCheckResult)){
		  nameCheckResult.classList.add('error');
		  return false;
	  }
	  else {
		  nameCheckResult.classList.add('hide');
	  }
  });
  
  
  /*아이디 유효성검사*/
  
  //아이디 중복검사 함수
  function duplicateCheck() {
	  return false;
  }
  
  id.addEventListener('blur',function(){
	  idCheckResult.classList.remove('hide');
	  if(!check(userIdCheck,id,idCheckResult)){
		  idCheckResult.classList.remove('success');
		  idCheckResult.classList.add('error');
		  return false;
	  }
	  else if (duplicateCheck()/*DB ajax ID중복검사*/){
		  idCheckResult.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다";
		  idCheckResult.classList.remove('success');
		  idCheckResult.classList.add('error');
	  }
	  else {
		  idCheckResult.innerHTML = "멋진 아이디네요!";
		  idCheckResult.classList.remove('error');
		  idCheckResult.classList.add('success');
	  }
  });

  
  /*패스워드 유효성검사*/
  
  pw.addEventListener('blur',function(){
	  pwCheckResult.classList.remove('hide');
	  if(!check(userPwCheck,pw,pwCheckResult)){
		  pwCheckResult.classList.add('error');
		  return false;
	  }
	  else {
		  pwCheckResult.classList.add('hide');
	  }
  });
  
//패스워드확인 
  pwCheck.addEventListener('blur',function(){
	  pwConfirmCheckResult.classList.remove('hide');
	  if(!(pwCheck.value == pw.value)){
		  pwConfirmCheckResult.classList.add('error');
		  pwCheck.value= '';
		  pwConfirmCheckResult.innerHTML = "비밀번호가 일치하지 않습니다."
	  }
	  else {
		  pwConfirmCheckResult.classList.add('hide');
		  pwConfirmCheckResult.classList.remove('error');
	  }
  });
  
  /*전화번호 유효성*/
  phone1.addEventListener('blur',function(){
	  telCheckResult.classList.remove('hide');
	  if(!check(telCheck,phone1,telCheckResult)){
		  telCheckResult.classList.add('error');
		  return false;
	  }
	  else {
		  telCheckResult.classList.add('hide');
	  }
  });
  
  phone2.addEventListener('blur',function(){
	 telCheckResult.classList.remove('hide');
	 if(!check(telCheck,phone1,telCheckResult)||!check(telCheck,phone2,telCheckResult)) {
		 telCheckResult.classList.add('error');
		  return false;
	 }else {
		  telCheckResult.classList.add('hide');
	  }
  });
  

 /*이메일*/
  
  
  email03.addEventListener('change',function(){
	  var eAddr = document.getElementById('email03').selectedIndex;
	  var mail = document.getElementById('email02');
		 
		 switch(eAddr) {
		 case 0:
			 email02.value = '';
			 break;
		 case 1:
			 email02.value = 'naver.com';
			 break;
		 case 2:
			 email02.value = 'daum.net';
			 break;
		 case 3:
			 email02.value = 'gmail.com';
			 break;
		 }
		 return true;
  });
