function setView(statusData, paymentData){
	
	setChecked("status", statusData);
	setChecked("order_payment", paymentData);
	
}

function setChecked(className, str){
	var data = str;
	var name = "." + className;
    
    if(data != null){
    	var arr = data.split(",");
    	for(var i = 0; i < $(name).length; i++){
    		
    		for(var j = 0; j < arr.length; j++){
    			if($(name).eq(i).val() == arr[j]){
    				$(name).eq(i).prop("checked", true);
    			}
    		}
    	}
    }
}

function resetDate(){
	var startDate = document.getElementsByName("start_date")[0];
	var endDate = document.getElementsByName("end_date")[0];
	var today = new Date;
	
	startDate.value = "1980-01-01";
	endDate.value = today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate();
}


function IsJsonString(str) {
	
    try {
        var json = JSON.parse(str);
        return (typeof json === 'object');
    } catch (e) {
        return false;
    }
}


function orderReceiptView(thisBtn, board_id, index){
	
	
	
	$.ajax({
	    type: 'GET',
	    url: "GetOrderReceipt.se",
	    data: "order_id=" + thisBtn.value + "&board_id=" + board_id,
	    contentType: 'application/json; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var obj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var order_id = document.getElementsByClassName("order_id")[0];
	    	order_id.textContent = obj.order_id;
	    	
	    	var order_date = document.getElementsByClassName("order_date")[0];
	    	order_date.textContent = obj.order_date;
	    	
	    	var buyer_id = document.getElementsByClassName("buyer_id")[0];
	    	buyer_id.textContent = obj.buyer_id;
	    	
	    	var status_str = String(obj.status);
	    	var status = document.getElementById("order-status__select");
	    	
	    	status[0].selected = true;
	    	if(status_str == "거래완료"){
    			status.disabled = true;
    		}
	    	
	    	for(var i = 0; i < status.length; i++){
	    		if(status[i].value == status_str){
	    			status[i].selected = true;
	    		}
	    		
	    	}
	    	
	    	var buyer_phone = document.getElementsByClassName("buyer_phone")[0];
	    	buyer_phone.textContent = obj.buyer_phone;
	    	
	    	var order_address = document.querySelector(".order_address > span");
	    	order_address.textContent = obj.order_address;
	    	
	    	var order_name = document.querySelector(".order_name > span");
	    	order_name.textContent = obj.order_name;
	    	
	    	var order_phone = document.querySelector(".order_phone > span");
	    	order_phone.textContent = obj.order_phone;
	    	
	    	var order_delivery_str = String(obj.order_delivery);
	    	var order_delivery = document.getElementById("order_delivery__select");
	    	
	    	order_delivery[0].selected = true;
	    	
	    	for(var i = 0; i < order_delivery.length; i++){
	    		if(order_delivery[i].value == order_delivery_str){
	    			order_delivery[i].selected = true;
	    		}
	    	}
	    		    	
	    	var order_invoicenum_str = String(obj.order_invoicenum);
	    	var order_invoicenum = document.querySelector(".order_invoicenum > span");
	    	order_invoicenum.textContent = order_invoicenum_str;
	    	
	    	var order_price = document.getElementsByClassName("order_price")[0];
	    	order_price.textContent = obj.price;
	    	
	    	var delivery_price = document.getElementsByClassName("delivery_price")[0];
	    	delivery_price.textContent = obj.delivery_price;
	    	
	    	var save_point = document.getElementsByClassName("save_point")[0];
	    	save_point.textContent = obj.save_point;
	    	
	    	var use_point = document.getElementsByClassName("use_point")[0];
	    	use_point.textContent = obj.use_point;
	    	
	    	var order_id = document.getElementsByClassName("order--buyer_id")[0];
	    	order_id.textContent = obj.buyer_id;
	    	
	    	var buyer_name = document.getElementsByClassName("order--buyer_name")[0];
	    	buyer_name.textContent = String(obj.buyer_name);
	    	
	    	var order_payment_str = String(obj.order_payment);
	    	var order_payment = document.getElementsByClassName("cell--order_payment")[0];
	    	order_payment.textContent = order_payment_str;
	    	
	    	var order_account = document.getElementsByClassName("order_account")[0];
	    	order_account.textContent = obj.order_account;
	    	
	    	var amount = document.getElementsByClassName("amount")[0];
	    	amount.textContent = obj.amount;
	    	
	    	var totPrice = document.getElementsByClassName("totPrice")[0];
	    	totPrice.textContent = obj.totPrice;
	    	
	    	var modal_board_id = document.getElementById("modal-board_id");
	    	modal_board_id.value = board_id;
	    	
	    	var modal_status_index = document.getElementById("modal-status-index");
	    	modal_status_index.value = index;
	    	
	    	modal_show();
	    },
	    error: function(){
	    	
	    }
	});

}

