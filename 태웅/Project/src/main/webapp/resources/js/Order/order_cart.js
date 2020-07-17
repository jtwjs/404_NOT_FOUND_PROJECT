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
	
	totPriceChange();
}

function checkBox_check(productPrice, deliveryPrice){
	
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
	
	totPriceChange();
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

function tableTotPriceChange(val, i, price, deliveryPrice, login_case){
	
	if(val == ""){
		val = saveVal;
	}

	var calcPrice = (Number(price) * Number(val)) + Number(deliveryPrice);
	
	var tableTotPrice = document.getElementsByClassName("table__tot-price")[Number(i)];
	tableTotPrice.textContent = calcPrice;
	
	totPriceChange();
	
	if(login_case == 1){
	    var cart_id = document.getElementsByClassName("cart_id")[Number(i)];
	
	    // XMLHttpRequest 객체의 인스턴스를 생성합니다.
	    var xhr = new XMLHttpRequest();

	    // open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
	    xhr.open("GET", "CartAmountCalc.or?cart_id=" + cart_id.value + "&quantity=" + val, true);

	    // send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
	    xhr.send();
	}else{
		
		var cookieQuantity = getCookieValue("nonMember_quantity");
		var cookieQuantityArr = getCookieArray(cookieQuantity, "a");
		var newCookieSet = "";
		
		if(i != 0){
			newCookieSet = cookieQuantityArr[0];
		}else{
			newCookieSet = val;
		}
		
		if(cookieQuantityArr.length > 1){
			for(var j = 1; j < cookieQuantityArr.length; j++){
				if(Number(i) == Number(j)){
					cookieQuantityArr[j] = val;
				}
				newCookieSet += ("a" + cookieQuantityArr[j]);
			}
		}
		
		deleteCookie("nonMember_quantity");
		setCookie("nonMember_quantity", newCookieSet);
		
	}
	
}

function totPriceChange(){
	
	var product_tot_price = document.getElementById("product__tot-price");
	var delivery_tot_price = document.getElementById("delivery__tot-price");
	var cart_tot_price = document.getElementById("cart__tot-price");
	
	var product_price = document.getElementsByClassName("cart__td--price");
	var delivery_price = document.getElementsByClassName("cart__td--delivery-price");
	var product_quantity = document.getElementsByClassName("quantity-input");
	
    var checkBox = document.getElementsByClassName("cart__check");
	
    var calc_product_price = 0;
	var calc_delivery_price = 0;
    
    for(var i = 0; i < checkBox.length; i++){
        if(checkBox[i].checked == true){
        	calc_product_price += (Number(product_price[i].textContent) * Number(product_quantity[i].value));
    		calc_delivery_price += Number(delivery_price[i].textContent);

    		
        }
	}
	
	product_tot_price.value = String(calc_product_price) + " 원";
	delivery_tot_price.value = String(calc_delivery_price) + " 원";
	cart_tot_price.value = String(calc_product_price + calc_delivery_price) + " 원";
	
}


function btn_select_delete(login_case){
	
	var checkBox = document.getElementsByClassName("cart__check");
	var cart_table = document.querySelector("#cart-table-tbody");
	var cart_id = document.getElementsByClassName("cart_id");
	var checkBoxLength = Number(checkBox.length);
	
	// XMLHttpRequest 객체의 인스턴스를 생성합니다.
	var xhr = new XMLHttpRequest();
	
	if(login_case == 1){
		var count = 0;
		for(var i = 0; i < checkBoxLength; i++){
			
			if($("input[class='cart__check']").eq(count).prop("checked")){
				
				// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
				xhr.open("GET", "CartDelete.or?cart_id=" + cart_id[count].value, true);
				// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
				xhr.send();
				
				cart_table.deleteRow(count);
				count -= 1;
			}
			count++;
		}
	}else{

		var cookieBoardID = getCookieValue("nonMember_board_id");
		var cookieQuantity = getCookieValue("nonMember_quantity");
		
		var cookieBoardIDArr = getCookieArray(cookieBoardID, "a");
		var cookieQuantityArr = getCookieArray(cookieQuantity, "a");
		
		var boardIdReplace = "";
		var quantityReplace = "";

		var count = 0;
		for(var i = 0; i < checkBoxLength; i++){
		
			if($("input[class='cart__check']").eq(count).prop("checked")){
				
				cart_table.deleteRow(count);
				count -= 1;

				
			}else{
				
				if(boardIdReplace == ""){
					boardIdReplace = cookieBoardIDArr[count];
					quantityReplace = cookieQuantityArr[count];
					
				}else{
					boardIdReplace += "a"+ cookieBoardIDArr[count];
					quantityReplace += "a"+ cookieQuantityArr[count];
				}
				
				
			}
			count++;
		}
		
		deleteCookie("nonMember_board_id");
		deleteCookie("nonMember_quantity");
		setCookie("nonMember_board_id", boardIdReplace);
		setCookie("nonMember_quantity", quantityReplace);
		
	}

	
	if(cart_table.rows.length == 1){
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
    
    if(checkBox.length == 0){
    	alert("구매할 상품을 선택해주십시오");
    	return false;
    }
    
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


