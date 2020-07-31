var score0_5 = document.querySelector('.item-satisfaction .score-0_5'),
	 score1 = document.querySelector('.item-satisfaction .score-1'),
	 score1_5 = document.querySelector('.item-satisfaction .score-1_5'),
	 score2 = document.querySelector('.item-satisfaction .score-2'),
	 score2_5 = document.querySelector('.item-satisfaction .score-2_5'),
	 score3 = document.querySelector('.item-satisfaction .score-3'),
	 score3_5 = document.querySelector('.item-satisfaction .score-3_5'),
	 score4 = document.querySelector('.item-satisfaction .score-4'),
	 score4_5 = document.querySelector('.item-satisfaction .score-4_5'),
	 score5 = document.querySelector('.item-satisfaction .score-5');
	 

jQuery('.item-satisfaction .score-0_5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
		
});

jQuery('.item-satisfaction .score-0_5').mouseout(function(e) {
	score0_5.classList.remove('over');
});

jQuery('.item-satisfaction .score-0_5').click(function (e) {
	e.preventDefault();
	zeroToFive();
	
});

jQuery('.item-satisfaction .score-1').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	
});

jQuery('.item-satisfaction .score-1').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-1').click(function (e) {
	e.preventDefault();
	oneToZero();
	
});

jQuery('.item-satisfaction .score-1_5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	
});

jQuery('.item-satisfaction .score-1_5').mouseout(function(e) {
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-1_5').click(function (e) {
	e.preventDefault();
	oneToFive();
	
});
jQuery('.item-satisfaction .score-2').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	
});

jQuery('.item-satisfaction .score-2').mouseout(function(e) {
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-2').click(function (e) {
	e.preventDefault();
	twoToZero();
	
});
jQuery('.item-satisfaction .score-2_5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	
	
});

jQuery('.item-satisfaction .score-2_5').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-2_5').click(function (e) {
	e.preventDefault();
	twoToFive();
	
});
jQuery('.item-satisfaction .score-3').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	score3.classList.add('over');

	
});

jQuery('.item-satisfaction .score-3').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	score3.classList.remove('over');
	
	
});

jQuery('.item-satisfaction .score-3').click(function (e) {
	e.preventDefault();
	threeToZero();
	
});
jQuery('.item-satisfaction .score-3_5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	score3.classList.add('over');
	score3_5.classList.add('over');

	
});

jQuery('.item-satisfaction .score-3_5').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	score3.classList.remove('over');
	score3_5.classList.remove('over');
});

jQuery('.item-satisfaction .score-3_5').click(function (e) {
	e.preventDefault();
	threeToFive();
	
});
jQuery('.item-satisfaction .score-4').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	score3.classList.add('over');
	score3_5.classList.add('over');
	score4.classList.add('over');

	
});

jQuery('.item-satisfaction .score-4').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	score3.classList.remove('over');
	score3_5.classList.remove('over');
	score4.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-4').click(function (e) {
	e.preventDefault();
	fourToZero();
	
});
jQuery('.item-satisfaction .score-4_5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	score3.classList.add('over');
	score3_5.classList.add('over');
	score4.classList.add('over');
	score4_5.classList.add('over');

	
});

jQuery('.item-satisfaction .score-4_5').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	score3.classList.remove('over');
	score3_5.classList.remove('over');
	score4.classList.remove('over');
	score4_5.classList.remove('over');
	
});

jQuery('.item-satisfaction .score-4_5').click(function (e) {
	e.preventDefault();
	fourToFive();
	
});
jQuery('.item-satisfaction .score-5').mouseover(function (e) {
	e.preventDefault();
	score0_5.classList.add('over');
	score1.classList.add('over');
	score1_5.classList.add('over');
	score2.classList.add('over');
	score2_5.classList.add('over');
	score3.classList.add('over');
	score3_5.classList.add('over');
	score4.classList.add('over');
	score4_5.classList.add('over');
	score5.classList.add('over');

	
});

