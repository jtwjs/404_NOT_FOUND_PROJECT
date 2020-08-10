
var form = document.getElementById('login_form'),
	 submitBtn = document.querySelector('.submitBtn');

submitBtn.addEventListener('click',function(){

	 
	  var $idValue = $('#userId').val();
	  var $pwValue = $('#userPw').val();
	  
	  var token = $("meta[name='_csrf']").attr("content");
	  var header = $("meta[name='_csrf_header']").attr("content");
	$.ajax({
		url: '/project/loginCheckSeller.ad',
		type: 'POST',
		data: {seller_id : $idValue,seller_pw : $pwValue},
		 beforeSend: function(xhr){
			  /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			  xhr.setRequestHeader(header, token);
		  },
		  dataType: 'json',
		  contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		  success: function(data){
			  if($idValue == '' || $pwValue == ''){
					 alert('아이디 또는 비밀번호를 입력하세요');
					 return false;
			  }else if(data.result == "null"){
				alert("등록된 회원이 아닙니다.");
			  }else if(data.result =="NOT_SELLER"){
				 alert("등록된 회원이 아닙니다.")
			  }else if(data.password == "Fail"){
				alert("패스워드가 틀립니다.");	
			  }else{
					 form.submit();
				 }
		  },
		  error: function(xhr,status,error){
			  console.log('error:'+error);
		  }
	  });  
	
	 
});


	 