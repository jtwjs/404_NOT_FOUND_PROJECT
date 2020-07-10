
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
		 telCheck = /^[0-9]{4}$/,
		 numberCheck = /^[0-9]*$/;

  var  id = document.getElementById('userId'),
  	   pw = document.getElementById('userPw'),
	   pwCheck = document.getElementById('userPwCheck'),
	   email1 = document.getElementById('email01'),
	   email2 = document.getElementById('email02'),
	   email3 = document.getElementById('email03'),
	   phone1 = document.getElementById('mPhone2'),
	   phone2 = document.getElementById('mPhone3'),
	   represent = document.getElementById('representative'),
	   mailOrderNum = document.getElementById('mailOrd-reportNum'),
	   customer = document.getElementById('customerName'),
	   bankName = document.getElementById('bank'),
	   bankAccount = document.getElementById('bank_account'),
	   businessName = document.getElementById('businessName');

  var nameCheckResult = document.getElementById('name_check'),
  	  idCheckResult = document.getElementById('id_check'),
   	  pwCheckResult = document.getElementById('pw_check'),
   	  pwConfirmCheckResult = document.getElementById('pwConfirm_check'),
   	  telCheckResult = document.getElementById('tel_check')
   	  representCheckResult = document.getElementById('representative_check'),
   	  mailOrdCheckResult = document.getElementById('mailOrd_check'),
   	  customerCheckResult = document.getElementById('customerName_check'),
   	  bankAccountCheckResult = document.getElementById('bankAccount_check');
 
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
		  pwCheckResult.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
		  break;
	  case telCheckResult:
		  telCheckResult.innerHTML = "숫자로만 입력해주세요";
		  break;
	  case representCheckResult: 
		  representCheckResult.innerHTML = "한글로만 입력해주세요";
		  break;
	  case customerCheckResult:
		  customerCheckResult.innerHTML = "한글로만 입력해주세요";
		  break;
	  case mailOrdCheckResult:
		  mailOrdCheckResult.innerHTML = "숫자로만 입력해주세요";
		  break;
	  case bankAccountCheckResult:
		  bankAccountCheckResult.innerHTML = "숫자로만 입력해주세요";
		  break;
	  }
	  
	  what.value = '';
  }
  

  
  
  /*아이디 유효성검사*/
  
  //아이디 중복검사 함수

 function duplicateCheck() {
	  var $idValue = $('#userId').val();
	  $.ajax({
		  url: '/project/duplicationCheck.se',
		  type: 'POST',
		  data: {id : $idValue},
		  dataType: 'json',
		  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		  success: function(data){
			  if(data.result == "Fail"){
				  idCheckResult.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다";
				  idCheckResult.classList.remove('success');
				  idCheckResult.classList.add('error');
				  id.value = '';
			  }
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
			 email2.value = 'yahoo.co.kr';
			 break;
		 }
		 return true;
  });
  /*대표자명(한글)*/
  represent.addEventListener('blur',function(){
	  representCheckResult.classList.remove('hide');
	  if(!check(userNameCheck,represent,representCheckResult)){
		  representCheckResult.classList.add('error');
		  return false;
	  }
	  else {
		  representCheckResult.classList.add('hide');
	  }
  });
  
  /*담당자명(한글)*/
  customer.addEventListener('blur',function(){
	  customerCheckResult.classList.remove('hide');
	  if(!check(userNameCheck,customer,customerCheckResult)){
		  customerCheckResult.classList.add('error');
		  return false;
	  }
	  else {
		  customerCheckResult.classList.add('hide');
	  }
  });
  
  /*통신판매신고번호(숫자)*/
  mailOrderNum.addEventListener('blur',function(){
	  mailOrdCheckResult.classList.remove('hide');
		 if(!check(numberCheck, mailOrderNum,mailOrdCheckResult)) {
			 mailOrdCheckResult.classList.add('error');
			  return false;
		 }else {
			 mailOrdCheckResult.classList.add('hide');
		  }
	  });
  /*계좌번호 유효성(숫자)*/
  bankAccount.addEventListener('blur',function(){
	  bankAccountCheckResult.classList.remove('hide');
		 if(!check(numberCheck, bankAccount,bankAccountCheckResult)) {
			 bankAccountCheckResult.classList.add('error');
			  return false;
		 }else {
			 bankAccountCheckResult.classList.add('hide');
		  }
	  });
  
   
  
  
//핸드폰인증번호 칸  
  var sendAtNum = document.querySelector(".sendAtNum-btn"),
  Authentication = document.querySelector(".Authentication");

sendAtNum.addEventListener("click", function () {
  Authentication.style.display = "flex";
});

/*통신판매신고증 첨부 유효성*/
var reportCard = document.getElementById('reportCard');
var reportCardCheck = document.querySelector('.wrap-input.mailOrd');
reportCard.addEventListener('change',function(){
	reportCardCheck.classList.add('succeed');
});


/* submit 유효성 */
 var form = document.getElementById('join_form'),
 	 submitBtn = document.querySelector('.submitBtn'),
 	requiredCheck1 = document.getElementById('agreement01'),
 	requiredCheck2 = document.getElementById('agreement02');
 	
submitBtn.addEventListener('click',function(){
	 if(!(requiredCheck1.checked && requiredCheck2.checked)){
		 alert('이용약관에 동의하셔야 합니다.');
		 requiredCheck1.focus();
		 return false;
	 }else if(id.value == ''){
		 alert('아이디를 입력해주세요');
		 id.focus();
		 return false;
	 }else if(pw.value == ''){
		 alert("패스워드를 입력해주세요");
		 pw.focus();
		 return false;
	 }else if(pwCheck.value == ''){
		 alert('패스워드 확인해주세요');
		 pwCheck.focus();
		 return false;
	 }else if(phone1.value == '' && phone2.value == '' && email1.value == ''){
		 alert('연락처를 확인해주세요');
		 phone2.focus();
		 return false;
	 }else if(email2.value == '') {
		 alert('이메일을 확인해주세요');
		 email2.focus();
		 return false;
	 }else if(mailOrderNum.value == ''){
		 alert('통신판매신고번호를 입력해주세요');
		 document.querySelector('.reportCard-btn').focus();
		 return false;
	 }else if(businessName == ''){
		 alert('상호자명을 입력해주세요');
		 businessName.focus();
		 return false;
	 }
	 else if(customer.value ==''){
		 alert('담당자명을 입력해주세요');
		 customer.focus();
		 return false;
	 }else if(represent.value == ''){
		 alert('대표자명을 입력해주세요');
		 represent.focus();
		 return false;
	 }else if( bankName.value == ''){
		 alert('정산대금 입금은행을 선택해주셔야 합니다.');
		 bankName.focus();
		 return false;
	 }else if( bankAccount.value == ''){
		 alert('계좌번호를 입력해주세요');
		 bankAccount.focus();
	 }else if (reportCard.value == ''){
		 alert('통신판매신고증을 첨부해주셔야 합니다.');
		 reportCard.focus();
		 return false;
		 
	 }else {
		 form.submit();
	 }
}) 



 
