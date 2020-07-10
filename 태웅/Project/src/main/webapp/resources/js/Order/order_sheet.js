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