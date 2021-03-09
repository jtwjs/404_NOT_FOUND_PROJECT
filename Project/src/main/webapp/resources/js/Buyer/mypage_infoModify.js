var changeBtn = document.getElementById('change_profile-photo');
var hidePart = document.getElementById('update_profile-hidePart');

changeBtn.addEventListener('click',function(){
	if(hidePart.style.display == "" || hidePart.style.display == 'none'){
		hidePart.style.display = "flex";
		changeBtn.style.display = "none";
	}
		
});
//기본이미지로변경
var thumbnail = document.getElementById('profile_thumbnail');
var defaultImgBtn = document.getElementById('default-photo');

defaultImgBtn.addEventListener('click',function(){
	thumbnail.src = "display?path=/img/common/&name=no_profile.png";
	fileInput.value = null;
	
});

//이미지 등록 썸네일변경
var fileInput = document.getElementById('change-photo');
fileInput.addEventListener('change',ajax);
		
	  
function ajax() {
	var xhr = new XMLHttpRequest();
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var file = fileInput.files[0];
	var fileData = new FormData();
	fileData.append('imgFile', file);
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			
			var index = xhr.responseText.indexOf("@");
			var path = xhr.responseText.substring(0,index);
			var img = xhr.responseText.substring(index+1); 
			thumbnail.src = "display?path="+path+"&name="+img;
		}
	}
	xhr.open("POST", "/project/profileThumbnail.by",true);
	xhr.setRequestHeader(header, token);
	xhr.send(fileData);
}


//이미지취소버튼
var cancleBtn = document.getElementById('result-cancleBtn');
var currentImg = document.getElementById('thumbnail_Value');
cancleBtn.addEventListener('click',function(){
	hidePart.style.display = "none";
	changeBtn.style.display = null;
	thumbnail.src = currentImg.value;
	
});

//이미지완료버튼

var completeBtn = document.getElementById('result-completeBtn');

completeBtn.addEventListener('click',function() {
	hidePart.style.display = "none";
	changeBtn.style.display = null;
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
		document.getElementById('update__profile--form').submit();
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
		location.href="UpdateBuyerAccountForm.by";
	}
});
