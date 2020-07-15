function allCheckBox_check(val){
	
	var checkBox = document.getElementsByClassName("cart__check");
	
	if(val.checked == true){
		for(var i = 0; i < checkBox.length; i++){
			checkBox[i].checked = true; 
		}
	}else{
		for(var i = 0; i < checkBox.length; i++){
			checkBox[i].checked = false; 
		}
	}
}

function checkBox_check(){
	
	var allCheckBox = document.getElementById("cart__all-check");
	var checkBox = document.getElementsByClassName("cart__check");
	
	if(allCheckBox.checked == true){
		for(var i = 0; checkBox.length; i++){
			if(checkBox[i].checked == false){
				allCheckBox.checked = false;
				break;
			}
		}
	}
    
}

var saveVal = 1;

function onInputCheck(val, quantity, cartAmount){
	
	saveVal = cartAmount;
	
	if(val.value != ""){
		if (!(new RegExp(/^[0-9]+$/)).test(val.value)) {
		    val.value = saveVal;
		}
		
		if(val.value >= Number(quantity)){
			val.value = Number(quantity);
		}else if(val.value == 0){
			val.value = 1;
		}
		
		saveVal = val.value;
	}
	
}

function btnQuantityChange(val, i, price, deliveryPrice, quantity){

	var quantityText = document.getElementsByClassName("quantity-input")[Number(i)];
    var quantityNum = Number(quantityText.value);
	
	if(val == "-"){
		if(quantityNum > 1 && Number(quantity) >= quantityNum){
			quantityNum -= 1;
		}
	}else if(val == "+"){
		if(quantityNum < 99 && Number(quantity) > quantityNum){
			quantityNum += 1;
		}
	}
	
	quantityText.value = quantityNum;
	saveVal = quantityNum;
	tableTotPriceChange(quantityNum, i , price, deliveryPrice);
}

function tableTotPriceChange(val, i, price, deliveryPrice){
	
	if(val == ""){
		val = saveVal;
	}

	var calcPrice = (Number(price) * Number(val)) + Number(deliveryPrice);
	
	var tableTotPrice = document.getElementsByClassName("table__tot-price")[Number(i)];
	tableTotPrice.textContent = calcPrice;
	
	totPriceChange();
	
	
	var cart_id = document.getElementsByClassName("cart_id")[Number(i)];
	
	// XMLHttpRequest 객체의 인스턴스를 생성합니다.
	var xhr = new XMLHttpRequest();

	// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
	xhr.open("GET", "CartAmountCalc.or?cart_id=" + cart_id.value + "&quantity=" + val, true);

	// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
	xhr.send();
}

function totPriceChange(){
	
	var product_tot_price = document.getElementById("product__tot-price");
	var delivery_tot_price = document.getElementById("delivery__tot-price");
	var cart_tot_price = document.getElementById("cart__tot-price");
	
	var product_price = document.getElementsByClassName("cart__td--price");
	var delivery_price = document.getElementsByClassName("cart__td--delivery-price");
	var product_quantity = document.getElementsByClassName("quantity-input");
	
	var calc_product_price = 0;
	var calc_delivery_price = 0;
	
	for(var i = 0; i < product_price.length; i++){
		calc_product_price += (Number(product_price[i].textContent) * Number(product_quantity[i].value));
		calc_delivery_price += Number(delivery_price[i].textContent);
	}
	
	product_tot_price.value = calc_product_price;
	delivery_tot_price.value = calc_delivery_price;
	cart_tot_price.value = calc_product_price + calc_delivery_price;
	
}


function btn_select_delete(login_case){
	
	var checkBox = document.getElementsByClassName("cart__check");
	var cart_table = document.querySelector("#cart-table-tbody");
	var cart_id = document.getElementsByClassName("cart_id");
	var checkBoxLength = Number(checkBox.length);
	
	// XMLHttpRequest 객체의 인스턴스를 생성합니다.
	var xhr = new XMLHttpRequest();
	
	if(login_case == 1){
		for(var i = 0; i < checkBoxLength; i++){
			
			if($("input[class='cart__check']").eq(i).prop("checked")){
				
				// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
				xhr.open("GET", "CartDelete.or?cart_id=" + cart_id[i].value, true);
				// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
				xhr.send();
				
				cart_table.deleteRow(i);
				i -= 1;
			}
		}
	}else{

		var cookieBoardID = getCookieValue("nonMember_board_id");
		var cookieQuantity = getCookieValue("nonMember_quantity");
		
		
		
		var cookieBoardIDArr = getCookieArray(cookieBoardID, "a");
		var cookieQuantityArr = getCookieArray(cookieQuantity, "a");
		
		var boardIdReplace = "";
		var quantityReplace = "";

		
		for(var i = 0; i < checkBoxLength; i++){
			
			alert($("input[class='cart__check']").eq(i).prop("checked"));
			
			if(!$("input[class='cart__check']").eq(i).prop("checked")){
				
				if(boardIdReplace == ""){
					boardIdReplace = cookieBoardIDArr[i];
					quantityReplace = cookieQuantityArr[i];
					
					deleteCookie("nonMember_board_id");
					deleteCookie("nonMember_quantity");
				}else{
					boardIdReplace += "a"+ cookieBoardIDArr[i];
					quantityReplace += "a"+ cookieQuantityArr[i];
				}
					
				
			}else{
				
				cart_table.deleteRow(i);
			}
		}
		
		if(boardIdReplace != ""){
			
			setCookie("nonMember_board_id", boardIdReplace);
			setCookie("nonMember_quantity", quantityReplace);
		}else{
			deleteCookie("nonMember_board_id");
			deleteCookie("nonMember_quantity");
		}
		
		
	}
	

	
	if(cart_table.rows.length == 1){  // css 구조 변경(금액 계산 칸 따로 만듬) 후 0으로 바꿀 것
		var row = cart_table.insertRow(0);
		var firstCell = row.insertCell(0);
		firstCell.colSpan = "7";
		firstCell.className = "cart__none";
		firstCell.innerText = "장바구니에 담아둔 상품이 없습니다";
	}
	
	totPriceChange();
	
	
}

