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
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
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
	  		  <strong>비회원 주문조회</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="OrderNonMember.or">
	  				<span>비회원 주문조회</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
   <main id="main">
     <div class="container">
       <div class="row">
         <div class="col-xs-12">
           <div class="login__box">
		    <div class="order__login--wrap">  
		        <h5 class="order_title">비회원 주문조회</h5>                        
			    <form name="order__non-member--form" id="form" action="non-OrderResearchByInfo.or" method="GET">
			        <div class="irum">
			        	<label for ="userIrum">이름</label>
			            <input type="text" class="inputIrum" id="userIrum" name="userIrum" maxlength="20" value=""
			                placeholder="  주문자명을 입력해 주세요.">
			        </div>
			
			        <div class="phone">
			        	<label for="userPhone">휴대폰 번호</label>
			            <input type="text" class="inputPhone" id="userPhon" name="userPhone" maxlength="20"
			                placeholder="  휴대폰 번호를 입력해 주세요. 예) 010-XXXX-XXXX">
			        </div>
			
			        <div class="cart_btn">
			            <button type="button" id="submitBtn" class="submitcartBtn">비회원 주문조회</button>
			        </div>
			    </form>
		      </div>
		    </div>
		  </div>
	    </div>
	  </div>
	</main>
	<script type="text/javascript" src="<c:url value='/resources/js/Order/nonMember.js?after'/>" ></script>    
	<!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>