jQuery('.item-satisfaction .score-5').mouseout(function(e) {
	e.preventDefault();
	score0_5.classList.remove('over');
	score1.classList.remove('over');
	score1_5.classList.remove('over');
	score2.classList.remove('over');
	score2_5.classList.remove('over');
	score3.classList.remove('over');
	score3_5.classList.remove('over');
	score4.classList.remove('over');
	score4_5.classList.remove('over');
	score5.classList.remove('over');

	
});

jQuery('.item-satisfaction .score-5').click(function (e) {
	e.preventDefault();
	fiveToZero();
});

function zeroToFive(){
	score0_5.classList.add('active');
	score1.classList.remove('active');
	score1_5.classList.remove('active');
	score2.classList.remove('active');
	score2_5.classList.remove('active');
	score3.classList.remove('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}

function oneToZero() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.remove('active');
	score2.classList.remove('active');
	score2_5.classList.remove('active');
	score3.classList.remove('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}

function oneToFive() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.remove('active');
	score2_5.classList.remove('active');
	score3.classList.remove('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}

function twoToZero() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.remove('active');
	score3.classList.remove('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}
function twoToFive() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.remove('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}
function threeToZero() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.add('active');
	score3_5.classList.remove('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}
function threeToFive() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.add('active');
	score3_5.classList.add('active');
	score4.classList.remove('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}
function fourToZero() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.add('active');
	score3_5.classList.add('active');
	score4.classList.add('active');
	score4_5.classList.remove('active');
	score5.classList.remove('active');
}
function fourToFive() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.add('active');
	score3_5.classList.add('active');
	score4.classList.add('active');
	score4_5.classList.add('active');
	score5.classList.remove('active');
}
function fiveToZero() {
	score0_5.classList.add('active');
	score1.classList.add('active');
	score1_5.classList.add('active');
	score2.classList.add('active');
	score2_5.classList.add('active');
	score3.classList.add('active');
	score3_5.classList.add('active');
	score4.classList.add('active');
	score4_5.classList.add('active');
	score5.classList.add('active');
}

var d_score0_5 = document.querySelector('.delivery-satisfaction .score-0_5'),
d_score1 = document.querySelector('.delivery-satisfaction .score-1'),
d_score1_5 = document.querySelector('.delivery-satisfaction .score-1_5'),
d_score2 = document.querySelector('.delivery-satisfaction .score-2'),
d_score2_5 = document.querySelector('.delivery-satisfaction .score-2_5'),
d_score3 = document.querySelector('.delivery-satisfaction .score-3'),
d_score3_5 = document.querySelector('.delivery-satisfaction .score-3_5'),
d_score4 = document.querySelector('.delivery-satisfaction .score-4'),
d_score4_5 = document.querySelector('.delivery-satisfaction .score-4_5'),
d_score5 = document.querySelector('.delivery-satisfaction .score-5');

jQuery('.delivery-satisfaction .score-0_5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
		
});

jQuery('.delivery-satisfaction .score-0_5').mouseout(function(e) {
	d_score0_5.classList.remove('over');
});

jQuery('.delivery-satisfaction .score-0_5').click(function (e) {
	e.preventDefault();
	d_zeroToFive();
	
});

jQuery('.delivery-satisfaction .score-1').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	
});

jQuery('.delivery-satisfaction .score-1').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-1').click(function (e) {
	e.preventDefault();
	d_oneToZero();
	
});

jQuery('.delivery-satisfaction .score-1_5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	
});

jQuery('.delivery-satisfaction .score-1_5').mouseout(function(e) {
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-1_5').click(function (e) {
	e.preventDefault();
	d_oneToFive();
	
});
jQuery('.delivery-satisfaction .score-2').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	
});

