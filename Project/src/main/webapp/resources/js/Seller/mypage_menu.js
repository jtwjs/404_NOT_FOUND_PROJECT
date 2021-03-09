var str = document.location.href;
var index = str.indexOf('.se');
var href = str.substring(0,index+3);




var profile = document.getElementById('menu-profile');
var profileItem = document.getElementById('menu-profile--item');
profile.addEventListener('click',function(){
    if ( profileItem.style.height == '70px' ){
        profile.style.backgroundColor = null;
        profile.style.color =  null;
        profileItem.style.height = '0px';
    }
    else { 
        profile.style.backgroundColor = '#34C759';
        profile.style.color = '#fff';
        profileItem.style.height = '70px';

        product.style.backgroundColor = null;
        product.style.color =  null;
        productItem.style.height = '0px';
        transaction.style.backgroundColor = null;
        transaction.style.color =  null;
        transactionItem.style.height = '0px';
        quotations.style.backgroundColor = null;
        quotations.style.color =  null;
        quotationsItem.style.height = '0px';
        qna.style.backgroundColor = null;
        qna.style.color =  null;
        qnaItem.style.height = '0px';

        product.classList.remove('selected-menu');
        transaction.classList.remove('selected-menu');
        quotations.classList.remove('selected-menu');
        qna.classList.remove('selected-menu');
    }
    profile.classList.toggle('selected-menu');
});

var product = document.getElementById('menu-product');
var productItem = document.getElementById('menu-product--item');
product.addEventListener('click',function(){
    if ( productItem.style.height == '70px' ){
        product.style.backgroundColor = null;
        product.style.color =  null;
        productItem.style.height = '0px';
    }
    else { 
        product.style.backgroundColor = '#34C759';
        product.style.color = '#fff';
        productItem.style.height = '70px';

        profile.style.backgroundColor = null;
        profile.style.color =  null;
        profileItem.style.height = '0px';
        transaction.style.backgroundColor = null;
        transaction.style.color =  null;
        transactionItem.style.height = '0px';
        quotations.style.backgroundColor = null;
        quotations.style.color =  null;
        quotationsItem.style.height = '0px';
        qna.style.backgroundColor = null;
        qna.style.color =  null;
        qnaItem.style.height = '0px';

        profile.classList.remove('selected-menu');
        transaction.classList.remove('selected-menu');
        quotations.classList.remove('selected-menu');
        qna.classList.remove('selected-menu');
    }
    product.classList.toggle('selected-menu');
});

var transaction = document.getElementById('menu-transaction');
var transactionItem = document.getElementById('menu-transaction--item');
transaction.addEventListener('click',function(){
    if ( transactionItem.style.height == '105px' ){
        transaction.style.backgroundColor = null;
        transaction.style.color =  null;
        transactionItem.style.height = '0px';
    }
    else { 
        transaction.style.backgroundColor = '#34C759';
        transaction.style.color = '#fff';
        transactionItem.style.height = '105px';

        profile.style.backgroundColor = null;
        profile.style.color =  null;
        profileItem.style.height = '0px';
        product.style.backgroundColor = null;
        product.style.color =  null;
        productItem.style.height = '0px';
        quotations.style.backgroundColor = null;
        quotations.style.color =  null;
        quotationsItem.style.height = '0px';
        qna.style.backgroundColor = null;
        qna.style.color =  null;
        qnaItem.style.height = '0px';

        profile.classList.remove('selected-menu');
        product.classList.remove('selected-menu');
        quotations.classList.remove('selected-menu');
        qna.classList.remove('selected-menu');
    }
    transaction.classList.toggle('selected-menu');
});

var quotations = document.getElementById('menu-quotations');
var quotationsItem = document.getElementById('menu-quotations--item');
quotations.addEventListener('click',function(){
    if ( quotationsItem.style.height == '35px' ){
        quotations.style.backgroundColor = null;
        quotations.style.color =  null;
        quotationsItem.style.height = '0px';
    }
    else { 
        quotations.style.backgroundColor = '#34C759';
        quotations.style.color = '#fff';
        quotationsItem.style.height = '35px';

        profile.style.backgroundColor = null;
        profile.style.color =  null;
        profileItem.style.height = '0px';
        
        product.style.backgroundColor = null;
        product.style.color =  null;
        productItem.style.height = '0px';
        transaction.style.backgroundColor = null;
        transaction.style.color =  null;
        transactionItem.style.height = '0px';
        qna.style.backgroundColor = null;
        qna.style.color =  null;
        qnaItem.style.height = '0px';

        profile.classList.remove('selected-menu');
        product.classList.remove('selected-menu');
        transaction.classList.remove('selected-menu');
        qna.classList.remove('selected-menu');
    }
    quotations.classList.toggle('selected-menu');
});

