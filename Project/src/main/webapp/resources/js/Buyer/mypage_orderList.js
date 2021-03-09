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

function IsJsonString(str) {
	
    try {
        var json = JSON.parse(str);
        return (typeof json === 'object');
    } catch (e) {
        return false;
    }
}

function modal_show(){
	var modal = document.getElementById("modal");
	
	var myKey = "djKx70fhzeLWsMiOWmjvoQ"; // sweet tracker에서 발급받은 자신의 키 넣는다.
    
    // 택배사 목록 조회 company-api
    $.ajax({
        type:"GET",
        dataType : "json",
        url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
        success:function(data){
                
                // 방법 1. JSON.parse 이용하기
                var parseData = JSON.parse(JSON.stringify(data));
                 console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
                
                // 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
                var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
                console.log(CompanyArray); 
                
                var myData="";
                $.each(CompanyArray,function(key,value) {
                 // myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');     
                	myData += ('<option value='+value.Code+'>' + value.Name + '</option>'); 
                });
                $("#tekbeCompnayList").html(myData);
        }
    });
    // 배송정보와 배송추적 tracking-api
    $("#myButton1").click(function() {
        var t_code = $('#tekbeCompnayList option:selected').attr('value');
        var t_invoice = $('#invoiceNumberText').val();
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
            success:function(data){
                console.log(data);
                var myInvoiceData = "";
                if(data.status == false){
                    myInvoiceData += ('<p>'+data.msg+'<p>');
                }else{
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"보내는사람"+'</td>');                     
                    myInvoiceData += ('<th>'+data.senderName+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
                    myInvoiceData += ('<th>'+data.itemName+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                    myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                    myInvoiceData += ('</tr>');     
                    myInvoiceData += ('<tr>');                
                    myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                    myInvoiceData += ('<th>'+data.receiverAddr+'</td>');                     
                    myInvoiceData += ('</tr>');                                       
                }
                
                
                $("#myPtag").html(myInvoiceData)
                
                var trackingDetails = data.trackingDetails;
                
                
                var myTracking="";
                var header ="";
                header += ('<tr>');                
                header += ('<th>'+"시간"+'</th>');
                header += ('<th>'+"장소"+'</th>');
                header += ('<th>'+"유형"+'</th>');
                header += ('<th>'+"전화번호"+'</th>');                     
                header += ('</tr>');     
                
                $.each(trackingDetails,function(key,value) {
                    myTracking += ('<tr>');                
                    myTracking += ('<td>'+value.timeString+'</td>');
                    myTracking += ('<td>'+value.where+'</td>');
                    myTracking += ('<td>'+value.kind+'</td>');
                    myTracking += ('<td>'+value.telno+'</td>');                     
                    myTracking += ('</tr>');                                    
                });
                
                $("#myPtag2").html(header+myTracking);
                
            }
        });
    });
	
	modal.style.display = "block";
}

function modal_close(){
	var modal = document.getElementById("modal");
	
	modal.style.display = "none";
}

function orderDelivery(order_id, board_id, delivery, invoicenum){
	
	$.ajax({
	    type: 'GET',
	    url: "OrderDelivery.or",
	    data: "order_id=" + order_id + "&board_id=" + board_id,
	    contentType: 'application/json; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	var obj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var order_delivery = document.getElementsByClassName("modal__delivery--content")[0];
	    	var order_invoicenum = document.getElementsByClassName("modal__delivery--content")[1];
	    	
	    	order_delivery.textContent = delivery;
	    	order_invoicenum.textContent = invoicenum;
	    	
	    	var invoiceNumberText = document.getElementById("invoiceNumberText");
	    	invoiceNumberText.value = invoicenum;
	    	
	    	modal_show();
	    	
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
	    url: "OrderConfirmation.or",
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
	    	
	    	span.textContent = String((Number(price) * Number(amount) * 0.03)) + "P 적립";
	    	span.style.color = "limegreen";
	    	span.style.fontSize = "17px";
	    	btn.appendChild(span);
	    	
	    },
	    error: function(){
	    	
	    }
	});
}