function modal_show(){
	var modal = document.getElementById("modal");
	
	modal.style.display = "block";
}

function modal_close(){
	var modal = document.getElementById("modal");
	var displayBtn = document.getElementsByClassName("order-content__display-btn");
	var modifyText = document.getElementsByClassName("order-content__modify--text");
	
	for(var i = 0; i < displayBtn.length; i++){
		if(displayBtn[i].style.display != "none"){
			displayBtn[i].style.removeProperty("color");
			displayBtn[i].style.removeProperty("background-color");
			displayBtn[i].parentNode.querySelector("div").style.display = "none";
		}
		
		if(modifyText[i].value != ""){
			modifyText[i].value = "";
		}
	}
	
	modal.style.display = "none";
}

function repagingPrev(pageNum){
	
	var page_num = Number(pageNum) - 10;
	var page_amount = 20;
	
	var endPage = parseInt(Math.ceil(page_num / 10.0)) * 10;
	
	var form = document.getElementById("content__status-search--form");
	
	var pageNumFiled = document.createElement("input");
	pageNumFiled.setAttribute("type", "hidden");
	pageNumFiled.setAttribute("name", "page_num");
	pageNumFiled.setAttribute("value", endPage);
	form.appendChild(pageNumFiled);
	
	form.submit();
}

function repagingNext(pageNum){
	
	var page_num = Number(pageNum) + 10;
	var page_amount = 20;

	var endPage = parseInt(Math.ceil(page_num / 10.0)) * 10;
	var startPage = endPage - 9;
	
    var form = document.getElementById("content__status-search--form");
	
	var pageNumFiled = document.createElement("input");
	pageNumFiled.setAttribute("type", "hidden");
	pageNumFiled.setAttribute("name", "page_num");
	pageNumFiled.setAttribute("value", startPage);
	form.appendChild(pageNumFiled);
	
	form.submit();
}

function pageMove(pageNum){
	
	var form = document.getElementById("content__status-search--form");
	
	var pageNumFiled = document.createElement("input");
	pageNumFiled.setAttribute("type", "hidden");
	pageNumFiled.setAttribute("name", "page_num");
	pageNumFiled.setAttribute("value", Number(pageNum));
	form.appendChild(pageNumFiled);
		
	form.submit();
}

function orderStatusModify(){
	
	var status = document.getElementById("order-status__select");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "status=" + status.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var i = document.getElementById("modal-status-index").value;
	    	var orderStatus = document.getElementsByClassName("table-list__order-status")[Number(i)];
	    	
	    	orderStatus.value = status.value;
	    	
	    },
	    error: function(){
	    	
	    }
	});
	
}

function orderDeliveryModify(){
	
	var order_delivery = document.getElementById("order_delivery__select");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "order_delivery=" + order_delivery.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	
	    	
	    },
	    error: function(){
	    	
	    }
	});
}

function orderAddrModify(){
	
	var order_address = document.getElementById("order__addr-text");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "order_address=" + order_address.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	if(order_address.value == "" || order_address.value == null || order_address.value.length < 2){
	    		alert("2자 이상 입력해주세요");
	    		return false;
	    	}
	    	
	    	var span = document.querySelector(".order_address > span");
	    	span.textContent = String(order_address.value);
	    	order_address.value = "";
	    	
	    	var slide = document.getElementById("order_addr--display");
	    	slide.setAttribute("class", "slide-up");
	    	slide.style.display = "hidden";
	    	setTimeout(function(){ slide.style.display = "none";},280);
	    	
	    	var btn = document.getElementsByClassName("order-content__display-btn")[0];
	    	btn.style.removeProperty("color");
	    	btn.style.removeProperty("background-color");
	    },
	    error: function(){
	    	
	    }
	});
}

