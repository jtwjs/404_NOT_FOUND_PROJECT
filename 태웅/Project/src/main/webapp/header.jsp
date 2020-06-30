<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <header id="header" role="banner">
      <div id="header__content">
        <div class="header__top">
          <div class="inner">
            <ul class="header__top__navi">
              <li><a href="#" onclick="javascript:location.href='LoginBuyer.ad'">로그인</a></li>
              <li><a href="#" onclick="javascript:location.href='JoinSelect.ad'">회원가입</a></li>
              <li><a href="#" onclick="javascript:location.href='OrderLogin.or'">주문배송</a></li>
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
                      <a id="main_category--first" class="title-on" href="#">쌀/잡곡</a>
                    </li>
                    <li>
                      <a id="main_category--second" href="#">채소류</a>
                    </li>
                    <li>
                      <a id="main_category--third" href="#">과일</a>
                    </li>
                    <li>
                      <a id="main_category--fourth" href="#">축산물</a>
                    </li>
                    <li>
                      <a id="main_category--fifth" href="#">수산물/건어물</a>
                    </li>
                    <li>
                      <a id="main_category--sixth" href="#">가공식품/떡류</a>
                    </li>
                    <li>
                      <a id="main_category--seventh" href="#">김치/반찬/젓갈</a>
                    </li>
                    <li>
                      <a id="main_category--eighth" href="#">장/조청/식초</a>
                    </li>
                    <li>
                      <a id="main_category--ninth" href="#">건강식품</a>
                    </li>
                    <li>
                      <a id="main_category--tenth" href="#">차류</a>
                    </li>
                  </ul>
                </div>
                <div class="sub_category">
                  <ul id="sub_category--first">
                    <li><a href="BoardProductList.bo" class="">백미</a></li>
                    <li><a href="#">현미/찹쌀/흑미</a></li>
                    <li><a href="#">콩/팥/보리</a></li>
                    <li><a href="#">조/수수/깨/기타</a></li>
                    <li><a href="#">곡류선물세트</a></li>
                  </ul>
                  <ul id="sub_category--second" class="hide">
                    <li><a href="#">감자/고구마</a></li>
                    <li><a href="#">더덕</a></li>
                    <li><a href="#">나물/잎줄기 채소</a></li>
                    <li><a href="#">건나물/건채소</a></li>
                    <li><a href="#">버섯류</a></li>
                    <li><a href="#">옥수수/단호박/기타</a></li>
                  </ul>
                  <ul id="sub_category--third" class="hide">
                    <li><a href="#">사과/배</a></li>
                    <li><a href="#">감/홍시/곶감</a></li>
                    <li><a href="#">견과/건과</a></li>
                    <li><a href="#">참다래/기타과일</a></li>
                  </ul>
                  <ul id="sub_category--fourth" class="hide">
                    <li><a href="#">소고기</a></li>
                    <li><a href="#">돼지고기</a></li>
                    <li><a href="#">닭</a></li>
                    <li><a href="#">계란/알류/가공란</a></li>
                    <li><a href="#">축산선물세트</a></li>
                    <li><a href="#">유제품</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--fifth" class="hide">
                    <li><a href="#">황태/진미채</a></li>
                    <li><a href="#">수산물선물세트</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--sixth" class="hide">
                    <li><a href="#">떡</a></li>
                    <li><a href="#">한과</a></li>
                    <li><a href="#">면</a></li>
                    <li><a href="#">음료</a></li>
                    <li><a href="#">냉장냉동간편조리</a></li>
                    <li><a href="#">기름</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--seventh" class="hide">
                    <li><a href="#">김치/절임배추</a></li>
                    <li><a href="#">반찬/절임</a></li>
                    <li><a href="#">젓갈</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--eighth" class="hide">
                    <li><a href="#">간장</a></li>
                    <li><a href="#">고추장</a></li>
                    <li><a href="#">된장</a></li>
                    <li><a href="#">청국장</a></li>
                    <li><a href="#">장류선물세트</a></li>
                    <li><a href="#">식초/액젓</a></li>
                    <li><a href="#">조청</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--ninth" class="hide">
                    <li><a href="#">유산균</a></li>
                    <li><a href="#">홍삼/인삼</a></li>
                    <li><a href="#">건강즙</a></li>
                    <li><a href="#">영양식/선식</a></li>
                    <li><a href="#">꿀/로얄젤리</a></li>
                    <li><a href="#">건강분말/건강환</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                  <ul id="sub_category--tenth" class="hide">
                    <li><a href="#">커피</a></li>
                    <li><a href="#">전통차/허브차/꽃차</a></li>
                    <li><a href="#">커피/차 선물세트</a></li>
                    <li><a href="#">기타</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="header__nav--localBar">
              <ul class="header__nav--list">
                <li class="nav--listItem listItem-title" >
                    <a href="BoardLocalIntroduce.bo">지역 특산물</a></li>
                <li class="nav--listItem">
                  <a class="3" href="#">강원</a>
                </li>
                <li class="nav--listItem"><a href="#">경기</a></li>
                <li class="nav--listItem"><a href="#">경북</a></li>
                <li class="nav--listItem"><a href="#">경남</a></li>
                <li class="nav--listItem"><a href="#">전남</a></li>
                <li class="nav--listItem"><a href="#">전북</a></li>
                <li class="nav--listItem"><a href="#">제주</a></li>
                <li class="nav--listItem"><a href="#">충남</a></li>
                <li class="nav--listItem"><a href="#">충북</a></li>
                <li class="nav--listItem"><a href="#">울릉도/독도</a></li>
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