
/*이용약관*/
var allCheck = document.getElementById('agreementAll'),
	checkBox = document.getElementsByName('agreement');
	checkBoxLength = document.getElementsByName('agreement').length;

	for(var i = 0; i < checkBoxLength; i++){
		checkBox[i].addEventListener('click',function(){
			if(this.checked == false && allCheck.checked == true){
				allCheck.checked = false;
				return;
			}
		});
	}
	
allCheck.addEventListener('click',function(){
	if(allCheck.checked){
		check_all();
	}else {
		uncheck_all();
	}
});



function check_all() {
	for(var i = 0; i < checkBoxLength; i++){
		checkBox[i].checked = true;
	}
}

function uncheck_all() {
	for(var i = 0; i < checkBoxLength; i++){
		checkBox[i].checked = false;
	}
}

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
	   email1 = document.getElementById('email01'),
	   email2 = document.getElementById('email02'),
	   email3 = document.getElementById('email03'),
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
	  var $idValue = $('#userId').val();
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	  $.ajax({
		  url: '/project/duplicationCheck.by',
		  type: 'POST',
		  data: {id : $idValue},
		  beforeSend: function(xhr){
			  /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			  xhr.setRequestHeader(header,token);
		  },
		  dataType: 'json',
		  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		  success: function(data){
			  if(data.result == "Fail"){
				  idCheckResult.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다";
				  idCheckResult.classList.remove('success');
				  idCheckResult.classList.add('error');
				  id.value = '';
			  }
		  },
		  error: function(xhr,status,error){
			  console.log('error:'+error);
		  }
	  });  
  }
  
 
  id.addEventListener('blur',function(){
	  idCheckResult.classList.remove('hide');
	  duplicateCheck();
	  if(!check(userIdCheck,id,idCheckResult)){
		  idCheckResult.classList.remove('success');
		  idCheckResult.classList.add('error');  
	  }else {
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
		  document.querySelector('.password').classList.remove('success');
		  return false;
	  }
	  else {
		  pwCheckResult.classList.add('hide');
		  document.querySelector('.password').classList.add('success');
	  }
  });
  
//패스워드확인 
  pwCheck.addEventListener('blur',function(){
	  pwConfirmCheckResult.classList.remove('hide');
	  if(!(pwCheck.value == pw.value)|| pwCheck.value == ""){
		  pwConfirmCheckResult.classList.add('error');
		  pwCheck.value= '';
		  pwConfirmCheckResult.innerHTML = "비밀번호가 일치하지 않습니다."
		  document.querySelector('.password-confirm').classList.remove('success');
	  }
	  else {
		  pwConfirmCheckResult.classList.add('hide');
		  pwConfirmCheckResult.classList.remove('error');
		  document.querySelector('.password-confirm').classList.add('success');
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
  
  
  email3.addEventListener('change',function(){
	  var eAddr = document.getElementById('email03').selectedIndex;
		 
		 switch(eAddr) {
		 case 0:
			 email2.value = '';
			 break;
		 case 1:
			 email2.value = 'naver.com';
			 break;
		 case 2:
			 email2.value = 'daum.net';
			 break;
		 case 3:
			 email2.value = 'gmail.com';
			 break;
		 case 4:
			 email2.value = 'hanmail.net';
			 break;
		 case 5:
			 email2.value = 'hotmail.com';
			 break;
		 case 6:
			 email2.value = 'nate.com';
			 break;
		 case 7:
			 email2.value = 'tahoo.co.kr';
			 break;
		 }
		 return true;
  });
  
//핸드폰인증번호 칸  
  var sendAtNum = document.querySelector(".sendAtNum-btn"),
  Authentication = document.querySelector(".Authentication");

sendAtNum.addEventListener("click", function () {
  Authentication.style.display = "flex";
});


/* submit 유효성 */
 var form = document.getElementById('join_form'),
 	 submitBtn = document.querySelector('.submitBtn'),
 	requiredCheck1 = document.getElementById('agreement01'),
 	requiredCheck2 = document.getElementById('agreement02');
 	
submitBtn.addEventListener('click',function(){
	 if(!(requiredCheck1.checked && requiredCheck2.checked)){
		 alert('이용약관에 동의하셔야 합니다.');
		 return false;
	 }else if(id.value == '' && pw.value == '' && pwCheck.value == '' 
		 		&& phone1.value == '' && phone2.value == '' && email1.value == ''
		 		&& email2.value == ''){
		 alert('필수정보 모두 입력해주셔야 합니다.');
	 }else {
		 form.submit();
	 }
}) 

 
