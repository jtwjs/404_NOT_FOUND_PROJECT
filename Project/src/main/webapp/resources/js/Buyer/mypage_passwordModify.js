/*유효성검사*/
//정규표현식
const userPwCheck = /^.*(?=^.\S{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

var pw = document.getElementById('userPw'),
	pwCheck = document.getElementById('userPwCheck');

//유효성검사 함수
function check(re, what) {
	  if(re.test(what.value)) {
		  return true;
	  }  
	  what.value = '';
}

/*패스워드 유효성검사*/

pw.addEventListener('blur',function(){
	  if(!check(userPwCheck,pw)){
		  alert('비밀번호 조건에 부합되지 않습니다.');
		  return false;
	  }
});

//패스워드확인 
pwCheck.addEventListener('blur',function(){
	  if(!(pwCheck.value == pw.value)|| pwCheck.value == ""){
		  pwCheck.value = "";
	  }
});



// reset & submit 버튼
var submitBtn = document.getElementById('submitBtn');
var resetBtn = document.getElementById('resetBtn');

submitBtn.addEventListener('click',function() {
	if(confirm('정말로 변경하시겠습니까??') == true) {
		
		if(pw.value == pwCheck.value) {
			document.getElementById('modify__password--form').submit();			
		} 
		else if(!(pw.value == pwCheck.value)) {
			alert('비밀번호가 다릅니다.');
			pw.value = '';
			pwCheck.value = '';
			return false;
		} 
	} else {
		pw.value = '';
		pwCheck.value = '';
		return false;
	}
});


resetBtn.addEventListener('click',function() {
	if(confirm('이 페이지에서 나가시겠습니까? \n변경 사항이 저장되지 않을 수 있습니다') == true) {
		location.href="BuyerMyPage.by";
	}
	else {
		location.href="UpdateBuyerPasswordForm.by";
	}
});
