
// submit(배송지 수정) 버튼
var submitBtn = document.getElementById('submitBtn');

submitBtn.addEventListener('click', function() {
	if (confirm('수정하시겠습니까??') == true) {
		document.getElementById('update__form--buyerDelflaglist').submit();
	} else {
		return;
	}
});