function getCookieValue(key) {
	var cookieKey = key + "="; 
    var result = "";
    var cookieArr = document.cookie.split(";");
    
    for(var i = 0; i < cookieArr.length; i++){
    	if(cookieArr[i][0] === " ") {
            cookieArr[i] = cookieArr[i].substring(1);
        }
	    
        if(cookieArr[i].indexOf(cookieKey) === 0) {
        	result = cookieArr[i].slice(cookieKey.length, cookieArr[i].length);
        	return result;
        }
    }
    
    return result;
}

function getCookieArray(key) {
	var cookieArr = new Array();
	var cookieArr = key.split("a");
	
	return cookieArr;
}

function setCookie(cookieName, cookieValue){
    var cookieText = escape(cookieName) + '=' + escape(cookieValue);
    cookieText += (';path=/');
    document.cookie = cookieText;
}

function deleteCookie(cookieName){
	document.cookie = cookieName + "=;path=/;expires=0;";
}


// json 타입으로 컨트롤러로 전송, 안씀, 지우지 말 것
//function btn_order(){
//	
//    var checkBox = document.getElementsByClassName("cart__check");
//    var checkBoardId = document.getElementsByClassName("board_id_check");
//    var checkQuantity = document.getElementsByClassName("quantity-input");
//    var boardIdArray = new Array();
//
//    for(var i = 0; i < checkBox.length; i++){
//        if(checkBox[i].checked == true){
//        	var data = new Object();
//        	data.board_id = checkBoardId[i].value;
//        	data.quantity = checkQuantity[i].value;
//        	boardIdArray.push(data);
//        }
//    }
//    
//    var board_id_array = JSON.stringify(boardIdArray);
//    //var board_id_array = JSON.parse(board_id_serialize);
//    
//    location.href= "OrderSheet.or";
//    // XMLHttpRequest 객체의 인스턴스를 생성합니다.
//	var xhr = new XMLHttpRequest();
//
//	// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
//	xhr.open("POST", "OrderResponse.or", false);
//
//	xhr.setRequestHeader('Content-Type', 'application/json'); // 컨텐츠타입을 json으로
//	xhr.send(board_id_array); // 데이터를 stringify해서 보냄
//}

function btn_order(login_case, buyer_id){
	
    var checkBox = document.getElementsByClassName("cart__check");
    var checkBoardId = document.getElementsByClassName("board_id_check");
    var checkQuantity = document.getElementsByClassName("quantity-input");
    var orderForm = document.getElementById("orderForm");
    var data_array = new Array();
    
    var login_id = buyer_id;
    
    if(login_case != "1"){
    	login_id = getCookieValue("nonMember_buyer_id");
    }

    for(var i = 0; i < checkBox.length; i++){
        if(checkBox[i].checked == true){
        	var board_id_field = document.createElement("input");
        	board_id_field.setAttribute("type", "hidden");
        	board_id_field.setAttribute("name", "board_id");
        	board_id_field.setAttribute("value", checkBoardId[i].value);
        	orderForm.appendChild(board_id_field);
        	
        	var quantity_field = document.createElement("input");
        	quantity_field.setAttribute("type", "hidden");
        	quantity_field.setAttribute("name", "quantity");
        	quantity_field.setAttribute("value", checkQuantity[i].value);
        	orderForm.appendChild(quantity_field);
        	
        	
        }
    }
    
    var buyer_id_field = document.createElement("input");
	buyer_id_field.setAttribute("type", "hidden");
	buyer_id_field.setAttribute("name", "buyer_id");
	buyer_id_field.setAttribute("value", login_id);
	orderForm.appendChild(buyer_id_field);
	
	orderForm.submit();

}


