function orderSheetCheck(){
	
	// 유효성 검사 넣어야함
	
	var buyer_phone_input = document.getElementsByClassName("order__info--input-phone");
	var buyer_phone = document.getElementById("buyer_phone");
		
	buyer_phone.value = buyer_phone_input[0].value + "-" + buyer_phone_input[1].value + "-" 
	    + buyer_phone_input[2].value;
	
	var address_text = document.getElementsByClassName("address__text");
	var order_address = document.getElementById("order_address");
	
	order_address.value = address_text[0].value + " " + address_text[1].value;
	
	var order_phone_input = document.getElementsByClassName("recipient__text--phone"); 
	var order_phone = document.getElementById("order_phone");
	
	order_phone.value = order_phone_input[0].value + "-" + order_phone_input[1].value + "-" 
        + order_phone_input[2].value;
	
	/*submit 버튼*/
	var submitBtn = document.getElementById('submitBtn');
	var form = document.getElementById('orerSheetForm');
	var privacyCheck = document.getElementById('privacy-agree');
	var purchaseCheck = document.getElementById('purchase-agree');
//	submitBtn.addEventListener('click',function(){
//		if(privacyCheck.checked == false) {
//			alert('[개인정보 제3자 제공 동의(필수)] 반드시 입력하셔야 하는 항목입니다.');
//			return false;
//		}else if (purchaseCheck.checked == false){
//			alert('[구매 진행에 동의(필수)] 반드시 입력하셔야 하는 항목입니다.');
//			return false;
//		}
//	}) ;
		

	
	return true;
}

function data_check(){
	var data_checkBox = document.getElementsByClassName("data-checkBox");
	
	if(data_checkBox[0].checked == true){
		var buyer_name = document.getElementById("buyer_name");
		var buyer_phone = document.getElementsByClassName("order__info--input-phone");
		var order_name = document.getElementById("recipient__text--name");
		var order_phone = document.getElementsByClassName("recipient__text--phone"); 
		
		order_name.value = buyer_name.value;
		
		for(var i = 0; i < buyer_phone.length; i++){
			order_phone[i].value = buyer_phone[i].value;
		}
	}else{
		var order_name = document.getElementById("recipient__text--name");
		var order_phone = document.getElementsByClassName("recipient__text--phone"); 
		
        order_name.value = "";
        order_name.readOnly = true;
		
		for(var i = 0; i < order_phone.length; i++){
			order_phone[i].value = "";
			order_phone[i].readOnly = true;
		}
	}
}


/*적립금 사용*/
var reserves = document.getElementById('reserves');
	savePoint = document.getElementById('save-point__input-text'),
	totalProductValue = document.getElementById('totalProductAmountValue').value,
	totalDelvieryValue = document.getElementById('totalDeliveryAmountValue').value,
	reserveUse = document.getElementById('reserveUse'),
	totalDiscount = document.getElementById('totalDiscount'),
	totalPayment = document.getElementById('totalPaymentAmount');
	
totalPayment.value = Number(totalProductValue) + Number(totalDelvieryValue); 

$('#save-point__input-text').on("propertychange change keyup paste input",function(){
	if(Number(savePoint.value) >Number(reserves.value)){
		if(reserves.value > (totalProductValue*0.07)) {
			savePoint.value = parseInt(totalProductValue*0.07);
		} else {
			savePoint.value = reserves.value;
		}
	}
	totalPayment.value = Number(totalProductValue) + Number(totalDelvieryValue); 
	reserveUse.value = $(this).val();
	totalDiscount.value = reserveUse.value;
	totalPayment.value -= totalDiscount.value;
});




/*적립금 전액사용*/

var fullUse_btn = document.getElementById('save-point__input-btn');

fullUse_btn.addEventListener('click',full_use);

function full_use() {
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url: '/project/savePointFullUse.or',
		type: 'POST',
		beforeSend: function(xhr){
			  /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			  xhr.setRequestHeader(header, token);
		  },
		dataType: 'json',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data){
			if((totalProductValue*0.07)<data){
				savePoint.value = parseInt(totalProductValue*0.07);
			}else {
				savePoint.value = data;
			}
			
			totalPayment.value = Number(totalProductValue) + Number(totalDelvieryValue); 
			reserveUse.value = savePoint.value;
			totalDiscount.value = reserveUse.value;
			totalPayment.value -= totalDiscount.value;
		},
		error: function(xhr,status,error){
			  console.log('error:'+error);
		  }
	});
}


/*예상적립금*/
var exceptedSp = document.getElementById('expected_sp');
var totalSp = document.getElementById('total_sp').value;
if(exceptedSp != null){
exceptedSp.value = totalSp;
}



/*주소지 선택(기본배송지, 새로운배송지)*/
var defaultAddr = document.getElementById('default_addr');
var newAddr = document.getElementById('new_addr');
var postcode = document.getElementById("sample4_postcode");
var roadAddr = document.getElementById('sample4_roadAddress');
var detailAddr = document.getElementById('sample4_detailAddress');
var defaultPostcode = document.getElementById('userAddrNum').value;
var defaultRoadAddr = document.getElementById('userAddrRoadName').value;
var defaultDetailAddr = document.getElementById('userAddrDetail').value;

