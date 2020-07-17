var scrollCheck;
document.addEventListener("scroll", function(event){
	scrollCheck = true;
});

var headerTimer2 = setInterval(function(){
	if(scrollCheck){
		checkScrolled();
		scrollCheck = false;
	}
	
}, 250);

var lastScrollTop2 = 0;

function checkScrolled(){
	
	var st2 = $(this).scrollTop(); //현재 스크롤의 위치 저장
	
	if (Math.abs(lastScrollTop2 - st2) <= 5) {
	    return;
	}
	
	if(st2 > 1300){
		
		$(".menu-bar").attr("id", "view__menu-bar--fixed");
		
		
	}else{
		$(".menu-bar").attr("id", "view__menu-bar");

	}
	
	if(st2 > $("#customer-review").offset().top-240 && st2 < $("#customer-qna").offset().top-120){
		$("#board__review--move").addClass("menu__display--check");
		
		if($("#board__content--move").is(".menu__display--check") === true) {
			$("#board__content--move").removeClass("menu__display--check");
		}
		if($("#board__qna--move").is(".menu__display--check") === true) {
			$("#board__qna--move").removeClass("menu__display--check");
		}
		if($("#board__delivery--move").is(".menu__display--check") === true) {
			$("#board__delivery--move").removeClass("menu__display--check");
		}
		
		
	}else if(st2 > $("#customer-qna").offset().top-240 && st2 < $("#seller-etc").offset().top-120){
        $("#board__qna--move").addClass("menu__display--check");
		
		if($("#board__content--move").is(".menu__display--check") === true) {
			$("#board__content--move").removeClass("menu__display--check");
		}
		if($("#board__review--move").is(".menu__display--check") === true) {
			$("#board__review--move").removeClass("menu__display--check");
		}
		if($("#board__delivery--move").is(".menu__display--check") === true) {
			$("#board__delivery--move").removeClass("menu__display--check");
		}
	}else if(st2 > $("#seller-etc").offset().top-240){
		 $("#board__delivery--move").addClass("menu__display--check");
			
			if($("#board__content--move").is(".menu__display--check") === true) {
				$("#board__content--move").removeClass("menu__display--check");
			}
			if($("#board__review--move").is(".menu__display--check") === true) {
				$("#board__review--move").removeClass("menu__display--check");
			}
			if($("#board__qna--move").is(".menu__display--check") === true) {
				$("#board__qna--move").removeClass("menu__display--check");
			}
		
	}else{
		$("#board__content--move").addClass("menu__display--check");
		
		if($("#board__review--move").is(".menu__display--check") === true) {
			$("#board__review--move").removeClass("menu__display--check");
		}
		if($("#board__qna--move").is(".menu__display--check") === true) {
			$("#board__qna--move").removeClass("menu__display--check");
		}
		if($("#board__delivery--move").is(".menu__display--check") === true) {
			$("#board__delivery--move").removeClass("menu__display--check");
		}
	}
	
	lastScrollTop2 = st2;
}

$("#board__content--move").on("click", function (e) {
	e.preventDefault();//anchor이벤트의 기본동작을 막는다.
	var targetContent = $(this).attr("href");
	$(window).scrollTop($(targetContent).offset().top - 120);
});

$("#board__review--move").on("click", function (e) {
	e.preventDefault();//anchor이벤트의 기본동작을 막는다.
	var targetReview = $(this).attr("href");
	$(window).scrollTop($(targetReview).offset().top - 120);
});

$("#board__qna--move").on("click", function (e) {
	e.preventDefault();//anchor이벤트의 기본동작을 막는다.
	var targetQna = $(this).attr("href");
	$(window).scrollTop($(targetQna).offset().top - 120);
});

$("#board__delivery--move").on("click", function (e) {
	e.preventDefault();//anchor이벤트의 기본동작을 막는다.
	var targetDelivery = $(this).attr("href");
	$(window).scrollTop($(targetDelivery).offset().top - 120);
});


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

