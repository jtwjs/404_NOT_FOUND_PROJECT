<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <header id="header" role="banner">
      <div id="header__content">
        <div class="header__top">
          <div class="inner">
            <ul class="header__top__navi">
  		<sec:authorize access = "isAnonymous()">
				<li><a href="#" onclick="javascript:location.href='Login.ad'">로그인</a></li>
				<li><a href="#" onclick="javascript:location.href='JoinSelect.ad'">회원가입</a></li>
		</sec:authorize>
		<sec:authorize access = "isAuthenticated()">
              <li>
              	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
              	<form id="logout-form" action='<c:url value='/logout.ad' />' method="POST">
              	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              	</form>
              </li>
              <sec:authorize access="hasRole('ROLE_ADMIN')">
              <li><a href="#" onclick="javascript:location.href='AccountManagement.ad'">회원관리</a></li>
              </sec:authorize>
              <sec:authorize access="hasRole('ROLE_BUYER')">
              <li><a href="#" onclick="javascript:location.href='BuyerMyPage.by'">마이페이지</a></li>
              </sec:authorize>
           	  <sec:authorize access="hasRole('ROLE_SELLER')">
              <li><a href="#" onclick="javascript:location.href='SellerMyPage.se'">마이페이지</a></li>
              </sec:authorize>
		</sec:authorize>
        <sec:authorize access = "isAuthenticated()">      
              <li><a href="#" id="order_delivery">주문배송</a></li>
              <li><a href="#" onclick="javascript:location.href='OrderResearch.or'">주문배송페이지</a></li> 
        </sec:authorize>
        <sec:authorize access = "isAnonymous()">
        	  <li><a href="#" onclick="javascript:location.href='non-OrderResearch.or'">주문배송</a></li>
        </sec:authorize>      
              <li><a href="#" onclick="javascript:location.href='CartView.or'">장바구니</a></li>
              <li><a href="#" onclick="javascript:location.href='BoardNotice.sc'">고객센터</a></li>
            </ul>
          </div>
        </div>
        <nav id="header__nav" role="navigation">
          <div class="inner">
            <h2 id="header__logo">
              <a href="Index.in">
                <img src="./resources/Images/module/header/kindpng_570372.png" />
              </a>
            </h2>
            <div id="header__nav--category">
              <button type="button" id="category_btn">
                <span class="category-title">Menu</span>
              </button>
              <div id="category_menu">
                <div class="main_category">
                  <ul id="main_category--list">
                    <li>
                      <a id="main_category--first" class="title-on" href="BoardProductList.bo?category_1=1">쌀/잡곡</a>
                    </li>
                    <li>
                      <a id="main_category--second" href="BoardProductList.bo?category_1=2">채소류</a>
                    </li>
                    <li>
                      <a id="main_category--third" href="BoardProductList.bo?category_1=3">과일</a>
                    </li>
                    <li>
                      <a id="main_category--fourth" href="BoardProductList.bo?category_1=4">축산물</a>
                    </li>
                    <li>
                      <a id="main_category--fifth" href="BoardProductList.bo?category_1=5">수산물/건어물</a>
                    </li>
                    <li>
                      <a id="main_category--sixth" href="BoardProductList.bo?category_1=6">가공식품/떡류</a>
                    </li>
                    <li>
                      <a id="main_category--seventh" href="BoardProductList.bo?category_1=7">김치/반찬/젓갈</a>
                    </li>
                    <li>
                      <a id="main_category--eighth" href="BoardProductList.bo?category_1=8">장/조청/식초</a>
                    </li>
                    <li>
                      <a id="main_category--ninth" href="BoardProductList.bo?category_1=9">건강식품</a>
                    </li>
                    <li>
                      <a id="main_category--tenth" href="BoardProductList.bo?category_1=10">차류</a>
                    </li>
                  </ul>
                </div>
                <div class="sub_category">
                  <ul id="sub_category--first">
                    <li><a href="BoardProductList.bo?category_2=101" class="">백미</a></li>
                    <li><a href="BoardProductList.bo?category_2=102">현미/찹쌀/흑미</a></li>
                    <li><a href="BoardProductList.bo?category_2=103">콩/팥/보리</a></li>
                    <li><a href="BoardProductList.bo?category_2=104">조/수수/깨/기타</a></li>
                    <li><a href="BoardProductList.bo?category_2=105">곡류선물세트</a></li>
                  </ul>
                  <ul id="sub_category--second" class="hide">
                    <li><a href="BoardProductList.bo?category_2=201">감자/고구마</a></li>
                    <li><a href="BoardProductList.bo?category_2=202">더덕</a></li>
                    <li><a href="BoardProductList.bo?category_2=203">나물/잎줄기 채소</a></li>
                    <li><a href="BoardProductList.bo?category_2=204">건나물/건채소</a></li>
                    <li><a href="BoardProductList.bo?category_2=205">버섯류</a></li>
                    <li><a href="BoardProductList.bo?category_2=206">옥수수/단호박/기타</a></li>
                  </ul>
                  <ul id="sub_category--third" class="hide">
                    <li><a href="BoardProductList.bo?category_2=301">사과/배</a></li>
                    <li><a href="BoardProductList.bo?category_2=302">감/홍시/곶감</a></li>
                    <li><a href="BoardProductList.bo?category_2=303">견과/건과</a></li>
                    <li><a href="BoardProductList.bo?category_2=304">참다래/기타과일</a></li>
                  </ul>
                  <ul id="sub_category--fourth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=401">소고기</a></li>
                    <li><a href="BoardProductList.bo?category_2=402">돼지고기</a></li>
                    <li><a href="BoardProductList.bo?category_2=403">닭</a></li>
                    <li><a href="BoardProductList.bo?category_2=404">계란/알류/가공란</a></li>
                    <li><a href="BoardProductList.bo?category_2=405">축산선물세트</a></li>
                    <li><a href="BoardProductList.bo?category_2=406">유제품</a></li>
                    <li><a href="BoardProductList.bo?category_2=407">기타</a></li>
                  </ul>
                  <ul id="sub_category--fifth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=501">황태/진미채</a></li>
                    <li><a href="BoardProductList.bo?category_2=502">수산물선물세트</a></li>
                    <li><a href="BoardProductList.bo?category_2=503">기타</a></li>
                  </ul>
                  <ul id="sub_category--sixth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=601">떡</a></li>
                    <li><a href="BoardProductList.bo?category_2=602">한과</a></li>
                    <li><a href="BoardProductList.bo?category_2=603">면</a></li>
                    <li><a href="BoardProductList.bo?category_2=604">음료</a></li>
                    <li><a href="BoardProductList.bo?category_2=605">냉장냉동간편조리</a></li>
                    <li><a href="BoardProductList.bo?category_2=606">기름</a></li>
                    <li><a href="BoardProductList.bo?category_2=607">기타</a></li>
                  </ul>
                  <ul id="sub_category--seventh" class="hide">
                    <li><a href="BoardProductList.bo?category_2=701">김치/절임배추</a></li>
                    <li><a href="BoardProductList.bo?category_2=702">반찬/절임</a></li>
                    <li><a href="BoardProductList.bo?category_2=703">젓갈</a></li>
                    <li><a href="BoardProductList.bo?category_2=704">기타</a></li>
                  </ul>
                  <ul id="sub_category--eighth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=801">간장</a></li>
                    <li><a href="BoardProductList.bo?category_2=802">고추장</a></li>
                    <li><a href="BoardProductList.bo?category_2=803">된장</a></li>
                    <li><a href="BoardProductList.bo?category_2=804">청국장</a></li>
                    <li><a href="BoardProductList.bo?category_2=805">장류선물세트</a></li>
                    <li><a href="BoardProductList.bo?category_2=806">식초/액젓</a></li>
                    <li><a href="BoardProductList.bo?category_2=807">조청</a></li>
                    <li><a href="BoardProductList.bo?category_2=808">기타</a></li>
                  </ul>
                  <ul id="sub_category--ninth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=901">유산균</a></li>
                    <li><a href="BoardProductList.bo?category_2=902">홍삼/인삼</a></li>
                    <li><a href="BoardProductList.bo?category_2=903">건강즙</a></li>
                    <li><a href="BoardProductList.bo?category_2=904">영양식/선식</a></li>
                    <li><a href="BoardProductList.bo?category_2=905">꿀/로얄젤리</a></li>
                    <li><a href="BoardProductList.bo?category_2=906">건강분말/건강환</a></li>
                    <li><a href="BoardProductList.bo?category_2=907">기타</a></li>
                  </ul>
                  <ul id="sub_category--tenth" class="hide">
                    <li><a href="BoardProductList.bo?category_2=1001">커피</a></li>
                    <li><a href="BoardProductList.bo?category_2=1002">전통차/허브차/꽃차</a></li>
                    <li><a href="BoardProductList.bo?category_2=1003">커피/차 선물세트</a></li>
                    <li><a href="BoardProductList.bo?category_2=1004">기타</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="header__nav--localBar">
              <ul class="header__nav--list">
                <li class="nav--listItem listItem-title" >
                    <a href="BoardLocalIntroduce.bo">지역 특산물</a></li>
                <li class="nav--listItem">
                  <a class="3" href="BoardProductList.bo?category_local=1">강원</a>
                </li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=2">경기</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=3">경북</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=4">경남</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=5">전북</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=6">전남</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=7">충북</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=8">충남</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=9">제주</a></li>
                <li class="nav--listItem"><a href="BoardProductList.bo?category_local=10">울릉도/독도</a></li>
              </ul>
            </div>
            <div class="header__nav--searchbar">
              <input
                type="text"
                class="search-input"
                placeholder="지역 특산품"
              />
              <button type="submit" class="search-btn">
                <img
                  src="./resources/Images/module/header/search-icon.png"
                  alt="search icon"
                />
              </button>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <div class="delivery-modal-bg hide">
	    <div class="delivery-modal">
		     <button class="close-btn"></button>
			 <div class="modal-content">
			   	<div class="modal-desc">
		          <h2>현재 주문중인 배송 내역이 없습니다</h2>
			 	</div>
				 <div class="modal-btn">
		          <a class="go_shopping-btn" href="Index.in">쇼핑하러가기</a>
		          <a class="past_orderList-btn" href="BuyerMyPageOrderList.by">지난 주문내역 보러가기</a>
			    </div>
		     </div>
	    </div>
    </div>