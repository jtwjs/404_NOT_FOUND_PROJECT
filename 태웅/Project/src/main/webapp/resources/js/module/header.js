var dropBtn = document.getElementById("header__nav--category");
dropBtn.addEventListener("mouseover", function () {
  document.getElementById("category_menu").style.height = "365px";
  document.getElementById("category_menu").style.borderBottom ="3px solid #509b59";
  document.getElementById("category_btn").classList.add("selected");
});

dropBtn.addEventListener("mouseout", function () {
  document.getElementById("category_menu").style.height = "0";
  document.getElementById("category_menu").style.borderBottom = null;
  document.getElementById("category_btn").classList.remove("selected");
});

document
  .getElementById("category_btn")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--first").classList.remove("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document.getElementById("main_category--first").classList.add("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

var totalCategory = document
  .getElementById("category_menu")
  .getElementsByTagName("a");
var mainCategory = document
  .getElementById("main_category--list")
  .getElementsByTagName("a");
for (var i = 0; i < totalCategory.length; i++) {
  totalCategory[i].addEventListener("mouseover", function () {
    this.classList.add("title-on");
  });
}

var subCategory = document
  .querySelector(".sub_category")
  .getElementsByTagName("a");
for (var i = 0; i < subCategory.length; i++) {
  subCategory[i].addEventListener("mouseout", function () {
    this.classList.remove("title-on");
  });
}

document
  .getElementById("main_category--first")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--first").classList.remove("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--second")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--second").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--third")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--third").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--fourth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--fourth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--fifth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--fifth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--sixth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--sixth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--seventh")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--seventh").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--eighth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--eighth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--ninth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--ninth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--tenth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--tenth")
      .classList.remove("title-on");
  });

document
  .getElementById("main_category--tenth")
  .addEventListener("mouseover", function () {
    document.getElementById("sub_category--tenth").classList.remove("hide");
    document.getElementById("sub_category--first").classList.add("hide");
    document.getElementById("sub_category--second").classList.add("hide");
    document.getElementById("sub_category--third").classList.add("hide");
    document.getElementById("sub_category--fourth").classList.add("hide");
    document.getElementById("sub_category--fifth").classList.add("hide");
    document.getElementById("sub_category--sixth").classList.add("hide");
    document.getElementById("sub_category--seventh").classList.add("hide");
    document.getElementById("sub_category--eighth").classList.add("hide");
    document.getElementById("sub_category--ninth").classList.add("hide");

    document
      .getElementById("main_category--first")
      .classList.remove("title-on");
    document
      .getElementById("main_category--second")
      .classList.remove("title-on");
    document
      .getElementById("main_category--third")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fourth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--fifth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--sixth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--seventh")
      .classList.remove("title-on");
    document
      .getElementById("main_category--eighth")
      .classList.remove("title-on");
    document
      .getElementById("main_category--ninth")
      .classList.remove("title-on");
  });

/*헤더 스크롤*/

var didScroll;
var lastScrollTop = 0;
var delta = 5; //동작의 구현이 시작되는 위치
var navbarHeight = $(".header__top").outerHeight();

//스크롤시에 사용자가 스크롤했다는 것을 알림
$(window).scroll(function (event) {
  didScroll = true;
});

// hasScrolled()를 실행하고 didScroll 상태를 재설정
var headerTimer1 = setInterval(function () {
  if (didScroll) {
    hasScrolled();
    didScroll = false;
  }
}, 250);

function hasScrolled() {
  var st = $(this).scrollTop(); //현재 스크롤의 위치 저장
 
  //설정한 delta 값보다 더 스크롤되었는지 확인
  if (Math.abs(lastScrollTop - st) <= delta) {
    return;
  }

  if (st > navbarHeight) {
    //scroll Down
    $("#header__nav").addClass("fixed");
  } else {
    //scroll Up
    if (st < navbarHeight) {
      $("#header__nav").removeClass("fixed")
    }
  }

  lastScrollTop = st;
}


/*주문배송 모달창*/

var ord_deliveryBtn = document.getElementById('order_delivery');
var deliveryModal = document.querySelector('.delivery-modal-bg');
var closeBtn = document.querySelector('.close-btn');

if(ord_deliveryBtn != null){
ord_deliveryBtn.addEventListener('click',deliveryCheck);


closeBtn.addEventListener('click', function(){
	deliveryModal.classList.add('hide');
});

function deliveryCheck() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url: '/project/orderBeingDelivered.or',
		type: 'POST',
		beforeSend: function(xhr){
			xhr.setRequestHeader(header,token);
		},
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			if(data.result == "empty"){
				deliveryModal.classList.remove('hide');
			}else {
				location.href='OrderResearch.or?order_id='+data.result;
			}
			
		},
		error:function(xhr,status,error) {
				console.log('error:'+error);
		}
	});

}


// redirect
function checkRedirect(indexCheck){
	if(indexCheck != 1){
		location.replace("Index.in");
	}
}

// 상품 검색

function boardProductSearch(){
	var searchText = document.getElementById("search-input");
	
	if(searchText.value != ""){
	    location.href= "BoardProductSearch.bo?keyword=" + searchText.value;
	}
}

}