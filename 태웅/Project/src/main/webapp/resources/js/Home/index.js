
$(document).ready(function(){
	$('#main__visual1').addClass('on');
});

var item1 = document.getElementById('control_item-1');
var item2 = document.getElementById('control_item-2');
var item3 = document.getElementById('control_item-3');
$(item1).click(function(){
	$(item1).addClass('on');
	$(item2).removeClass('on');
	$(item3).removeClass('on');
	$('#list-item1').addClass('on');
	$('#list-item2').removeClass('on');
	$('#list-item3').removeClass('on');
	
});

 $(item2).click(function(){
	$(item2).addClass('on');
	$(item1).removeClass('on');
	$(item3).removeClass('on');
	$('#list-item2').addClass('on');
	$('#list-item1').removeClass('on');
	$('#list-item3').removeClass('on');
});

$(item3).click(function(){
	$(item3).addClass('on');
	$(item1).removeClass('on');
	$(item2).removeClass('on');
	$('#list-item3').addClass('on');
	$('#list-item1').removeClass('on');
	$('#list-item2').removeClass('on');
});

var page1 = function(){
	$(item1).addClass('on');
	$(item2).removeClass('on');
	$(item3).removeClass('on');
	$('#list-item1').addClass('on');
	$('#list-item2').removeClass('on');
	$('#list-item3').removeClass('on');
	
}

var page2 = function() {
	$(item2).addClass('on');
	$(item1).removeClass('on');
	$(item3).removeClass('on');
	$('#list-item2').addClass('on');
	$('#list-item1').removeClass('on');
	$('#list-item3').removeClass('on');
}

var page3 = function() {
	$(item3).addClass('on');
	$(item1).removeClass('on');
	$(item2).removeClass('on');
	$('#list-item3').addClass('on');
	$('#list-item1').removeClass('on');
	$('#list-item2').removeClass('on');
}

$(document).ready(function(){
	setInterval(function(){
		if($(item1).hasClass('on')===true){
			page2();
		}
		else if($(item2).hasClass('on')===true)
			{
			page3();
			}
		else {
			page1();
		}
		
	},4000);
});


/*section2*/

document.addEventListener('DOMContentLoaded', function() {
var $slideWrap = document.querySelector('.best-product--content'),
	$slideContainer = document.querySelector('#best-product--list'),
	$slide = document.querySelectorAll('.product--list-item'),
	$slideHeight = 0,
	$slideCount = $slide.length,
	$currentIndex = 0,
	$autoTimer = undefined,
	$navPrev = document.getElementById('controller-left'),
	$navNext = document.getElementById('controller-right');
   
	console.log($slideHeight);
	
	//슬라이더 wrap 높이 지정
	$slideHeight = $slide[0].offsetHeight;
	console.log($slideHeight);
	$slideWrap.style.height = $slideHeight +'px';
	$slideContainer.style.height = $slideHeight +'px';
	
	//슬라이드 위치 지정
	$slideContainer.style.left = 0 + '%';
	
	for(var i = 0; i < $slideCount; i++ ) {
		$slide[i].style.left = i * 33.5 + '%';
	}
	
	//슬라이드 이동 함수
	function goToSlide(idx) {
		$slideContainer.style.left = -33.5 * idx + '%';
		$currentIndex = idx;
	}
	$slideContainer.classList.add('move');
	
	
	// 버튼기능
	
	$navPrev.addEventListener('click',function(){
		
		if($navPrev.classList.contains('disable')){
			goToSlide($currentIndex);
		}else {
			goToSlide($currentIndex - 1);
		}
		
		if( $currentIndex == 0 ) {
			$navPrev.classList.add('disable');
		}else{
			$navPrev.classList.remove('disable');
		}
		if( $currentIndex == $slideCount - 3) {
			$navNext.classList.add('disable');
		}else{
			$navNext.classList.remove('disable');
		}	
		console.log("현재페이지:"+$currentIndex);
	});
	
	
	
	$navNext.addEventListener('click',function(){	
		if($navNext.classList.contains('disable')){
			goToSlide($currentIndex);
		}else {
			goToSlide($currentIndex + 1);
		}
		
		if( $currentIndex == 0 ) {
			$navPrev.classList.add('disable');
		}else{
			$navPrev.classList.remove('disable');
		}
		if( $currentIndex == $slideCount - 3) {
			$navNext.classList.add('disable');
		}else{
			$navNext.classList.remove('disable');
			
		}	
		console.log("현재페이지:"+$currentIndex);
	});
	
	//autoSlide
	function startAutoSlide() {
		$autoTimer = setInterval(function() {
			var nextIdx = ($currentIndex + 1) %($slideCount-3);
			
			goToSlide(nextIdx);
		}, 4000);

	}
	
	function stopAutoSlide() {
		clearInterval($autoTimer);

	}
	
	 startAutoSlide();
	
	//clearInterval(대상)
	
	$slideWrap.addEventListener('mouseenter',function(){
		stopAutoSlide();
	});
	
	$navPrev.addEventListener('mouseenter',function(){
		stopAutoSlide();
	});
	
	$navNext.addEventListener('mouseenter',function(){
		stopAutoSlide();
	});
	
	
	$slideWrap.addEventListener('mouseleave',function(){
		startAutoSlide();
	});

	$navPrev.addEventListener('mouseleave',function(){
		startAutoSlide();
	});
	
	$navNext.addEventListener('mouseleave',function(){
		startAutoSlide();
	});
	
});//DOMcontentloaded