jQuery('.delivery-satisfaction .score-2').mouseout(function(e) {
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-2').click(function (e) {
	e.preventDefault();
	d_twoToZero();
	
});
jQuery('.delivery-satisfaction .score-2_5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	
	
});

jQuery('.delivery-satisfaction .score-2_5').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-2_5').click(function (e) {
	e.preventDefault();
	d_twoToFive();
	
});
jQuery('.delivery-satisfaction .score-3').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	d_score3.classList.add('over');

	
});

jQuery('.delivery-satisfaction .score-3').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	d_score3.classList.remove('over');
	
	
});

jQuery('.delivery-satisfaction .score-3').click(function (e) {
	e.preventDefault();
	d_threeToZero();
	
});
jQuery('.delivery-satisfaction .score-3_5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	d_score3.classList.add('over');
	d_score3_5.classList.add('over');

	
});

jQuery('.delivery-satisfaction .score-3_5').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	d_score3.classList.remove('over');
	d_score3_5.classList.remove('over');
});

jQuery('.delivery-satisfaction .score-3_5').click(function (e) {
	e.preventDefault();
	d_threeToFive();
	
});
jQuery('.delivery-satisfaction .score-4').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	d_score3.classList.add('over');
	d_score3_5.classList.add('over');
	d_score4.classList.add('over');

	
});

jQuery('.delivery-satisfaction .score-4').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	d_score3.classList.remove('over');
	d_score3_5.classList.remove('over');
	d_score4.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-4').click(function (e) {
	e.preventDefault();
	d_fourToZero();
	
});
jQuery('.delivery-satisfaction .score-4_5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	d_score3.classList.add('over');
	d_score3_5.classList.add('over');
	d_score4.classList.add('over');
	d_score4_5.classList.add('over');

	
});

jQuery('.delivery-satisfaction .score-4_5').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	d_score3.classList.remove('over');
	d_score3_5.classList.remove('over');
	d_score4.classList.remove('over');
	d_score4_5.classList.remove('over');
	
});

jQuery('.delivery-satisfaction .score-4_5').click(function (e) {
	e.preventDefault();
	d_fourToFive();
	
});
jQuery('.delivery-satisfaction .score-5').mouseover(function (e) {
	e.preventDefault();
	d_score0_5.classList.add('over');
	d_score1.classList.add('over');
	d_score1_5.classList.add('over');
	d_score2.classList.add('over');
	d_score2_5.classList.add('over');
	d_score3.classList.add('over');
	d_score3_5.classList.add('over');
	d_score4.classList.add('over');
	d_score4_5.classList.add('over');
	d_score5.classList.add('over');

	
});

jQuery('.delivery-satisfaction .score-5').mouseout(function(e) {
	e.preventDefault();
	d_score0_5.classList.remove('over');
	d_score1.classList.remove('over');
	d_score1_5.classList.remove('over');
	d_score2.classList.remove('over');
	d_score2_5.classList.remove('over');
	d_score3.classList.remove('over');
	d_score3_5.classList.remove('over');
	d_score4.classList.remove('over');
	d_score4_5.classList.remove('over');
	d_score5.classList.remove('over');

	
});

jQuery('.delivery-satisfaction .score-5').click(function (e) {
	e.preventDefault();
	d_fiveToZero();
});

