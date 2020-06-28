<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Order/order_login.css?after'/>" rel="stylesheet" />
    <title>주문조회</title>
<title>비회원 주문배송</title>
</head>
<body>
<section id="sub-main" class="delivery">
	  <div class="sub-top">
	  	<h2 class="sub-title">주문배송</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>비회원 주문배송</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li class="unselect">
	  			<a href="OrderLogin.or">
	  				<span>주문배송</span>
	  			</a>
	  		</li>
	  		<li>
	  			<a href="Order-non_member.or">
	  				<span>비회원 주문배송</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
 <main id="main">
   <div class="container">
     <div class="row">
       <div class="col-xs-12">
			<div class="order__login--wrap2">  
			        <h5 class="order_tit2">비회원 주문조회</h5>                        
			        <p class="login__member2">비회원</p>                        
			    <div class="login__border2">
			    </div>
			    <form name="order__login--form2">
			        <div class="irum">
			            <input type="text" class="inputIrum" id="userIrum" name="userIrum" maxlength="20" value=""
			                placeholder="  주문자명을 입력해 주세요.">
			        </div>
			
			        <div class="phone">
			            <input type="text" class="inputPhone" id="userPhone" name="userPhone" maxlength="20"
			                placeholder="  휴대폰번호를 입력해 주세요.">
			        </div>
			
			        <div class="cart_btn">
			            <button type="button" class="submitcartBtn" onclick="location.href='OrderCheck.or'">주문조회</button>
			        </div>
			    </form>
			</div>
		</div>
	  </div>
	</div>
	</main>
	<!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>