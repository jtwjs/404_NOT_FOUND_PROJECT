function enableCheck(quantity, status){
	
	if(Number(quantity) < 1 || status == 'N'){
		var buy_btn = document.getElementById("buy-btn");
		var cart_btn = document.getElementById("cart-btn");
		var wish_btn = document.getElementById("wish-btn");
		var tot_price = document.getElementById("tot-price-span");
		tot_price.contentText = "0";
		buy_btn.disabled = true;
		cart_btn.disabled = true;
		wish_btn.disabled = true;
	}
	
}

function selectBigImg(path, imgName){
	
	var bigImg = document.querySelector(".seller-imgBig > img");
	bigImg.setAttribute("src", path+imgName);
}

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

function buyForm(getObj, user_id, login_case){
	var buyForm = document.getElementById("buyForm");
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	
	var btn_check = document.getElementById("btn__check--val");
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	btn_check.value = 1;
	
	var buyer_id = user_id;
    
    if(login_case != "1"){
    	if(getCookieValue("nonMember_buyer_id") == ""){
    		deleteCookie("nonMember_buyer_id");
    		setCookie("nonMember_buyer_id", "nonMember-"+guid());
    	}
    	buyer_id = getCookieValue("nonMember_buyer_id");
    }
    
	
	var quantity_field = document.createElement("input");
	quantity_field.setAttribute("type", "hidden");
	quantity_field.setAttribute("name", "quantity");
	quantity_field.setAttribute("value", quantity.value);
	buyForm.appendChild(quantity_field);
	
	var buyer_field = document.createElement("input");
	buyer_field.setAttribute("type", "hidden");
	buyer_field.setAttribute("name", "buyer_id");
	buyer_field.setAttribute("value", buyer_id);
	buyForm.appendChild(buyer_field);
	
	
	
	if(login_case != 1){
		
		wish_modal_text.textContent = "로그인 상태가 아닙니다.";
		modal_ok.value = "비회원 구매";
		modal_show(getObj);
		
	}else{
		
		buyForm.submit();
	}
	
	
}

function guid() {
    function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1);
        }
    return s4() + s4() + s4();
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

function setCookie(cookieName, cookieValue){
    var cookieText = escape(cookieName) + '=' + escape(cookieValue);
    cookieText += (';path=/');
    document.cookie = cookieText;
}

function deleteCookie(cookieName){
	document.cookie = cookieName + "=;path=/;expires=0;";
}

function cartForm(getObj, user_id, login_case){
	
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	var btn_check = document.getElementById("btn__check--val");
	btn_check.value = 2;
	
	// XMLHttpRequest 객체의 인스턴스를 생성합니다.
	var xhr = new XMLHttpRequest();
	// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
	xhr.open("GET", 
			"AddCart.or?board_id=" + board_id.value + "&quantity=" + quantity.value 
			+ "&buyer_id=" + user_id + "&login_case=" + login_case
			, true);
	// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
	xhr.send();
	
	wish_modal_text.textContent = "장바구니에 등록되었습니다.";
	modal_ok.value = "장바구니로";
	btn_check.value = 2;
	
	
	modal_show(getObj);
}

function wishForm(getObj, user_id, login_case){
	
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	var btn_check = document.getElementById("btn__check--val");
	
	switch(login_case){
	case "1":
		// XMLHttpRequest 객체의 인스턴스를 생성합니다.
		var xhr = new XMLHttpRequest();
		// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
		xhr.open("GET", "AddWishList.by?board_id=" + board_id.value + "&buyer_id=" + user_id, true);
		// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
		xhr.send();
		
		wish_modal_text.textContent = "위시리스트에 등록되었습니다.";
		modal_ok.value = "위시리스트로";
		btn_check.value = 3;
		break;
	default:
		wish_modal_text.textContent = "로그인한 회원이 아닙니다.";
	    modal_ok.value = "로그인 하기";
	    btn_check.value = 5;
		break;
	}
	
	
	modal_show(getObj);
	
}

function modal_show(getObj){
	
	var wish_modal = document.getElementById("modal-client");
	var wish_modal_content = document.getElementById("modal-content");
	
	wish_modal.style.display = "block"; // 모달창 display none에서 block으로 변경함으로써 띄워줌

	// 오브젝트 절대위치 계산 스크롤된 길이 + viewPort의 시작지점을 기준으로 한 상대좌표값 Y
	wish_modal_content.style.top = String(window.pageYOffset + getObj.getBoundingClientRect().top) + "px";
    // 모달창 중앙 위치 (이용자 화면 길이 - 모달창 크기) / 2 가 모달창 left시작위치
    wish_modal_content.style.left = String((screen.width - wish_modal_content.clientWidth) / 2) +"px";
}

function modal_ok(){
	
	var board_id = document.getElementById("board_id");
	var modal_ok = document.getElementById("modal__ok-btn");
	var btn_check = document.getElementById("btn__check--val").value;
	
	switch(btn_check){
	case "1":  // 비회원 구매
		var buyForm = document.getElementById("buyForm");
		buyForm.submit();
		break;
	case "2":  // 장바구니로
		location.href = "CartView.or";
		break;
	case "3":  // 위시리스트로
		location.href = "BuyerMyPageWishList.by";
		break;
	default: // 로그인한 회원이 아닐 때 (찜목록만 사용)
		location.href = "Login.ad";
		break;
	}
}

function modal_cancle(){
	var modal_client = document.getElementById("modal-client");
	modal_client.style.display = "none";
}