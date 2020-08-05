function orderCancle(i, order_id, board_id){
	
	$.ajax({
	    type: 'GET',
	    url: "OrderCancle.or",
	    data: "order_id=" + order_id + "&board_id=" + board_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var status = document.getElementsByClassName("order-list__status--span")[Number(i)];
	    	status.textContent = "주문취소중";
	    	
	    	var btn = document.getElementsByClassName("order_list__detail-info--btn")[Number(i)];
	    	while(btn.hasChildNodes()){
	    		btn.removeChild( btn.firstChild );
	    	}
	    	
	    	var span = document.createElement("span");
	    	span.textContent = "주문취소중입니다";
	    	btn.appendChild(span);
	    	
	    },
	    error: function(){
	    	
	    }
	});
}

function orderDelivery(i, order_id, board_id){
	
	$.ajax({
	    type: 'GET',
	    url: "OrderDelivery.or",
	    data: "order_id=" + order_id + "&board_id=" + board_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	
	    	
	    },
	    error: function(){
	    	
	    }
	});
}

function orderRefund(i, order_id, board_id){
	
	$.ajax({
	    type: 'GET',
	    url: "OrderRefund.or",
	    data: "order_id=" + order_id + "&board_id=" + board_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var status = document.getElementsByClassName("order-list__status--span")[Number(i)];
	    	status.textContent = "환불확인중";
	    	
	    	var btn = document.getElementsByClassName("order_list__detail-info--btn")[Number(i)];
	    	while(btn.hasChildNodes()){
	    		btn.removeChild( btn.firstChild );
	    	}
	    	
	    	var span = document.createElement("span");
	    	span.textContent = "환불확인중입니다";
	    	btn.appendChild(span);
	    	
	    },
	    error: function(){
	    	
	    }
	});
}

function orderComplete(i, price, amount, order_id, board_id){
	
	$.ajax({
	    type: 'GET',
	    url: "OrderComplete.or",
	    data: "order_id=" + order_id + "&board_id=" + board_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var status = document.getElementsByClassName("order-list__status--span")[Number(i)];
	    	status.textContent = "거래완료";
	    	
	    	var btn = document.getElementsByClassName("order_list__detail-info--btn")[Number(i)];
	    	while(btn.hasChildNodes()){
	    		btn.removeChild( btn.firstChild );
	    	}
	    	
	    	var span = document.createElement("span");
	    	span.textContent = String(Number(price) * Number(amount)) + "P 적립";
	    	span.style.color = "limegreen";
	    	span.style.fontSize = "17px";
	    	btn.appendChild(span);
	    	
	    },
	    error: function(){
	    	
	    }
	});
}