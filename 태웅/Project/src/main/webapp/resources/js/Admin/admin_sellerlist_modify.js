
// submit(배송지 수정) 버튼
var submitBtn = document.getElementById('submitBtn');

submitBtn.addEventListener('click', function() {
	if (confirm('수정하시겠습니까??') == true) {
		document.getElementById('update__form--sellerlist').submit();
	} else {

		return;
	}
});



/*통신판매신고증 첨부 유효성*/
var reportCard = document.getElementById('reportCard');
var reportCardCheck = document.querySelector('.TH--orderReportImg1');
reportCard.addEventListener('change',function(){
	reportCardCheck.classList.add('succeed');
});







