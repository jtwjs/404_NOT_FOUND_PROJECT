<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>



<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_passwordModify.css?after'/>" rel="stylesheet" />
    <title>프로필 수정</title>
</head>
<body>
 	<section id="sub-main" class="mypage">
	  <div class="sub-top">
	  	<h2 class="sub-title">마이페이지</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>마이페이지</strong>
	  		</li>
  			<li>
	  			<strong>회원정보수정</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="BuyerMyPage.by">
	  				<span>마이페이지</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
<main id="main">
    <div class="container">
        <div class="row">
        	<div class="col-xs-12">
        		<section id="content">
		            <jsp:include page="mypage_template.jsp" flush="false"/>
		            <section id="myPage">
	                	<h2 class="content-title">비밀번호 변경</h2>
                   		<article class="update__form--customer">
                   			<h5><b>비밀번호 변경</b></h5>
                    			<form name="update__form--customer" id="modify__password--form" action="UpdateBuyerPassword.by" method="post" >


	                            <input type="hidden" class="hiddenId" id="userId" name="id" value="${user.id }" />                           

	
	                            <div class="update_pw">
	                                <div class="update_pw-new">
	                                    <label for="userPw" class="essential">신규 비밀번호</label>
	                                    <p class="password">
		                                <input type="password" class="inputPwCheck" id="userPw" name="password" maxlength="20" autocomplete="off">
		                                </p>
		                                <span class="guide">공백 없는 8 ~ 16자의 영문 대/소문자,숫자 및 특수문자 포함</span>
									</div>
									<div class="update_pw-confirm">		                                
		                                <label for="userPwCheck" class="essential">신규 비밀번호 재입력</label>
		                                <p class="password-confirm">
		                                <input type="password" class="inputPwCheck" id="userPwCheck" name="passwordCheck" maxlength="20" autocomplete="off">
		                                </p>
		                                <span class="guide">공백 없는 8 ~ 16자의 영문 대/소문자,숫자 및 특수문자 포함</span>
		                            </div>
	                            </div>          
	                            <script>
		                            function chkPW(){
	
			                           	var pw = $("#userPw").val();
			                           	var num = pw.search(/[0-9]/g);
			                           	var eng = pw.search(/[a-z]/ig);
			                           	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
			                           	if(pw.length < 8 || pw.length > 16){
		
				                           	alert("8자리 ~ 16자리 이내로 입력해주세요.");
				                           	return false;
			                           	} else if(pw.search(/\s/) != -1) {
				                           	alert("비밀번호는 공백 없이 입력해주세요.");
				                           	return false;
			                           	} else if(num < 0 || eng < 0 || spe < 0 ) {
				                           	alert("영문, 숫자, 특수문자를 혼합하여 입력해주세요.");
				                           	return false;
			                           	} else {
				                           	console.log("통과"); 
				                           	return true;
			                           	}
	
		                           	}
	                            </script>             
	                         
	                            <div class="update_finish">
	                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                                <button type="button" id="submitBtn">비밀번호 변경</button>
	                                <button type="button" id="resetBtn" onclick="location.href='BuyerMyPage.by'">취소</button> 
	                        	</div>                   
                        	</form>
                   		</article>
            	   	</section>    
           	  	</section>      
            </div>
        </div>
    </div>
</main>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_passwordModify.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
    
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>  
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>