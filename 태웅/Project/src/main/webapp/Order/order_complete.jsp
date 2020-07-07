<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Order/order_complete.css?after'/>" rel="stylesheet" />
    <title>주문 완료</title>
</head>
<body>
<section id="sub-main" class="cartView">
	  <div class="sub-top">
	  	<h2 class="sub-title">장바구니</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>장바구니</strong>
	  		</li>
	  		<li>
	  		  <strong>주문서 작성/결제</strong>
	  		</li>
	  		<li>
	  		  <strong>주문접수/완료</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="CartView.or">
	  				<span>장바구니</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
<main id="main">
    <div class="container">
        <div class="row">
            <div class="col-xs-12" id="order__title">
                <img src="./resources/Images/Order/order_mark.png" /><br/>
                <span>주문접수/완료</span>
            </div>

            <div class="col-xs-4" id="order__step-1">
                <span>STEP01</span><br/>
                <b>장바구니</b>
            </div>
            <div class="col-xs-4" id="order__step-2">
                <span>STEP02</span><br/>
                <b>주문서 작성/결제</b>
            </div>
            <div class="col-xs-4" id="order__step-3">
                <span>STEP03</span><br/>
                <b>주문접수/완료</b>
            </div>
            
            <div class="col-xs-12" id="order__complete--table">
                <img src="./resources/Images/Order/shopping_cart.png" />
                <div id="order__complete--text">주문이 성공적으로 완료되었습니다</div>
                <div id="order__record--table">
                    <div>
                        <div class="order__record--table-head">
                            <span>주문번호</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>030303-030303</span>
                        </div>
                    </div>
                    <div>
                        <div class="order__record--table-head">
                            <span>배송지</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>서울 서초구 강남대로 459</span>
                        </div>
                    </div>
                    <div>
                        <div class="order__record--table-head">
                            <span>받으시는 분</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>비트캠프 서초본점</span>
                        </div>
                    </div>
                    <div>
                        <div class="order__record--table-head">
                            <span>받으시는 분 번호</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>02-3486-9600</span>
                        </div>
                    </div>
                    <div>
                        <div class="order__record--table-head">
                            <span>배송 메모</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>부재시 경비실에 맡겨주세요ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
                        </div>
                    </div>
                    <div>
                        <div class="order__record--table-head">
                            <span>결제 금액</span>
                        </div>
                        <div class="order__record--table-body">
                            <span>29000원</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-xs-12" id="order__complete--btn">
                <input type="button" value="주문내역 확인하기" onclick="javascript:location.href='OrderCheck.or'" />
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