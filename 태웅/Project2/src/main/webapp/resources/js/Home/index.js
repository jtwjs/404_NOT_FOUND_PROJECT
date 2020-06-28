
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