var qna = document.getElementById('menu-qna');
var qnaItem = document.getElementById('menu-qna--item');
qna.addEventListener('click',function(){
    if ( qnaItem.style.height == '70px' ){
        qna.style.backgroundColor = null;
        qna.style.color =  null;
        qnaItem.style.height = '0px';
    }
    else { 
        qna.style.backgroundColor = '#34C759';
        qna.style.color = '#fff';
        qnaItem.style.height = '70px';

        profile.style.backgroundColor = null;
        profile.style.color =  null;
        profileItem.style.height = '0px';
        product.style.backgroundColor = null;
        product.style.color =  null;
        productItem.style.height = '0px';
        transaction.style.backgroundColor = null;
        transaction.style.color =  null;
        transactionItem.style.height = '0px';
        quotations.style.backgroundColor = null;
        quotations.style.color =  null;
        quotationsItem.style.height = '0px';

        profile.classList.remove('selected-menu');
        product.classList.remove('selected-menu');
        transaction.classList.remove('selected-menu');
        quotations.classList.remove('selected-menu');
    }
    qna.classList.toggle('selected-menu');
});


if(href == 'http://localhost:8080/project/UpdateSellerAccountForm.se') {
	 profile.style.backgroundColor = '#34C759';
     profile.style.color = '#fff';
     profileItem.style.height = '70px';
     document.getElementById('item1').classList.add('selected');
}
if(href == 'http://localhost:8080/project/UpdateSellerPasswordFrom.se') {
	profile.style.backgroundColor = '#34C759';
    profile.style.color = '#fff';
    profileItem.style.height = '70px';
    document.getElementById('item2').classList.add('selected');
}

if(href == 'http://localhost:8080/project/SellerProductRegister.se'){
	  product.style.backgroundColor = '#34C759';
      product.style.color = '#fff';
      productItem.style.height = '70px';
    document.getElementById('item3').classList.add('selected');	
}
if(href == 'http://localhost:8080/project/SellerProductList.se'){
	  product.style.backgroundColor = '#34C759';
      product.style.color = '#fff';
      productItem.style.height = '70px';
    document.getElementById('item4').classList.add('selected');	
}

if(href == 'http://localhost:8080/project/SellerOrderStatus.se' ){
	transaction.style.backgroundColor = '#34C759';
    transaction.style.color = '#fff';
    transactionItem.style.height = '105px';
    document.getElementById('item5').classList.add('selected');
}
if(href == 'http://localhost:8080/project/SellerTransactionList.se'){
	transaction.style.backgroundColor = '#34C759';
    transaction.style.color = '#fff';
    transactionItem.style.height = '105px';
    document.getElementById('item6').classList.add('selected');
}
if(href == 'http://localhost:8080/project/SellerCalculateManager.se') {
	transaction.style.backgroundColor = '#34C759';
    transaction.style.color = '#fff';
    transactionItem.style.height = '105px';
    document.getElementById('item7').classList.add('selected');
}

if(href == 'http://localhost:8080/project/SellerMarketPriceInfo.se') {
	 quotations.style.backgroundColor = '#34C759';
     quotations.style.color = '#fff';
     quotationsItem.style.height = '35px';
    document.getElementById('item8').classList.add('selected');
}

if(href == 'http://localhost:8080/project/SellerProductQNA.se' ){
	qna.style.backgroundColor = '#34C759';
    qna.style.color = '#fff';
    qnaItem.style.height = '70px';
    document.getElementById('item9').classList.add('selected');
}
if(href == 'http://localhost:8080/project/SellerProductReview.se' ){
	qna.style.backgroundColor = '#34C759';
    qna.style.color = '#fff';
    qnaItem.style.height = '70px';
    document.getElementById('item10').classList.add('selected');
}

