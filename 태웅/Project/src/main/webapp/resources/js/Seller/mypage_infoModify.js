var changeBtn = document.getElementById('change_profile-photo');
var hidePart = document.getElementById('update_profile-hidePart');

changeBtn.addEventListener('click',function(){
	if(hidePart.style.display == "" || hidePart.style.display == 'none'){
		hidePart.style.display = "flex";
		changeBtn.style.display = "none";
	}
		
});

//기본이미지로변경
var profileImg = document.getElementById('profile_img');
var defaultImgBtn = document.getElementById('default-photo');

defaultImgBtn.addEventListener('click',profile_defaulatImg);

 function profile_defaulatImg() {
	  $.ajax({
		  url: '/project/profile_defaultImg.se',
		  type: 'POST',
		  dataType: 'json',
		  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		  success: function(data){
			 
			  }
		  });  
}


//이미지취소버튼
var cancleBtn = document.getElementById('result-cancleBtn');

cancleBtn.addEventListener('click',function(){
	hidePart.style.display = "none";
	changeBtn.style.display = null;
});

//이미지완료버튼

var completeBtn = document.getElementById('result-completeBtn');

completeBtn.addEventListener('click',function() {
	hidePart.style.display = "none";
	changeBtn.style.display = null;
});


//기존비밀번호input 비교
var originalPw = document.getElementById('originalPw');

//비밀번호 변경
var pwChangeBtn = document.getElementById('pw_changeBtn');
var pwChangeInputWrap = document.getElementById('password_change');
pwChangeBtn.addEventListener("click",function(){
	if(pwChangeInputWrap.classList.contains('hide')){
		pwChangeInputWrap.classList.remove('hide');
	}else {
		pwChangeInputWrap.classList.add('hide');
	}
	
	
});




/*이메일*/
var email2 = document.getElementById('email02'),
	 email3 = document.getElementById('email03');

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






// reset & submit 버튼
var submitBtn = document.getElementById('submitBtn');
var resetBtn = document.getElementById('resetBtn');

submitBtn.addEventListener('click',function() {
	if(confirm('정말로 변경하시겠습니까??') == true ) {
		document.getElementById('update__pforile--form').submit();
	}
	else {
		return;
	}
});


resetBtn.addEventListener('click',function() {
	if(confirm('이 페이지에서 나가시겠습니까? \n변경 사항이 저장되지 않을 수 있습니다') == true) {
		location.href="SellerMyPage.se";
	}
	else {
		return;
	}
});
