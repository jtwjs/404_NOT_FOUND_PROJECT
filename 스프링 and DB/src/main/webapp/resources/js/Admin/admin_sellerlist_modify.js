/*통신판매신고증 첨부 유효성*/
var reportCard = document.getElementById('reportCard');
var reportCardCheck = document.querySelector('.TH--orderReportImg1');
reportCard.addEventListener('change',function(){
	reportCardCheck.classList.add('succeed');
});


// submit(배송지 수정) 버튼

var submitBtn = document.getElementById('submitBtn');

submitBtn.addEventListener('click', function() {
	if (confirm('수정하시겠습니까??') == true) {
		if(reportCard.value == '') {
			alert('통신판매신고증을 첨부해주셔야 합니다.');
		} else {
			document.getElementById('update__form--sellerlist').submit();
		}
	}
});

//이미지 확대 (통신판매신고증)

var img = document.getElementsByTagName("img");
for (var x = 0; x < img.length; x++) {
  img.item(x).onclick=function() {window.open(this.src)}; 
}