function d_zeroToFive(){
	d_score0_5.classList.add('active');
	d_score1.classList.remove('active');
	d_score1_5.classList.remove('active');
	d_score2.classList.remove('active');
	d_score2_5.classList.remove('active');
	d_score3.classList.remove('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}

function d_oneToZero() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.remove('active');
	d_score2.classList.remove('active');
	d_score2_5.classList.remove('active');
	d_score3.classList.remove('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}

function d_oneToFive() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.remove('active');
	d_score2_5.classList.remove('active');
	d_score3.classList.remove('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}

function d_twoToZero() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.remove('active');
	d_score3.classList.remove('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}
function d_twoToFive() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.remove('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}
function d_threeToZero() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.add('active');
	d_score3_5.classList.remove('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}
function d_threeToFive() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.add('active');
	d_score3_5.classList.add('active');
	d_score4.classList.remove('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}
function d_fourToZero() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.add('active');
	d_score3_5.classList.add('active');
	d_score4.classList.add('active');
	d_score4_5.classList.remove('active');
	d_score5.classList.remove('active');
}
function d_fourToFive() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.add('active');
	d_score3_5.classList.add('active');
	d_score4.classList.add('active');
	d_score4_5.classList.add('active');
	d_score5.classList.remove('active');
}
function d_fiveToZero() {
	d_score0_5.classList.add('active');
	d_score1.classList.add('active');
	d_score1_5.classList.add('active');
	d_score2.classList.add('active');
	d_score2_5.classList.add('active');
	d_score3.classList.add('active');
	d_score3_5.classList.add('active');
	d_score4.classList.add('active');
	d_score4_5.classList.add('active');
	d_score5.classList.add('active');
}



/*submit*/

var form = document.getElementById('review_form'),
	submitBtn = document.getElementById('submitBtn'),
	item_satis = document.getElementById('satisfaction'),
	delivery_satis = document.getElementById('delivery_satisfaction'),
	goods_text = document.getElementById('goods_text').value,
	regExp = /[\{\}\[\]\/?.,;:|\)(\s*)*~'!^\-+<>@\#$%&\\\=\(\"\"]/gi;

	

	submitBtn.addEventListener('click',function() {
		var a = $("#goods_text").val()
		var change_goods_text = a.replace(regExp,"");
		if(score5.classList.contains('active')){
			item_satis.value = 5.0;
		} else if(score4_5.classList.contains('active')) {
			item_satis.value = 4.5;
		} else if(score4.classList.contains('active')) {
			item_satis.value = 4.0;
		} else if(score3_5.classList.contains('active')) {
			item_satis.value = 3.5;
		} else if(score3.classList.contains('active')) {
			item_satis.value = 3.0;
		} else if(score2_5.classList.contains('active')) {
			item_satis.value = 2.5;
		} else if(score2.classList.contains('active')) {
			item_satis.value = 2.0;
		} else if(score1_5.classList.contains('active')) {
			item_satis.value = 1.5;
		} else if(score1.classList.contains('active')) {
			item_satis.value = 1.0;
		} else {
			item_satis.value = 0.5;
		}

		if(d_score5.classList.contains('active')){
			delivery_satis.value = 5.0;
		} else if(d_score4_5.classList.contains('active')) {
			delivery_satis.value = 4.5;
		} else if(d_score4.classList.contains('active')) {
			delivery_satis.value = 4.0;
		} else if(d_score3_5.classList.contains('active')) {
			delivery_satis.value = 3.5;
		} else if(d_score3.classList.contains('active')) {
			delivery_satis.value = 3.0;
		} else if(d_score2_5.classList.contains('active')) {
			delivery_satis.value = 2.5;
		} else if(d_score2.classList.contains('active')) {
			delivery_satis.value = 2.0;
		} else if(d_score1_5.classList.contains('active')) {
			delivery_satis.value = 1.5;
		} else if(d_score1.classList.contains('active')) {
			delivery_satis.value = 1.0;
		} else {
			delivery_satis.value = 0.5;
		}
		
		
		
		if(!score0_5.classList.contains('active')|| !d_score0_5.classList.contains('active')){
			alert("별점을 선택해주세요.")
		} else if( change_goods_text.length < 20) {
			alert("20자 이상(공백, 특수문자, 단순문자 제외) 작성 시 후기 등록이 가능합니다.")
		} else if( change_goods_text.length >200 ) {
			alert("200자 이하(공백, 특수문자, 단순문자 제외) 작성 시 후기 등록이 가능합니다.")
		} else {
			alert("정상적으로 등록되었습니다.");
			form.submit();
		}
	});
