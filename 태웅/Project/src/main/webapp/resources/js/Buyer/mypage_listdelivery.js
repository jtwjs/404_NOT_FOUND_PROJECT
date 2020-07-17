//submit(배송지 등록) 버튼

var submitBtn = document.getElementById('submitBtn');

submitBtn.addEventListener('click', function() {
	if (confirm('등록하시겠습니까??') == true) {
		document.getElementById('insert__listdelivery--form').submit();
	} else {
		return;
	}
});

