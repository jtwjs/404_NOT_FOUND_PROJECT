// 체크박스: value값이 Y(기본배송지) 면 체크됨

/*$("input:radio[id ='defaultaddress']:input[value='Y']").attr("checked", true);*/



//submit(배송지 수정) 버튼
var submitBtn = document.getElementById('submitBtn');


submitBtn.addEventListener('click',function() {
	if(confirm('수정하시겠습니까??') == true ) {
		document.getElementById('update__form--listdelivery').submit();
	}
	else {
		return;
	}
});



