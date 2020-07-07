var changeBtn = document.getElementById('change_profile-photo');
var hidePart = document.getElementById('update_profile-hidePart');

changeBtn.addEventListener('click',function(){
	if(hidePart.style.display == "" || hidePart.style.display == 'none'){
		hidePart.style.display = "flex";
		changeBtn.style.display = "none";
	}
		
});

//기본이미지로 변경
var defultPhoto = document.getElementById('defult-photo');


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
		location.href="BuyerMyPage.by";
	}
	else {
		return;
	}
});