function buyForm(user_id, login_case){
	var buyForm = document.getElementById("buyForm");
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	
	var btn_check = document.getElementById("btn__check--val");
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	btn_check.value = 1;
	
	var buyer_id = user_id;
    
    if(login_case != 1){
    	if(getCookieValue("nonMember_buyer_id") == ""){
    		deleteCookie("nonMember_buyer_id");
    		setCookie("nonMember_buyer_id", "nonMember-" + uuidName());
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
		modal_show();
		
	}else{
		
		buyForm.submit();
	}
	
	
}

function uuidName() {
    function randuuid() {
        return Math.floor((1 + Math.random()) * 0x10000)
            .toString(10)
            .substring(1);
        }
    return randuuid() + randuuid() + randuuid();
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

function cartForm(user_id, login_case){
	
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	var quantity = document.getElementById("quantity-text");
	var board_id = document.getElementById("board_id");
	var btn_check = document.getElementById("btn__check--val");
	btn_check.value = 2;
	 
	 if(login_case != 1){ // 비회원
		 
		var checkVal = getCookieValue("nonMember_board_id").split("a");
		
		for(var i = 0; i < checkVal.length; i++){
			if(checkVal[i] == board_id.value){
				
				wish_modal_text.textContent = "이미 장바구니에 등록된 상품입니다";
				modal_ok.value = "장바구니로";
				
				modal_show();
				return false;
			}
		}
		 
		 
	    if(getCookieValue("nonMember_buyer_id") == ""){
	    	deleteCookie("nonMember_buyer_id");
	    	setCookie("nonMember_buyer_id", "nonMember-" + uuidName());
	    }
	    
	    if(getCookieValue("nonMember_board_id") == ""){
	    	deleteCookie("nonMember_board_id");
	    	setCookie("nonMember_board_id", board_id.value);
	    }else{
	    	var setCookieVal = getCookieValue("nonMember_board_id");
	    	deleteCookie("nonMember_board_id");
	    	setCookie("nonMember_board_id", setCookieVal + "a" + board_id.value);
	    }
	    
	    if(getCookieValue("nonMember_quantity") == ""){
	    	deleteCookie("nonMember_quantity");
	    	setCookie("nonMember_quantity", quantity.value);
	    }else{
	    	var setCookieVal = getCookieValue("nonMember_quantity");
	    	deleteCookie("nonMember_quantity");
	    	setCookie("nonMember_quantity", setCookieVal + "a" + quantity.value);
	    }

	}else{ // 회원
		
		// XMLHttpRequest 객체의 인스턴스를 생성합니다.
		var xhr = new XMLHttpRequest();
		// open() 메서드는 요청을 준비하는 메서드입니다. (http 메서드, 데이터를 받아올 URL 경로, 비동기 여부)
		xhr.open("GET", 
				"AddCart.or?board_id=" + board_id.value + "&quantity=" + quantity.value 
				+ "&buyer_id=" + user_id + "&login_case=" + login_case
				, true);
		// send() 메서드는 준비된 요청을 서버로 전송하는 메서드입니다. (서버에 전달될 정보)
		xhr.send();
	}
	
	wish_modal_text.textContent = "장바구니에 등록되었습니다.";
	modal_ok.value = "장바구니로";
	
	modal_show();
}

function wishForm(user_id, login_case){
	
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
	
	
	modal_show();
	
}

function modal_show(){
	
	var wish_modal = document.getElementById("modal-client");
	var wish_modal_content = document.getElementById("modal-content");
	
	wish_modal.style.display = "block"; // 모달창 display none에서 block으로 변경함으로써 띄워줌
	
	var scrollTop = document.documentElement.scrollTop; 

	// 현재 스크롤한 위치 + (모니터 높이 /2) = 현재 화면의 중앙지점 - 컨텐츠 창 높이
	wish_modal_content.style.top = String(Number(scrollTop) + (Number(screen.height) / 2) - (Number(wish_modal_content.clientHeight))) + "px";
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



function modal_review_write(){
	
}

function modal_review_show(modalContent){
	var modal = document.getElementById("modal-client");
	var modal_content = document.getElementById(modalContent);
	
	modal.style.display = "block"; // 모달창 display none에서 block으로 변경함으로써 띄워줌
	
	var scrollTop = document.documentElement.scrollTop; 

	// 현재 스크롤한 위치 + (모니터 높이 /2) = 현재 화면의 중앙지점 - 컨텐츠 창 높이
	modal_content.style.top = String(Number(scrollTop) + (Number(screen.height) / 2) - (Number(modal_content.clientHeight))) + "px";
    // 모달창 중앙 위치 (이용자 화면 길이 - 모달창 크기) / 2 가 모달창 left시작위치
	modal_content.style.left = String((screen.width - modal_content.clientWidth) / 2) +"px";
}

function modal_review_cancle(){
	
}