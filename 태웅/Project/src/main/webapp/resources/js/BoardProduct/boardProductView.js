var scrollCheck;
document.addEventListener("scroll", function(event){
	scrollCheck = true;
});

var headerTimer2 = setInterval(function(){
	if(scrollCheck){
		checkScrolled();
		scrollCheck = false;
	}
	
}, 50);

var lastScrollTop2 = 0;

function checkScrolled(){
	
	var st2 = $(this).scrollTop(); //현재 스크롤의 위치 저장
	
	if (Math.abs(lastScrollTop2 - st2) <= 5) {
	    return;
	}
	
	if(st2 > 1300){
		
		$(".menu-bar").attr("id", "view__menu-bar--fixed");
		
//		var leftPosition = Number(350);
//		var bodyWidth = document.body.scrollWidth - document.body.clientWidth;
//		
//		if(bodyWidth > 350){
//			leftPosition -= Number(350);
//		}else{
//			leftPosition -= Number(bodyWidth);
//		}
//		$("#view__menu-bar--fixed").children().css("left", String(leftPosition));
		
	}else{
		$(".menu-bar").attr("id", "view__menu-bar");

	}
	
	if(st2 > $("#customer-review").offset().top-240 && st2 < $("#customer-qna").offset().top-240){
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
		
		
	}else if(st2 > $("#customer-qna").offset().top-240 && st2 < $("#seller-etc").offset().top-240){
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


function enableCheck(quantity, status, login_case, user_id, board_id, location){
	
	if(Number(quantity) < 1 || status == 'N'){  // 재고량이 1개 이하이거나 판매중지 상태일 경우 버튼 비활성화
		var buy_btn = document.getElementById("buy-btn");
		var cart_btn = document.getElementById("cart-btn");
		var wish_btn = document.getElementById("wish-btn");
		var tot_price = document.getElementById("tot-price-span");
		tot_price.contentText = "0";
		buy_btn.disabled = true;
		cart_btn.disabled = true;
		wish_btn.disabled = true;
	}
	
	// 사용자가 글을 볼 때마다 조회수(read_count) 1 증가
	$.ajax({
	    type: 'GET',
	    url: "ReadCountPlus.bo?board_id=" + board_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    },
	    error: function(){
	    	
	    }
	});
	
	
	// 위시리스트 부분 수정하여 게시글 타이틀, 사진 썸네일 경로, 이름 테이블에 넣을 것
	if(login_case == 1){ // 구매자 ID로 로그인 중일 때 해당 ID의 위시리스트를 체크하여 등록된 상품일 경우 가상태그로 위시리스트 표시
		
		$.ajax({
		    type: 'GET',
		    url: "WishListCheck.by?board_id=" + board_id + "&buyer_id=" + user_id,
		    contentType: 'application/html; charset=utf-8',
		    cache: false,
		    success: function(data){
		    	
		    	if(data == 1){
		    		$("#wishList__check--mark").attr("class", "wishList__check--mark-y");
		    	}
		    	
		    },
		    error: function(){
		    	
		    }
		});
		
	}
	
	
	if(location != "0"){
		window.scrollTo(0, Number(location));
	}
	
}

function selectBigImg(path, imgName){
	
	var bigImg = document.querySelector(".seller-imgBig > img");
	bigImg.setAttribute("src", "display?path=" + path + "&name=" + imgName);
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
    
    if(login_case == 0){  // 비회원일 때
    	
    	if(getCookieValue("nonMember_buyer_id") == ""){
    		deleteCookie("nonMember_buyer_id");
    		setCookie("nonMember_buyer_id", "nonMember-" + uuidName());
    	}
    	buyer_id = getCookieValue("nonMember_buyer_id");
    	
    	wish_modal_text.textContent = "로그인 상태가 아닙니다.";
		modal_ok.value = "비회원 구매";
		modal_show();
    	
    }else if(login_case == 1){  // 로그인 중인 회원일 때
    	
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
    	
    	buyForm.submit();
    	
    }else if(login_case == 2){  // 판매자일 때
    	
    	wish_modal_text.textContent = "판매자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
		modal_show();
		
    }else{  // 관리자일 때
    	
    	wish_modal_text.textContent = "관리자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
		modal_show();
		
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
	
	wish_modal_text.textContent = "장바구니에 등록되었습니다.";
	modal_ok.value = "장바구니로";
	btn_check.value = 2;
	 
	 if(login_case == 0){ // 비회원
		 
		var checkVal = getCookieValue("nonMember_board_id").split("a");
		
		for(var i = 0; i < checkVal.length; i++){
			if(checkVal[i] == board_id.value){
				
				wish_modal_text.textContent = "이미 장바구니에 등록된 상품입니다.";
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
	    
	    

	}else if(login_case == 1){ // 회원

		var xhr = new XMLHttpRequest();
		
		$.ajax({
		    type: 'GET',
		    url: "AddCart.or?board_id=" + board_id.value + "&quantity=" + quantity.value + "&buyer_id=" + user_id,
		    contentType: 'application/html; charset=utf-8',
		    async:false,
//		    beforeSend : function(xhr) {
//		    	 xhr.setRequestHeader('X-CSRF-Token', csrfToken);
//		    },
		    success: function(data){
		    	wish_modal_text.textContent = data;
		    },
		    error: function(error){
		    	console.log(JSON.stringify(error));
		    }
		});
	}else if(login_case == 2){  // 판매자일 때
    	
    	wish_modal_text.textContent = "판매자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
		modal_show();
		
    }else{  // 관리자일 때
    	
    	wish_modal_text.textContent = "관리자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
		modal_show();
		
    }

	
	
	modal_show();
}

function wishForm(user_id, login_case){
	
	var wish_modal_text = document.querySelector("#modal-content > div > strong");
	var modal_ok = document.querySelector("#modal__ok-btn");
	var btn_check = document.getElementById("btn__check--val");
	
	var param = $("form[id=wishForm]").serialize();
	
	var xhr = new XMLHttpRequest();
	
	switch(login_case){
	case "1":
		
		$.ajax({
		    type: 'GET',
		    url: "AddWishList.by",
		    contentType: 'application/json; charset=utf-8',
		    data: param,
		    cache: false,
		    beforeSend : function(xhr) {
		    	 xhr.setRequestHeader('X-CSRF-Token', $('input[id=wishForm-csrf]').val());
		    },
		    success: function(data){
		    	
		    	if(data == 1){
		    		wish_modal_text.textContent = "찜목록에 등록되었습니다.";
		    		$("#wishList__check--mark").removeClass("wishList__check--mark-n");
		    		$("#wishList__check--mark").addClass("wishList__check--mark-y");
		    	}else{
		    		wish_modal_text.textContent = "이미 찜목록에 등록된 상품입니다.";
		    	}
		    	
		    	
		    },
		    error: function(){
		    	
		    }
		});
		
		modal_ok.value = "위시리스트로";
		btn_check.value = 3;
		break;
	case "2":
		wish_modal_text.textContent = "판매자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
		break;
    case "3":
    	wish_modal_text.textContent = "관리자 ID로는 구매하실 수 없습니다.";
		modal_ok.value = "로그아웃";
		btn_check.value = 4;
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
		
		var buyerIdFiled = document.createElement("input");
		buyerIdFiled.setAttribute("type", "hidden");
		buyerIdFiled.setAttribute("name", "buyer_id");
		buyerIdFiled.setAttribute("value", getCookieValue("nonMember_buyer_id"));
		buyForm.appendChild(buyerIdFiled);
		
		var quantityFiled = document.getElementById("quantity-text");
		quantityFiled.setAttribute("type", "hidden");
		quantityFiled.setAttribute("name", "quantity");
		quantityFiled.setAttribute("value", quantityFiled.value);
		buyForm.appendChild(quantityFiled);
		
		buyForm.submit();
		
		break;
	case "2":  // 장바구니로
		location.href = "CartView.or";
		break;
	case "3":  // 위시리스트로
		location.href = "BuyerMyPageWishList.by";
		break;
	case "4":  // 판매자, 관리자 ID일 때
		location.href = "logout.ad";
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


function sellerBestListMove(move){
	var box = document.getElementById("seller__best-list--search-inner-box");
	
	var val = Number(box.style.left.replace(/[^-\d\.]/g, ''));
	var location;
	
	
	if(val == ""){
		val = Number(0);
	}
	
	if(move == "right" && val > Number(-894)){
		val -= Number(149);
		location = String(val) + "px";
	}else if(move == "left" && val < Number(0)){
		val += Number(149);
		location = String(val) + "px";
	}
	
	
	box.style.left = location;
	
}


var order_id = "test";

function modal_review_write(board_id, user_id){
	
	$.ajax({
	    type: 'GET',
	    url: "BoardReviewCheck.bo?board_id=" + board_id + "&buyer_id=" + user_id,
	    contentType: 'application/html; charset=utf-8',
	    cache: false,
	    success: function(data){
	    	
	    	if(data == 1){
	    		modal_warning("리뷰작성은 1회만 가능합니다.");
	    	}else if(data == 2){
	    		modal_warning("리뷰작성은 판매물품을 구매하신 고객님만 가능합니다.");
	    	}else{
	    		order_id = data;
	    		modal_review_show();
	    	}
	    	
	    },
	    error: function(){
	    	
	    }
	});
	
}

function modal_review_show(){
	var modal = document.getElementById("modal__review");
	var modal_content = document.getElementById("modal__review--content");
	
	modal.style.display = "block"; // 모달창 display none에서 block으로 변경함으로써 띄워줌
	
	var scrollTop = document.documentElement.scrollTop; 

	// 현재 스크롤한 위치 + (모니터 높이 /2) = 현재 화면의 중앙지점 - 컨텐츠 창 높이
	//modal_content.style.top = String(Number(scrollTop) + (Number(screen.height) / 2) - (Number(modal_content.clientHeight))) + "px";
    // 모달창 중앙 위치 (이용자 화면 길이 - 모달창 크기) / 2 가 모달창 left시작위치
	//modal_content.style.left = String((screen.width - modal_content.clientWidth) / 2) +"px";
}

function modal_review_cancle(){
	var modal_client = document.getElementById("modal__review");
	modal_client.style.display = "none";
	$('.star').parent().children('span').removeClass('on');
}



var starOnChildEQ = 0;

var star = $('#star-satisfaction > .star').click(function(){
	
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    starOnChildEQ = $('#star-satisfaction > .star.on').length;
    
    return false;
});

var starHover = $('#star-satisfaction > .star').hover(function(){
	
	starOnChildEQ = $('#star-satisfaction > .star.on').length;
	
	if(starOnChildEQ != 0){
		$(this).parent().children('span').removeClass('on');
	}
	
	$(this).parent().children('span').removeClass('hover');
    $(this).addClass('hover').prevAll('span').addClass('hover');
    
}, function(){
	$(this).parent().children('span').removeClass('hover');
	
	for(var i = 0; i < starOnChildEQ; i++){
		$('#star-satisfaction > .star:nth-child(' + (i+1) + ')').addClass('on');
	}
});

var deliveryStarOnChildEQ = 0;

var deleveryStar = $('#star-delivery-satisfaction > .star').click(function(){
	
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    deliveryStarOnChildEQ = $('#star-delivery-satisfaction > .star.on').length;
    
    return false;
});

var deleveryStarHover = $('#star-delivery-satisfaction > .star').hover(function(){
	
	deliveryStarOnChildEQ = $('#star-delivery-satisfaction > .star.on').length;
	
	if(deliveryStarOnChildEQ != 0){
		$(this).parent().children('span').removeClass('on');
	}
	
	$(this).parent().children('span').removeClass('hover');
    $(this).addClass('hover').prevAll('span').addClass('hover');
    
}, function(){
	$(this).parent().children('span').removeClass('hover');
	
	for(var i = 0; i < deliveryStarOnChildEQ; i++){
		$('#star-delivery-satisfaction > .star:nth-child(' + (i+1) + ')').addClass('on');
	}
});




function review_regist(){
	
	var starCount = parseFloat($('#star-satisfaction').children('span.star.on').length * 0.5);
	var deliveryStarCount 
	    = parseFloat($('#star-delivery-satisfaction ').children('span.star.on').length * 0.5);
	var reviewContent = document.getElementById("review-content--text").value;
	
	if(starCount == 0){
		modal_warning("구매만족도 평점을 선택해주세요.");
		return false;
	}
	
	if(deliveryStarCount == 0){
		modal_warning("배송만족도 평점을 선택해주세요.");
		return false;
	}
	
	if(reviewContent == ""){
		modal_warning("후기 내용을 입력해주세요.");
		return false;
	}
	
	var reviewForm = document.getElementById("reviewForm");
	
	var contentFiled = document.createElement("input");
	contentFiled.setAttribute("type", "hidden");
	contentFiled.setAttribute("name", "content");
	contentFiled.setAttribute("value", reviewContent);
	reviewForm.appendChild(contentFiled);
	
	var satisfactionFiled = document.createElement("input");
	satisfactionFiled.setAttribute("type", "hidden");
	satisfactionFiled.setAttribute("name", "satisfaction");
	satisfactionFiled.setAttribute("value", starCount);
	reviewForm.appendChild(satisfactionFiled);
	
	var deliverySatisfactionFiled = document.createElement("input");
	deliverySatisfactionFiled.setAttribute("type", "hidden");
	deliverySatisfactionFiled.setAttribute("name", "delivery_satisfaction");
	deliverySatisfactionFiled.setAttribute("value", deliveryStarCount);
	reviewForm.appendChild(deliverySatisfactionFiled);
	
	var location = document.querySelector("#customer-review").offsetTop - 120;
	
	var locationFiled = document.createElement("input");
	locationFiled.setAttribute("type", "hidden");
	locationFiled.setAttribute("name", "location");
	locationFiled.setAttribute("value", location);
	reviewForm.appendChild(locationFiled);
	
	var OrderIdFiled = document.createElement("input");
	OrderIdFiled.setAttribute("type", "hidden");
	OrderIdFiled.setAttribute("name", "order_id");
	OrderIdFiled.setAttribute("value", order_id);
	reviewForm.appendChild(OrderIdFiled);
	
	reviewForm.submit();
	
}

function modal_warning(str){
	
	var msg = document.querySelector("#dialog-message--review > p");
	msg.textContent = str;
	msg.style.textAlign = "center";

	$('#dialog-message--review').dialog({
		modal: true, 
		resize: false, 
		width: "500", 
		buttons: {
			dialog_ok_btn:{
				class: "dialog_ok_btn",
				text: "확인",
				click: function(){
					$(this).dialog('close');
				}
			}
		}
	});
	
	$('.dialog_ok_btn').css("margin-right", "190px");
	
}

function reviewComments(flag, i, loc){

	if(flag == 1){
		var commentBox = document.getElementsByClassName("seller__review--comment")[Number(i)];
		
		if(commentBox.style.display == "table-row"){
			commentBox.style.display = "none";
		}else{
			commentBox.style.display = "table-row";
		}
		
	}else if(flag == 2){
		if(loc > Number(-1)){
			
			var reviewComment = document.getElementsByClassName("review-comment")[Number(loc)];
			
			reviewComment.style.height = "33px";
			reviewComment.style.borderBottom = "none";
			
		    if(reviewComment.style.display == "table-row"){
			    reviewComment.style.display = "none";
		    }else{
			    reviewComment.style.display = "table-row";
		    }
		}
	}

}

function reviewCommentSubmit(insertNode, seller_id, review_id, csrfToken, i, flag){
	
     var content = document.getElementsByClassName("seller__review--comment-content")[Number(i)];
     
//     let classes = Array.prototype.slice.call(document.querySelectorAll('.seller__review--comment'));
//     var len = classes[i].getElementsByClassName("seller__review--comment-list").length - 1;
//     var reviewTable = classes[i].getElementsByClassName("seller__review--comment-list")[len];
     
	var reviewList = document.getElementsByClassName("seller__review--comment-list")[i];
     
     $.ajax({
		    type: 'GET',
		    url: "ReviewCommentRegist.bo",
		    contentType: 'application/html; charset=UTF-8',
		    data: "seller_id=" + seller_id + "&content=" + content.value + "&review_id=" + review_id,
		    cache: false,
		    beforeSend : function(xhr) {
		    	 xhr.setRequestHeader('X-CSRF-Token', csrfToken);
		    },
		    success: function(data){
		    	
		    	var obj = JSON.parse(data);
		    	
		    	reviewList.insertAdjacentHTML("afterend",
		                "<div class='seller__review--comment-read'>" + 
		                "    <div class='review-comment--seller'>판매자</div>" + 
                        "    <div class='review-comment--content'>" + content.value + "</div>" + 
                        "    <div class='review-comment--date'>" + obj.date +  
                        "    <input type='button' class='review__comment--delete-btn' value='x' " + 
                        "onclick='reviewCommentDelete(this, \"" + obj.num + "\", \"" + review_id + 
                        "\", \"" + csrfToken + "\");' /></div>" +
                        "</div>");
		    	
		    	content.value = "";
		    },
		    error: function(){
		    	
		    }
		});
}

function reviewCommentDelete(cancleNode, num, review_id, csrfToken){
	
	
	$.ajax({
	    type: 'GET',
	    url: "ReviewCommentDelete.bo",
	    contentType: 'application/html; charset=UTF-8',
	    data: "review_id=" + review_id + "&review_cmt_num=" + num,
	    cache: false,
	    beforeSend : function(xhr) {
	    	 xhr.setRequestHeader('X-CSRF-Token', csrfToken);
	    },
	    success: function(data){
	    	
	    	var commentNode = cancleNode.parentNode.parentNode;
	    	
	        commentNode.parentNode.removeChild(commentNode);
	    	
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

function reviewListPageMove(board_id, thisBtn, login_case, equalsSellerId, user_id){
	
	var csrfToken = document.getElementById('csrfFormId');
	
	$.ajax({
	    type: 'GET',
	    url: "ReviewSelectPage.bo",
	    contentType: 'application/json; charset=UTF-8',
	    data: "board_id=" + board_id + "&page_num=" + thisBtn.value,
	    cache: false,
	    success: function(data){
	    	$('#review__table--now-page').removeAttr("disabled");
	    	$('#review__table--now-page').attr(
	    			"onClick", "reviewListPageMove('" + board_id + "', this, '" + login_case + 
	    			"', '" + equalsSellerId + "')");
	    	$('#review__table--now-page').attr("class", "review__table--page-move");
	    	$('#review__table--now-page').removeAttr("id");
	    	
	    	thisBtn.classList.remove('review__table--page-move');
	    	thisBtn.id = "review__table--now-page";
	    	thisBtn.setAttribute("disabled", "disabled");
	    	$("#review__table--now-page").attr('onclick', '').unbind('click');

	    	var pageText = document.querySelector("#review__page--set > input[type='text']");
	    	pageText.value = thisBtn.value;
	    	
	    	var obj;
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	var tbody = document.querySelector('#customer-review__table > table > tbody');
	    	var len = tbody.rows.length;
	    	
	    	
	    	for(var i = 0; i < len; i++){
	    		tbody.deleteRow(0);
	    	}
	    	
	    	var reviewObj;
	    	var recommendObj;
	    	var recommendArr = new Array();
	    	
	    	if(IsJsonString(obj.review) == true){
	    		reviewObj = JSON.parse(obj.review);
	    		
	    	}
	    	
	    	if(IsJsonString(obj.recommend) == true){
	    		recommendObj = JSON.parse(obj.recommend);
	    		
	    		for(var i = 0; i < recommendObj.length; i++){
	    			if(IsJsonString(recommendObj[i].recommend) == true){
	    				recommendArr[i] = JSON.parse(recommendObj[i].recommend);
//	    				if(recommendArr[i][0] != null){
//	    					alert(recommendArr[i][0].content);
//	    				}
	    				
	    			}
	    		}
	    	}
	    	
	    	var loc = -1;
	    	var saveLoc = -1;
	    	
	    	for(var i = 0; i < reviewObj.length; i++){
	    		var flag = 2;
	    		
	    		if(recommendArr[i].length != 0){
	    			loc = saveLoc;
	    			loc++;
	    			saveLoc = loc;
	    		}else{
	    			loc = 1;
	    		}
	    		
	    		if(login_case == 2){
		    		
		    		if(equalsSellerId == "true"){
		    			flag = 1;
		    		}
		    		
		    	}
	    		
	    		var row = tbody.insertRow(tbody.rows.length);
	    		if((login_case == 2 && equalsSellerId == "true") 
	    				|| recommendArr[i].length != 0){
	    			
	    			row.style.cursor = "pointer";
	    			$(row).attr(
	    					"onclick", "reviewComments('"+ flag + "', '" + i + "', '" + loc + "')");
	    			
	    		}
	    		
	    		var cell1 = row.insertCell(0);
	    		
	    		cell1.className = "customer-review__table--photo";
	    		cell1.insertAdjacentHTML("beforeend", 
	    				"<img src='display?path=" + encodeURI(reviewObj[i].review_img_path) + 
	    				"&name=" + encodeURI(reviewObj[i].review_img_name) + "'/>");
	    		
	    		var cell2 = row.insertCell(1);
	    		
	    		cell2.className = "customer-review__table--recommend";
	    		
	    		if(reviewObj[i].satisfaction < 1.0){
	    			cell2.insertAdjacentHTML("beforeend", 
	    			    "<div class='recommend-1'>비추천</div>");
	    		}else if(reviewObj[i].satisfaction < 2.0){
	    			cell2.insertAdjacentHTML("beforeend", 
    			        "<div class='recommend-2'>추천 안함</div>");
	    		}else if(reviewObj[i].satisfaction < 3.0){
	    			cell2.insertAdjacentHTML("beforeend", 
    			        "<div class='recommend-3'>보통</div>");
	    		}else if(reviewObj[i].satisfaction < 4.0){
	    			cell2.insertAdjacentHTML("beforeend", 
    			        "<div class='recommend-4'>추천</div>");
	    		}else{
	    			cell2.insertAdjacentHTML("beforeend", 
    			        "<div class='recommend-5'>적극추천</div>");
	    		}
	    		
	    		
	    		if(reviewObj[i].delivery_satisfaction < 2.0){
	    			cell2.insertAdjacentHTML("beforeend", 
	    			    "<div class='delivery-1'>배송느림</div>");
	    		}else if(reviewObj[i].delivery_satisfaction < 3.5){
	    			cell2.insertAdjacentHTML("beforeend", 
    			        "<div class='delivery-2'>배송보통</div>");
	    		}else{
	    			cell2.insertAdjacentHTML("beforeend", 
			            "<div class='delivery-3'>배송빠름</div>");
	    		}
	    		
	    		var cell3 = row.insertCell(2);
	    		
	    		cell3.className = "customer-review__table--content";
	    		
                cell3.insertAdjacentHTML("beforeend", 
	                "<p class='review__content--title'>" + reviewObj[i].title + "</p>" + 
                    "<span class='review__content'>" + reviewObj[i].content + "</span>");
                
                var cell4 = row.insertCell(3);
	    		
	    		cell4.className = "customer-review__table--info";
	    		
	    		var getReviewId = reviewObj[i].buyer_id.substring(0,3);
	    		
                for(var j = 0; j < reviewObj[i].buyer_id.length - 3; j++){
                	getReviewId += "*";
                }
	    		
                cell4.insertAdjacentHTML("beforeend", 
	                "<dl>" + 
                    "    <dt>작성자: </dt>" + 
                    "    <dd>" + getReviewId + "</dd>" + 
                    "    <dt>등록일: </dt>" + 
                    "    <dd>" + reviewObj[i].register_date + "</dd>" + 
                    "</dl>" + 
                    "<div class='customer-review__table--star-rating'>" + 
                    "    <span style='width: " + (reviewObj[i].delivery_satisfaction * 20) + "%;'></span>" + 
                    "</div>");
                
                if(equalsSellerId == "true"){
                	
                	var recommendRow = tbody.insertRow(tbody.rows.length);
                	
                	recommendRow.className = "seller__review--comment";
                	
                	var recommendCell = recommendRow.insertCell(0);
                	
                	recommendCell.colSpan = "4";
                	
                	if(recommendArr[i].length != 0){

                		recommendCell.insertAdjacentHTML("beforeend", 
         			       "<div class='seller__review--comment-list'>");
                		
                		for(var j = 0; j < recommendArr[i].length; j++){
                			
                			recommendCell.insertAdjacentHTML("beforeend", 
          			           "<div class='seller__review--comment-read'>" + 
                               "    <div class='review-comment--seller'>판매자</div>" + 
                               "    <div class='review-comment--content'>" + recommendArr[i][j].content + "</div>" + 
                               "    <div class='review-comment--date'>" + recommendArr[i][j].register_date + 
                               "        <input type='button' class='review__comment--delete-btn' " +  
                               "            value='x' onclick=\"reviewCommentDelete(this, '" + 
                               recommendArr[i][j].review_cmt_num + "', '" + recommendArr[i][j].review_id + "', '" + 
                               csrfToken.value + "');\" />" + 
                               		"</div>" + 
                               "</div>");
                		}
                		
                		
                		recommendCell.insertAdjacentHTML("beforeend", 
                			"</div>");
                		
                	}else{
                		recommendCell.insertAdjacentHTML("beforeend", 
            			   "<div class='seller__review--comment-list'></div>");
                	}
                	
                	
                	recommendCell.insertAdjacentHTML("beforeend", 
                			"<div class='seller__review--comment-box'>" + 
                            "    <textarea name='content' maxlength='200' class='seller__review--comment-content'" + 
                            "        placeholder='200자 이하로 댓글을 작성해주세요.'></textarea>" + 
                            "    <input type='button' value='등록'" + 
                            "        onclick=\"reviewCommentSubmit(this, '"+ user_id + "', '" + 
                            reviewObj[i].review_id + "', '" + csrfToken.value + "', '" + i + "');\" />" + 
                            "</div>");
                	
                	
                }else{
                	
                	
                	if(recommendArr[i].length != 0){
                		
                		var recommendRow = tbody.insertRow(tbody.rows.length);
                    	
                    	recommendRow.className = "review-comment";
                    	
                    	var recommendCell = recommendRow.insertCell(0);
                    	
                    	recommendCell.colSpan = "4";
                    	
                    	for(var j = 0; j < recommendArr[i].length; j++){
                    		
                    		recommendCell.insertAdjacentHTML("beforeend", 
                    				"<div>" + 
	                                "    <div class='review-comment--seller'>판매자</div>" + 
	                                "    <div class='review-comment--content'>" + recommendArr[i][j].content + "</div>" + 
	                                "    <div class='review-comment--date'>"+ recommendArr[i][j].register_date + "</div>" + 
	                                "</div>");
	                                		
                    		
                    	}
                		
                	}
                	
                }
                
                

	    	}  // for end
	    	
	    	

	    },
	    error: function(){
	    	
	    }
	});
	
	
	
}

function reviewPageList(btn){
	
	if(btn.value == "이전"){
		
	}else if(btn.value == "다음"){
		
	}
}

var saveReviewPage = 1;

function reviewTextPage(thisTxt, max){
	
	
	
	if(thisTxt.value != ""){
		if (!(new RegExp(/^[0-9]+$/)).test(thisTxt.value)) {
			thisTxt.value = saveReviewPage;
		}
		
		if(thisTxt.value >= Number(max)){
			thisTxt.value = Number(max);
		}else if(thisTxt.value == 0){
			thisTxt.value = 1;
		}
		
		saveReviewPage = thisTxt.value;
    }
	
	
}

function revewTextPage(thisTxt){
//	thisTxt.value로 이동
}



function modal_qna_show(){
	var modal = document.getElementById("modal__qna");
	var modal_content = document.getElementById("modal__qna--content");
	
	modal.style.display = "block"; // 모달창 display none에서 block으로 변경함으로써 띄워줌
	
	//var scrollTop = document.documentElement.scrollTop; 

	// 현재 스크롤한 위치 + (모니터 높이 /2) = 현재 화면의 중앙지점 - 컨텐츠 창 높이
	//modal_content.style.top = String(Number(scrollTop) + (Number(screen.height) / 2) - (Number(modal_content.clientHeight))) + "px";
    // 모달창 중앙 위치 (이용자 화면 길이 - 모달창 크기) / 2 가 모달창 left시작위치
	//modal_content.style.left = String((screen.width - modal_content.clientWidth) / 2) +"px";
}

function modal_qna_cancle(){
	var modal_client = document.getElementById("modal__qna");
	modal_client.style.display = "none";
}

function modal_qna_write(){
	modal_qna_show();
}

function qna_regist(){
	
	var title = document.getElementById("qna__write--content-title");
	var content = document.getElementById("qna-content--text");
	var secretCheck = document.getElementById("secret__check");
	var qnaForm = document.getElementById("qnaForm");
	
	if(title.value == ""){
		modal_warning("제목을 입력해주세요");
		return false;
	}
	
	if(content.value == ""){
		modal_warning("문의내용을 입력해주세요");
		return false;
	}
	
	var checkVal = 2;
	
	if(secretCheck.checked == true){
		checkVal = 1;
	}
	
	var secretFlag = document.createElement("input");
	secretFlag.setAttribute("type", "hidden");
	secretFlag.setAttribute("name", "secret_flag");
	secretFlag.setAttribute("value", checkVal);
	qnaForm.appendChild(secretFlag);
	
    var location = document.querySelector("#customer-qna").offsetTop - 120;
	
	var locationFiled = document.createElement("input");
	locationFiled.setAttribute("type", "hidden");
	locationFiled.setAttribute("name", "location");
	locationFiled.setAttribute("value", location);
	qnaForm.appendChild(locationFiled);
	
	
	return true;
}

function qnaDisplayOpen(thisTr, i){
	
    var contentDisplay 
        = document.getElementsByClassName("customer-qna__table--content-answer")[Number(i)];
    
    if(contentDisplay.style.display == "table-row"){
    	thisTr.style.borderBottom = "1px solid #ced7e2";
    	contentDisplay.style.display = "none";
	}else{
		thisTr.style.borderBottom = "0px";
		contentDisplay.style.display = "table-row";
	}
}

function qnaRecommendSubmit(i, qna_num){

	
	var recommend = document.getElementsByClassName("qna__recommend--content")[Number(i)];
	var csrfToken = document.getElementById("csrfFormId").value;
	var board_id = document.getElementById("board_id").value;
	var seller_id = document.getElementById("seller_id").value;
	
	$.ajax({
	    type: 'GET',
	    url: "QnaRecommendRegist.bo",
	    contentType: 'application/html; charset=UTF-8',
	    data: "board_id=" + board_id + "&seller_id=" + seller_id + 
	          "&qna_num=" + qna_num + "&recommend=" + recommend.value,
	    cache: false,
	    beforeSend : function(xhr) {
	    	 xhr.setRequestHeader('X-CSRF-Token', csrfToken);
	    },
	    success: function(data){
	    	
	    	var cell1 = document.getElementsByClassName("customer-qna__table--content-Q")[Number(i)];
	    	var cell2 = document.getElementsByClassName("customer-qna__table--td-answer")[Number(i)];
	    	var recommendInputBox = document.getElementsByClassName("recommend-submit-box")[Number(i)];
	    	
            var recommendBox = document.getElementById("customer-qna__table--recommend-" + i);
	    	
	    	if(document.getElementById("customer-qna__table--recommend-" + i)){
	    		var recommendText = recommendBox.getElementsByClassName("qna__content--recommend")[0];
	    		recommendText.textContent = recommend.value;
	    		var dateText = recommendBox.parentNode.getElementsByClassName("qna__recommend-date--format")[0];
	    		dateText.textContent = data;
	    	}else{
	    		cell1.parentNode.insertAdjacentHTML("afterend", 
		    			"<div id='customer-qna__table--recommend-" + i + "'>" + 
	                    "    <span class='customer-qna__table--content-A'>A</span>" +
	                    "    <span class='qna__content--recommend'>" + recommend.value + "</span>" +
	                    "</div>" + 
	                    "<div>" + 
	    	            "    <span>답변 등록일: &nbsp;&nbsp;&nbsp;</span>" + 
	    	            "    <span class='qna__recommend-date--format'>" + data + "</span>" + 
	    	            "    <input type='button' value='수정하기' class='qna__recommend--modify-btn'" + 
	    	            "        onclick=\"recommendModify('" + i +"');\" />" +
	    	            "</div>");
	    	}
	    	
	    	cell2.style.color = "cornflowerblue";
	    	cell2.textContent = "답변완료";
	    	recommend.value = "";
	    	recommendInputBox.style.display = "none";

	    	
	    },
	    error: function(){
	    	
	    }
	});
	
}

function recommendModify(i){
	var recommendBox = document.getElementsByClassName("recommend-submit-box")[Number(i)];
	
	if(recommendBox.style.display == "none"){
		recommendBox.style.display = "block";
	}else{
		recommendBox.style.display = "none";
	}
}

function qnaListPageMove(page_num){
	
    var csrfToken = document.getElementById('csrfFormId');
    var board_id = document.getElementById('board_id').value;
    var user_id = document.getElementById('user_id').value;
    var qna_status = document.getElementById("qna__drop-box--qna").value;
    var answer_status = document.getElementById("qna__drop-box--answer").value;
    var page_amount = 10;  // 10으로 고정
	var keyword = document.getElementById("customer-qna__search--text-save").value;
	
    if(keyword == undefined){
    	keyword = "";
    }
    
	$.ajax({
	    type: 'GET',
	    url: "QnaSelectPage.bo",
	    contentType: 'application/json; charset=UTF-8',
	    data: "board_id=" + board_id + "&qna_status=" + qna_status + 
	        "&answer_status=" + answer_status + "&page_num=" + page_num + 
	        "&page_amount=" + page_amount + "&keyword=" + keyword,
	    cache: false,
	    success: function(data){

	    	var pageText = document.querySelector("#qna__page--set > input[type='text']");
	    	pageText.value = page_num;
	    	
	    	var tbody = document.querySelector('.customer-qna__table > table > tbody');
	    	var len = tbody.rows.length;
	    	
	    	
	    	for(var i = 0; i < len; i++){
	    		tbody.deleteRow(0);
	    	}
	    	
	    	var reviewObj;
	    	
	    	if(IsJsonString(data) == true){
	    		obj = JSON.parse(data);
	    	}
	    	
	    	
	    	if(obj.length != 0){
	    		
	    		for(var i = 0; i < obj.length; i++){
		    		
		    		var row1 = tbody.insertRow(tbody.rows.length);
		    		
		    		row1.className = "customer-qna__table--tr";
		    		$(row1).attr(
		    				"onclick", "qnaDisplayOpen(this, '" + i + "');");
		    		
		    		var cell1 = row1.insertCell(0);
		    		
		    		cell1.insertAdjacentHTML("beforeend", 
		    				obj[i].qna_num);
		    		
		    		var cell2 = row1.insertCell(1);
		    		
		    		cell2.insertAdjacentHTML("beforeend", 
		    				obj[i].qna_status);
		    		
		    		var cell3 = row1.insertCell(2);
		    		
		    		cell3.className = "customer-qna__table--td-answer";
		    		
		    		if(obj[i].answer_status == 1){
		    			cell3.style.color = "cornflowerblue";
		    			
		    			cell3.insertAdjacentHTML("beforeend", 
				                "답변완료");
		    			
		    		}else{
		    			cell3.style.color = "cadetblue";
		    			
		    			cell3.insertAdjacentHTML("beforeend", 
		    					"답변대기중");
		    		}
		            
		            var cell4 = row1.insertCell(3);
		    		
		    		cell4.className = "customer-qna__table--title-td";
		    		
		    		if(user_id == obj[i].seller_id || 
		    				user_id == obj[i].buyer_id ||
		    				obj[i].secret_flag != 1){
		    			
		    			cell4.insertAdjacentHTML("beforeend", 
					        obj[i].title);
		    			
		    		}else{
		    			cell4.insertAdjacentHTML("beforeend", 
					        "비밀글입니다.");
	    		    }
		    		
                    var cell5 = row1.insertCell(4);
		    		
		    		cell5.className = "customer-qna__table--user-td";
		    		
		    		var getQnaId = obj[i].buyer_id.substring(0,3);
		    		
		            for(var j = 0; j < obj[i].buyer_id.length - 3; j++){
		            	getQnaId += "*";
		            }
		    		
		            cell5.insertAdjacentHTML("beforeend", 
		            		getQnaId);
		            
		            
		            var cell6 = row1.insertCell(5);
		            
		            cell6.insertAdjacentHTML("beforeend", 
		            		obj[i].register_date);
		            
		            
		            var row2 = tbody.insertRow(tbody.rows.length);
		    		
		    		row2.className = "customer-qna__table--content-answer";
		    		
		    		var cell7 = row2.insertCell(0);
		    		
		    		cell7.colSpan = "6";
		    		
		    		if(user_id == obj[i].seller_id || 
		    				user_id == obj[i].buyer_id ||
		    				obj[i].secret_flag != 1){
		    			
		    			cell7.insertAdjacentHTML("beforeend", 
		    					"<div>" + 
		    					"    <span class='customer-qna__table--content-Q'>Q</span>" + 
		    					obj[i].content + 
		    					"</div>");
		    			
		    			if(obj[i].answer_status == 1){
		    				
		    				
		    				if(user_id == obj[i].seller_id){
		    					
		    					cell7.insertAdjacentHTML("beforeend", 
		    							"<div id='customer-qna__table--recommend-" + i + "'>" + 
			    						"    <span class='customer-qna__table--content-A'>A</span>" + 
			    						"    <span class='qna__content--recommend'>" + obj[i].recommend + "</span>" + 
			    						"</div>" + 
			    						"<div>" + 
			    						"    <span>답변 등록일: &nbsp;&nbsp;&nbsp;</span>" + 
			    						"    <span class='qna__recommend-date--format'>" + 
			    						obj[i].recommend_date + "</span>" + 
		    							"<input type='button' value='수정하기' class='qna__recommend--modify-btn'" + 
		    							"    onclick=\"recommendModify('" + i + "');\" />" +
		    							"</div>");
		    					
		    				}else{
		    					
		    					cell7.insertAdjacentHTML("beforeend", 
			    						"<div id='customer-qna__table--recommend-" + i + "'>" + 
			    						"    <span class='customer-qna__table--content-A'>A</span>" + 
			    						"    <span class='qna__content--recommend'>" + obj[i].recommend + "</span>" + 
			    						"</div>" + 
			    						"<div>" + 
			    						"    <span>답변 등록일: &nbsp;&nbsp;&nbsp;</span>" + 
			    						"    <span class='qna__recommend-date--format'>" + 
			    						obj[i].recommend_date + "</span>" + 
			    						"</div>");
		    				}
		    				
		    				
		    			}
		    			
		    			if(user_id == obj[i].seller_id && obj[i].answer_status != 1){
		    				cell7.insertAdjacentHTML("beforeend", 
		    						"<div class='recommend-submit-box' style='display: block;'>" + 
			    					"<textarea maxlength='500' class='qna__recommend--content'></textarea>" + 
			    					"    <input type='button' value='답변등록' class='qna__recommend--btn'" + 
			    					"        onclick=\"qnaRecommendSubmit('" + i + "', '" + obj[i].qna_num + "');\" />" + 
			    			        "</div>");
		    			}else{
		    				cell7.insertAdjacentHTML("beforeend", 
    						    "<div class='recommend-submit-box' style='display: none;'>" + 
			    					"<textarea maxlength='500' class='qna__recommend--content'></textarea>" + 
			    					"    <input type='button' value='답변등록' class='qna__recommend--btn'" + 
			    					"        onclick=\"qnaRecommendSubmit('" + i + "', '" + obj[i].qna_num + "');\" />" + 
			    			        "</div>");
		    			}
		    			
		    		}else{
		    			
		    			cell7.insertAdjacentHTML("beforeend", 
		    					"<div>비밀글입니다.</div>");
		    			
		    		}
		            
		            
		    	}
	    			
	    		
	    	}else{
	    		
	    	    var row = tbody.insertRow(tbody.rows.length);
		    		
		        row.className = "customer-qna__table--content-answer";
		    		
		    	var cell = row.insertCell(0);
		    		
		    	cell.colSpan = "6";
		    	cell.className = "customer-qna__table--none-content";
		    	
		    	cell.insertAdjacentHTML("beforeend", 
		    	    "등록된 문의글이 없습니다.");
	    		
	    	}
	    	

	    },
	    error: function(){
	    	
	    }
	});
	
}

function searchCount(board_id, qna_status, answer_status, keyword){
	
	
	$.ajax({
	    type: 'GET',
	    url: "QnaSelectCount.bo",
	    contentType: 'application/html; charset=UTF-8',
	    data: "board_id=" + board_id + "&qna_status=" + qna_status + 
	        "&answer_status=" + answer_status + "&keyword=" + keyword,
	    cache: false,
	    success: function(data){

	    	var searchResultCount = document.querySelector("#qna__search--result > strong");
	    	var pageSet = document.querySelector("#qna__page--set > span");
	    	var pageText = document.querySelector("#qna__page--set > input[type='text']");
	    	
	    	searchResultCount.textContent = data;
	    	pageSet.textContent 
	    	    = " / " + String(parseInt(Math.ceil(parseFloat(data) / 10.0))) + " Page";
	    	pageText.value = 1;
	    	qnaRePaging(1);
	    },
	    error: function(){
	    	
	    }
	});
}

function pageBtnMove(thisBtn){
	
	$('#qna__table--now-page').removeAttr("disabled");
	$('#qna__table--now-page').attr(
			"onClick", "pageBtnMove(this)");
	$('#qna__table--now-page').attr("class", "review__table--page-move");
	$('#qna__table--now-page').removeAttr("id");
	
	thisBtn.classList.remove('qna__table--page-move');
	thisBtn.id = "qna__table--now-page";
	thisBtn.setAttribute("disabled", "disabled");
	$("#qna__table--now-page").attr('onclick', '').unbind('click');
	
	qnaListPageMove(thisBtn.value);
}

function qnaRePaging(pageNum){
	
	// 페이지 메이킹
	var page_num = pageNum;
	var page_amount = 10;  // 보여줄 리스트 갯수 10 고정
	var total = Number(document.querySelector("#qna__search--result > strong").textContent);
	// 이미 계산되어 적용된 내용
	var endPage = parseInt(Math.ceil(page_num / 10.0)) * 10;
	var startPage = endPage - 9;
	
	var calcEnd = parseInt(Math.ceil((total * 1.0) / page_amount));
	
	if(endPage > calcEnd) {
		endPage = calcEnd;
	}
	
	var prev = startPage > 1;
	var next = endPage < calcEnd;
	// ==================================================================================
	
	var pageBtnNode = document.getElementById("qna__page--btn");
	

	
	while (pageBtnNode.hasChildNodes()) { 
		pageBtnNode.removeChild(pageBtnNode.firstChild); 
	}
	
	
	if(prev == true){
		pageBtnNode.insertAdjacentHTML("beforeend", 
		    "<input type='button' value='이전' class='page__abled--prev-btn'" +
		    "    onclick='qnaRePaging(" + (Number(page_num) - 10) + ");' />");
	}else{
		pageBtnNode.insertAdjacentHTML("beforeend", 
			"<input type='button' value='이전' disabled class='page__disabled--prev-btn'/>");
	}
	
	for(var i = startPage; i < endPage+1; i++){
		
		if(i == page_num){
			pageBtnNode.insertAdjacentHTML("beforeend", 
		        "<input type='button' value='" + i +"' disabled id='qna__table--now-page' />");
		}else{
			pageBtnNode.insertAdjacentHTML("beforeend", 
			    "<input type='button' value='"+ i + "' class='qna__table--page-move' " +
			    "    onclick='pageBtnMove(this)' />");
		}
		
	}
	
	if(next == true){
		pageBtnNode.insertAdjacentHTML("beforeend", 
				"<input type='button' value='다음' disabled class='page__abled--prev-btn' " + 
				"    onclick='qnaRePaging(" + (Number(page_num) + 10) + ");' />");
	}else{
		pageBtnNode.insertAdjacentHTML("beforeend", 
				"<input type='button' value='다음' disabled class='page__disabled--prev-btn'/>");
	}
	
	
}

var saveQnaVal = 1;

function qnaTextPage(thisText, max){
	
	if(thisText.value != ""){
		if (!(new RegExp(/^[0-9]+$/)).test(thisText.value)) {
			thisText.value = saveQnaVal;
		}
		
		if(thisText.value > Number(max)){
			thisText.value = Number(max);
		}else if(thisText.value < Number(1)){
			thisText.value = 1;
		}
		
		saveQnaVal = thisText.value;
    }
}

function qnaTextPageMove(thisPage){
	
	if(thisPage.value == "" || Number(thisPage.value) < Number(1)){
		thisPage.value = 1;
	}else{
		qnaListPageMove(thisPage.value);
		qnaRePaging(thisPage.value);
	}
	
}

function searchQnaList(page_num){
	var keyword = document.getElementById("customer-qna__search--text").value;
	var saveText = document.getElementById("customer-qna__search--text-save");
	
	saveText.value = keyword;
	
	
	qnaListPageMove(page_num);
}

function qnaDropBox(thisBtn){
	
	var dropbox = thisBtn.parentNode.getElementsByTagName("ul")[0];
	
	
	if(dropbox.style.display == "none"){
		dropbox.style.display = "block";
		thisBtn.style.color = "dodgerblue";
	}else{
		dropbox.style.display = "none";
		thisBtn.style.color = "#000";
	}
}

$(document).mouseup(function(e){
	if(!$(".customer-qna__table--drop-box").is(e.target) && 
			$('.customer-qna__table--drop-box').has(e.target).length ===0){
		$(".customer-qna__table--drop-box").hide();
		$(".customer-qna__table--search").css("color", "#000");
	}
});

function qnaDropBoxSearch(thisBtn, val){
	
	var liTag = thisBtn.parentNode.getElementsByTagName("li");
	
	for(var i = 0; i < liTag.length; i++){
		if(liTag[i].style.color == "dodgerblue"){
			liTag[i].style.color = "#000";
			break;
		}
	}
	
	thisBtn.style.color = "dodgerblue";
	
	var inputTag = thisBtn.parentNode.parentNode.getElementsByTagName("input")[0];

	inputTag.value = val;
	
    var board_id = document.getElementById('board_id').value;
    var qna_status = document.getElementById("qna__drop-box--qna").value;
    var answer_status = document.getElementById("qna__drop-box--answer").value;
	var keyword = document.getElementById("customer-qna__search--text-save").value;
	
	qnaListPageMove(1);
	searchCount(board_id, qna_status, answer_status, keyword);
}