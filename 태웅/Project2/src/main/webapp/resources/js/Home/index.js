
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

var leftBtn = document.getElementById('controller-left');
var rightBtn = document.getElementById('controller-right');
var rank1 = document.getElementById('rank1');
var rank2 = document.getElementById('rank2');
var rank3 = document.getElementById('rank3');
var rank4 = document.getElementById('rank4');
var rank5 = document.getElementById('rank5');
var rank6 = document.getElementById('rank6');
var rank7 = document.getElementById('rank7');
var rank8 = document.getElementById('rank8');
var rank9 = document.getElementById('rank9');
var rank10 = document.getElementById('rank10');

rightBtn.addEventListener('click',function(){
	rank1.style.transform = "translateX(408px)";
	rank2.style.transform = "translateX(408px)";
	rank3.style.transform = "translateX(408px)";
	rank4.style.transform = "translateX(408px)";
	rank5.style.transform = "translateX(408px)";
	rank6.style.transform = "translateX(408px)";
	rank7.style.transform = "translateX(408px)";
	rank8.style.transform = "translateX(408px)";
	rank9.style.transform = "translateX(408px)";
	rank10.style.transform = "translateX(408px)";
});

leftBtn.addEventListener('click',function(){
	rank1.style.transform = "translateX(-408px)";
	rank2.style.transform = "translateX(-408px)";
	rank3.style.transform = "translateX(-408px)";
	rank4.style.transform = "translateX(-408px)";
	rank5.style.transform = "translateX(-408px)";
	rank6.style.transform = "translateX(-408px)";
	rank7.style.transform = "translateX(-408px)";
	rank8.style.transform = "translateX(-408px)";
	rank9.style.transform = "translateX(-408px)";
	rank10.style.transform = "translateX(-408px)";
});
