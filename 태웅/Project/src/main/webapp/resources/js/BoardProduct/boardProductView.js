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

var star = $('.star').click(function(){
	
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    starOnChildEQ = $('.star.on').length;
    
    return false;
});

var starHover = $('.star').hover(function(){
	
	starOnChildEQ = $('.star.on').length;
	
	if(starOnChildEQ != 0){
		$(this).parent().children('span').removeClass('on');
	}
	
	$(this).parent().children('span').removeClass('hover');
    $(this).addClass('hover').prevAll('span').addClass('hover');
    
}, function(){
	$(this).parent().children('span').removeClass('hover');
	
	for(var i = 0; i < starOnChildEQ; i++){
		$('.star:nth-child(' + (i+1) + ')').addClass('on');
	}
});


function review_regist(){
	
	var starCount = parseFloat($('#star-satisfaction').children('span.star.on').length * 0.5);
	var reviewContent = document.getElementById("review-content--text").value;
	
	if(starCount == 0){
		modal_warning("평점을 선택해주세요.");
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