if(newAddr != null){
newAddr.addEventListener('click',function(){
	if(newAddr.getAttribute("checked")){
		return;
	}else {
		postcode.value = '';
		roadAddr.value = '';
		detailAddr.value ='';
	}
});
}
defaultAddr.addEventListener('click',function(){
	if(defaultAddr.getAttribute('checked')){
		return;
	}else {
		postcode.value = defaultPostcode;
		roadAddr.value = defaultRoadAddr;
		detailAddr.value = defaultDetailAddr;
	}
});


/*주소록 팝업창*/

var addrBookBtn = document.getElementById('addrBook_btn');

if(addrBookBtn != null){
addrBookBtn.addEventListener('click',function(){
	popupOpen();
});
}
function popupOpen(){
	var url = "addrBook_popup.or";
	var winWidth = 500;
	var winHeight = 600;
	var popupOption = "width=" +winWidth+",height="+winHeight;
	window.open(url,"",popupOption)
		
}


/*결제 정보 선택*/


$(function() {
	$('input:radio[name="payment-method"]').change(function(){
		if($(this).val() == '신용카드') {
			document.getElementById('credit-card').classList.remove('hide');
			document.getElementById('virtual_account').classList.add('hide');
			document.getElementById('bank_transfer').classList.add('hide');
			document.getElementById('mobile_pay').classList.add('hide');
			document.getElementById('kakao_pay').classList.add('hide');
		}else if($(this).val() == '가상계좌') {
			document.getElementById('credit-card').classList.add('hide');
			document.getElementById('virtual_account').classList.remove('hide');
			document.getElementById('bank_transfer').classList.add('hide');
			document.getElementById('mobile_pay').classList.add('hide');
			document.getElementById('kakao_pay').classList.add('hide');
		}else if($(this).val() == '계좌이체') {
			document.getElementById('credit-card').classList.add('hide');
			document.getElementById('virtual_account').classList.add('hide');
			document.getElementById('bank_transfer').classList.remove('hide');
			document.getElementById('mobile_pay').classList.add('hide');
			document.getElementById('kakao_pay').classList.add('hide');
		}else if($(this).val() == '휴대전화') {
			document.getElementById('credit-card').classList.add('hide');
			document.getElementById('virtual_account').classList.add('hide');
			document.getElementById('bank_transfer').classList.add('hide');
			document.getElementById('mobile_pay').classList.remove('hide');
			document.getElementById('kakao_pay').classList.add('hide');
		}else if($(this).val() == '카카오페이') {
			document.getElementById('credit-card').classList.add('hide');
			document.getElementById('virtual_account').classList.add('hide');
			document.getElementById('bank_transfer').classList.add('hide');
			document.getElementById('mobile_pay').classList.add('hide');
			document.getElementById('kakao_pay').classList.remove('hide');
		}
	});
});

/*가상계좌 유효기간*/
var timer = document.querySelector('.timer');
var today = new Date(),
	 year = today.getFullYear(),
	 month = today.getMonth() + 1,
	 date = today.getDate() + 2;
timer.innerText = year+"년 "+month+"월 "+date+"일 59분 59초";



/*주문자 동의 (자세히)*/
var detail = document.querySelector('.detail'),
	desc = document.querySelector('.detail-desc');

detail.addEventListener('click',function(){
	if(desc.classList.contains('hide')){
		desc.classList.remove('hide');
		detail.innerText = '닫기';
	} else {
		desc.classList.add('hide');
		detail.innerText = '자세히';
	}
	
});

/*주문자 동의(전체동의)*/

var allCheck = document.getElementById('all_check'),
	checkBox = document.getElementsByName('buyer_agree'),
	checkBoxLength = document.getElementsByName('buyer_agree').length;
	
for(var i=0; i<checkBoxLength; i++){
	checkBox[i].addEventListener('click',function(){
		if(this.checked == false && allCheck.checked == true){
			allCheck.checked = false;
			return;
			}
	});
}


allCheck.addEventListener('click',function(){
	if(all_check.checked){
		check_all();
	}else {
		uncheck_all();
	}
});

function check_all() {
	for(var i=0; i<checkBoxLength; i++){
		checkBox[i].checked = true;
	}
}

function uncheck_all(){
	for(var i=0; i<checkBoxLength; i++){
		checkBox[i].checked = false;
	}
}

///*submit 버튼*/
//var submitBtn = document.getElementById('submitBtn');
//var form = document.getElementById('orerSheetForm');
//var privacyCheck = document.getElementById('privacy-agree');
//var purchaseCheck = document.getElementById('purchase-agree');
//submitBtn.addEventListener('click',function(){
//	if(privacyCheck.checked == false) {
//		alert('[개인정보 제3자 제공 동의(필수)] 반드시 입력하셔야 하는 항목입니다.');
//		return false;
//	}else if (purchaseCheck.checked == false){
//		alert('[구매 진행에 동의(필수)] 반드시 입력하셔야 하는 항목입니다.');
//		return false;
//	}else{
//		form.submit();
//	}
//}) ;
//	

