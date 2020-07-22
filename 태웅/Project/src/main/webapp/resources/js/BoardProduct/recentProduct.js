var recentView = document.getElementById('recent-product');
var didScroll1;
var lastScrollTop1 = 0;
var delta1 = 5; //동작의 구현이 시작되는 위치
var submainHeight = document.getElementById('sub-main').offsetHeight;
var footerHeight = 250;
var recentViewHeight = document.getElementById('recent-product').offsetHeight;
var screenHeight = screen.height;
var documentHeight = $(document).height();
var windowHeight = $(window).height();


//스크롤시에 사용자가 스크롤했다는 것을 알림
$(window).scroll(function (event) {
  didScroll1 = true;
});

// hasScrolled1()를 실행하고 didScroll1 상태를 재설정
var headerTimer1 = setInterval(function () {
  if (didScroll1) {
    hasScrolled1();
    didScroll1 = false;

  }
}, 5);

function hasScrolled1() {
  var st1 = $(this).scrollTop(); //현재 스크롤의 위치 저장
  var ScrollValue = st1;
  
  console.log("st1값: " + st1);
  //설정한 delta1 값보다 더 스크롤되었는지 확인
  if (Math.abs(lastScrollTop1 - st1) <= delta1) {
    return;
  }

  if (st1 > 200 && st1 < documentHeight-windowHeight) {
	  var scrollValue = st1;
	
    //scroll Down
	  $('#recent-product').addClass('fixOn');
	  $('#recent-product').removeClass('bottom');
	  $('.fixOn').css("top", String(Number(ScrollValue)+(screenHeight/2)-Number(200))+"px");
	
  } else {
    //scroll Up
    if (st1 < 200) {
    	$('#recent-product').removeClass('fixOn');
    	$('#recent-product').css("top",Number(550)+"px");
    }  
    if (st1 > documentHeight-windowHeight) {
    		  $('#recent-product').removeClass('fixOn');
    		  $('#recent-product').addClass('bottom');
    		  $('.bottom').css("top",documentHeight-470+"px");
    	  
    }
  }

  lastScrollTop1 = st1;
  console.log("lastScrollTop1: " + lastScrollTop1);
}




document.addEventListener('DOMContentLoaded', function() {
var $slideWrap = document.querySelector('.content-body'),
	$slideContainer = document.querySelector('#product-list'),
	$slide = document.querySelectorAll('.product-list_item'),
	$slideHeight = 0,
	$slideCount = $slide.length,
	$currentIndex = 0,
	$navUp = document.getElementById('up-btn'),
	$navDown = document.getElementById('down-btn'),
	$countValue = document.getElementById('count'),
	$maxCount = document.getElementById('list_length').value
	$count = 3;
var abc = $count;
   
	if($maxCount <= 3){
		$countValue.innerText = $maxCount
	}else{
		$countValue.innerText = abc;
	}
	//슬라이드 위치 지정
	$slideContainer.style.top = 0 + 'px';
	
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
			if($count != $maxCount)
			abc += 1;
			$countValue.innerText = abc;
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
			if(abc != 3)
				abc -= 1;
			$countValue.innerText = abc;
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