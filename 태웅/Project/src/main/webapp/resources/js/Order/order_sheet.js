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


/*적립금 전액사용*/

var fullUse_btn = document.getElementById('save-point__input-btn');

fullUse_btn.addEventListener('click',full_use);

function full_use() {
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    var savePoint = document.getElementById('save-point__input-text');
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
			savePoint.value = data;
		},
		error: function(xhr,status,error){
			  console.log('error:'+error);
		  }
	});
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
newAddr.addEventListener('click',function(){
	if(newAddr.getAttribute("checked")){
		return;
	}else {
		postcode.value = '';
		roadAddr.value = '';
		detailAddr.value ='';
	}
});
defaultAddr.addEventListener('click',function(){
	if(defaultAddr.getAttribute('checked')){
		return;
	}else {
		postcode.value = defaultPostcode;
		roadAddr.value = defaultRoadAddr;
		detailAddr.value = defaultDetailAddr;
	}
});

