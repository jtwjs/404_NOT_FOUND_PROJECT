var didScroll;
var lastScrollTop = 0;
var delta = 5; //동작의 구현이 시작되는 위치
var submainHeight = $("#sub-main").outerHeight();

$(window).scroll(function (event) {
	  didScroll = true;
	});

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

  if (st < submainHeight) {
    //scroll Down
    $('#recent-product').addClass("absolute");
  } else {
    //scroll Up
    if (st < submainHeight) {
      $('#recent-product').removeClass("absolute")
    }
  }

  lastScrollTop = st;
  console.log("d왜안도: " + lastScrollTop);
}


document.addEventListener('DOMContentLoaded', function() {
var $slideWrap = document.querySelector('.content-body'),
	$slideContainer = document.querySelector('#product-list'),
	$slide = document.querySelectorAll('.product-list_item'),
	$slideHeight = 0,
	$slideCount = $slide.length,
	$currentIndex = 0,
	$navUp = document.getElementById('up-btn'),
	$navDown = document.getElementById('down-btn');
   
	console.log($slideCount);


	
	//슬라이드 위치 지정
	$slideContainer.style.top = 0 + '%';
	
	for(var i = 0; i < $slideCount; i++ ) {
		$slide[i].style.top = i * 85 + 'px';
	}
	
	//슬라이드 이동 함수
	function goToSlide(idx) {
		$slideContainer.style.top = 85 * idx + 'px';
		$currentIndex = idx;
		console.log(idx);
	}
	$slideContainer.classList.add('move');
	
	
	// 버튼기능
	
	$navDown.addEventListener('click',function(){
		
		if($slideCount <4) {
			$navDown.classList.add('disable');
		}
		if($navDown.classList.contains('disable')){
			goToSlide($currentIndex);
		}else {
			goToSlide($currentIndex - 1);
		}
		
		if( $currentIndex == 0 ) {
			$navUp.classList.add('disable');
		}else{
			$navUp.classList.remove('disable');
		}
		 if ( -1*$currentIndex == $slideCount -3) {
			$navDown.classList.add('disable');
		}else{
			$navDown.classList.remove('disable');
		}	
		console.log("현재페이지:"+$currentIndex);
	});
	
	
	
	$navUp.addEventListener('click',function(){
		if($slideCount <4) {
			$navDown.classList.add('disable');
		}
		
		if($navUp.classList.contains('disable')){
			goToSlide($currentIndex);
		}else {
			goToSlide($currentIndex + 1);
		}
		
		if( $currentIndex == 0 ) {
			$navUp.classList.add('disable');
		}else{
			$navUp.classList.remove('disable');
		}
		 if ( -1*$currentIndex == $slideCount -3) {
			$navDown.classList.add('disable');
		}else{
			$navDown.classList.remove('disable');
			
		}	
		console.log("현재페이지:"+$currentIndex);
	});
	

});