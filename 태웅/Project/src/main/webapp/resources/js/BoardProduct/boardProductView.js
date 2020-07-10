var saveVal = 1;

function onInputCheck(val, quantity){
	
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

function btnQuantityChange(val, price, deliveryPrice, quantity){
	
	var quantityText = document.getElementById("quantity-text");
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
	
	calcTotPrice(quantityNum, price, deliveryPrice);
	
}


function calcTotPrice(quantityNum, price, deliveryPrice){
	
	if(quantityNum == ""){
		quantityNum = saveVal;
	}
	
	var totPriceSpan = document.getElementById("tot-price-span");
	var totPriceInput = document.getElementById("tot-price-input");
	var totPrice = (Number(price) * quantityNum) + Number(deliveryPrice);
	totPriceSpan.textContent = totPrice;
	totPriceInput.value = totPrice;
}

function buyForm(){
	
	var buyForm = document.getElementById("buyForm");
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	
	var quantity_field = document.createElement("input");
	quantity_field.setAttribute("type", "hidden");
	quantity_field.setAttribute("name", "quantity");
	quantity_field.setAttribute("value", quantity.value);
	buyForm.appendChild(quantity_field);
	
	buyForm.submit();
}

function cartForm(){
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	
	location.href = "AddCart.or?board_id=" + board_id.value + "&quantity=" + quantity.value;
}

function wishForm(){
	var board_id = document.getElementById("board_id");
	
	location.href = "AddWishList.by?board_id=" + board_id.value;
}