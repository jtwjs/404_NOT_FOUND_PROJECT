
 /*유효성검사*/
//정규표현식
  const userNameCheck = /^[가-힣]+$/,
		 userIdCheck = /^[a-z0-9_]{6,12}$/,
		 userPwCheck = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/,
		 telCheck = /^[0-9]{4}$/;

  var name = document.getElementById('userName'),
  	   id = document.getElementById('userId'),
  	   pw = document.getElementById('userPw'),
	   pwCheck = document.getElementById('userPwCheck'),
	   email = document.getElementById('email01'),
	   id = document.getElementById('userId'),
	   phone1 = document.getElementById('mPhone2'),
	   phone2 = document.getElementById('mPhone3');

  console.log(id.value);
  
  function idCheck(){
	  if(!check(re,id,"제데로써")){
		  
	  }
	  
  }
  
 //이메일
 function email(form) {
	 
	 var eAddr = form.selectEmail3.selectedIndex;
	 
	 switch(eAddr) {
	 case 0:
		 form.email02.value = '';
		 break;
	 case 1:
		 form.email02.value = 'naver.com';
		 break;
	 case 2:
		 form.email02.value = 'daum.net';
		 break;
	 case 3:
		 form.email02.value = 'gmail.com';
		 break;
	 }
	 return true;
 };