function orderNameModify(){
	
	var order_name = document.getElementById("order__name-text");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "order_name=" + order_name.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	if(order_name.value == "" || order_name.value == null || order_name.value.length < 2){
	    		alert("2자 이상 입력해주세요");
	    		return false;
	    	}
	    	
	    	var span = document.querySelector(".order_name > span");
	    	span.textContent = String(order_name.value);
	    	order_name.value = "";
	    	
	    	var slide = document.getElementById("order_name--display");
	    	slide.setAttribute("class", "slide-up");
	    	slide.style.display = "hidden";
	    	setTimeout(function(){ slide.style.display = "none";},280);
	    	
	    	var btn = document.getElementsByClassName("order-content__display-btn")[1];
	    	btn.style.removeProperty("color");
	    	btn.style.removeProperty("background-color");
	    },
	    error: function(){
	    	
	    }
	});
}

function orderPhoneModify(){
	
	var order_phone = document.getElementById("order__phone-text");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "order_phone=" + order_phone.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	if(order_phone.value == "" || order_phone.value == null || order_phone.value.length < 7){
	    		alert("정상적인 번호가 아닙니다.");
	    		return false;
	    	}
	    	
	    	var span = document.querySelector(".order_phone > span");
	    	span.textContent = String(order_phone.value);
	    	order_phone.value = "";
	    	
	    	var slide = document.getElementById("order_phone--display");
	    	slide.setAttribute("class", "slide-up");
	    	slide.style.display = "hidden";
	    	setTimeout(function(){ slide.style.display = "none";},280);
	    	
	    	var btn = document.getElementsByClassName("order-content__display-btn")[2];
	    	btn.style.removeProperty("color");
	    	btn.style.removeProperty("background-color");
	    },
	    error: function(){
	    	
	    }
	});
}

function orderInvoicenumModify(){
	
	var order_invoicenum = document.getElementById("order__invoicenum-text");
	var board_id = document.getElementById("modal-board_id");
	var order_id = document.getElementsByClassName("order_id")[0];
	
	$.ajax({
	    type: 'GET',
	    url: "OrderReceiptModify.or",
	    data: "order_invoicenum=" + order_invoicenum.value +"&order_id=" + order_id.textContent + 
	            "&board_id=" + board_id.value,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	if(order_invoicenum.value == "" || order_invoicenum.value == null || order_invoicenum.value.length < 10){
	    		alert("정상적인 번호가 아닙니다.");
	    		return false;
	    	}
	    	
	    	var span = document.querySelector(".order_invoicenum > span");
	    	span.textContent = String(order_invoicenum.value);
	    	order_invoicenum.value = "";
	    	
	    	var slide = document.getElementById("order_invoicenum--display");
	    	slide.setAttribute("class", "slide-up");
	    	slide.style.display = "hidden";
	    	setTimeout(function(){ slide.style.display = "none";},280);
	    	
	    	var btn = document.getElementsByClassName("order-content__display-btn")[3];
	    	btn.style.removeProperty("color");
	    	btn.style.removeProperty("background-color");
	    },
	    error: function(){
	    	
	    }
	});
}


function modifyDisplayOpen(thisBtn, displayId){
	
	var display = document.getElementById(displayId);
	
	if(display.style.display != "none"){
		thisBtn.style.removeProperty("color");
		thisBtn.style.removeProperty("background-color");
		display.setAttribute("class", "slide-up");
		display.style.display = "hidden";
		setTimeout(function(){ display.style.display = "none";},280);
	}else{
		thisBtn.style.backgroundColor = "#747cfd";
		thisBtn.style.color = "#fff";
		display.setAttribute("class", "slide-down");
		display.style.display = "inline-block";
	}
}