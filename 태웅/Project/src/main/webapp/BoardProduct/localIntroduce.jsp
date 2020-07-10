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
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/BoardProduct/localIntroduce.css'/>" rel="stylesheet" />
    <title>지역특산물</title>
</head>
<body>
   <section id="sub-main" class="seller">
	  <div class="sub-top">
	  	<h2 class="sub-title">지역특산물</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>지역특산물</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="SellerMyPage.se">
	  				<span>지역특산물</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section> 

    <!-- contents 시작 -->
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <section id="content">

                        <!-- 메뉴 바 -->
                        <div class="menu-bar">
                                                
                            <a href="#local__gangwon" name="local__gangwon">강원</a>                            
                            <a href="#local__gyeonggi" name="local__gyeonggi">경기</a>
                            <a href="#local__gyeongsangbukdo" name="local__gyeongsangbukdo">경북</a>
                            <a href="#local__gyeongsangnamdo" name="local__gyeongsangnamdo">경남</a>
                            <a href="#local__Jeollabukdo" name="local__Jeollabukdo">전북</a>
                            <a href="#local__Jeollanamdo" name="local__Jeollanamdo">전남</a>
                            <a href="#local__Chungcheongbukdo" name="local__Chungcheongbukdo">충북</a>
                            <a href="#local__Chungcheongnamdo" name="local__Chungcheongnamdo">충남</a>
                            <a href="#local__jeju" name="local__jeju">제주</a>


                        </div>                    

                        <article class="local__introduce" id="local__gangwon">
                            <div class="local__title">
                                <p>강원</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/GangWon.png" alt="강원도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>춘천</dt>
                                        <dd>영지버섯 | 춘천잣 | 상황버섯 | 아가리쿠스버섯 | 동충하초 | 토마토</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>강릉</dt>
                                        <dd>초당두부 | 곶감 | 오징어 | 황태 | 토종꿀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>원주</dt>
                                        <dd>누에가루 | 쌀 | 표고버섯 | 고추장 | 고구마 | 배 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>속초</dt>
                                        <dd>오징어(여름) | 명태(겨울) | 가리 | 양미리 | 미역 | 꽁치 | 멸치</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>동해</dt>
                                        <dd>명란 | 다시마 | 오징어 | 젓갈 | 버섯 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>삼척</dt>
                                        <dd>장뇌 | 벌꿀 | 돌미역 | 왕마늘 | 자주감자 | 영양쌀 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>태백</dt>
                                        <dd>고랭지배추 | 식초 | 쑥 | 느타리버섯 | 김치 | 산나물</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>고성</dt>
                                        <dd>명태 | 오징어 | 꽁치 | 미역 | 치커리</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>양구</dt>
                                        <dd>곰취 | 쌀 | 콩 | 팥 | 제분</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>양양</dt>
                                        <dd>한우 | 연어 | 배 | 국화 | 백합 | 송이버섯 | 영지버섯 | 장뇌</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영월</dt>
                                        <dd>쑥 | 고춧가루 | 고추장 | 참기름 | 더덕 | 청결미 | 사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>인제</dt>
                                        <dd>송이버섯 | 인진쑥 | 치커리 | 황태</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>정선</dt>
                                        <dd>황기 | 콩장류 | 토종메주 | 찰옥수수</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>철원</dt>
                                        <dd>오대쌀 | 동동주 | 풍미육 | 청정육</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>평창</dt>
                                        <dd>고랭지김치 | 느타리버섯 | 감자 | 메주 | 산더덕 | 옥수수엿 | 찰옥수수</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>홍천</dt>
                                        <dd>인삼 | 옥수수찐빵 | 산양유 | 옥선주</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>화천</dt>
                                        <dd>잣 | 밤 | 버섯 | 약초</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>횡성</dt>
                                        <dd>한우 | 더덕 | 쌀 | 포도 | 흡참나물</dd>
                                    </dl>
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__gyeonggi">
                            <div class="local__title">
                                <p>경기</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/GyeongGi.png" alt="경기도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>광주</dt>
                                        <dd>토마토 | 한우 | 남한산성 소주 | 버섯 | 쌀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>안산</dt>
                                        <dd>대부포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>안양</dt>
                                        <dd>옥미주</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>남양주</dt>
                                        <dd>먹골배 | 무말랭이 | 장뇌삼</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>수원</dt>
                                        <dd>수원갈비</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>시흥</dt>
                                        <dd>미나리 | 쭈꾸미</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>화성</dt>
                                        <dd>김치 | 알타리 | 백세주 | 대하</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>동두천</dt>
                                        <dd>적상추</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>평택</dt>
                                        <dd>쌀 | 배 | 애호박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>안성</dt>
                                        <dd>쌀 | 포도 | 배 | 한우</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>용인</dt>
                                        <dd>오이 | 된장 | 옥로주 | 닭고기</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>이천</dt>
                                        <dd>쌀 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>여주</dt>
                                        <dd>쌀 | 땅콩 | 참외 | 고구마 | 표고버섯</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>하남</dt>
                                        <dd>부추</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>양평</dt>
                                        <dd>팽이버섯 | 표고버섯 | 산채나물 | 한우 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>구리</dt>
                                        <dd>먹골배 | 무말랭이</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>남양주</dt>
                                        <dd>먹골배 | 무말랭이</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>가평</dt>
                                        <dd>잣 | 사과 | 꿀 | 식혜</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>포천</dt>
                                        <dd>막걸리 | 버섯 | 이동갈비</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>양주</dt>
                                        <dd>부추 | 밤</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>연천</dt>
                                        <dd>율무 | 참기름 | 참외 | 느타리버섯 | 쌀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>파주</dt>
                                        <dd>한과 | 미숫가루</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>김포</dt>
                                        <dd>배 | 쌀 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>강화</dt>
                                        <dd>순무 | 인삼 | 강화약쑥</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__gyeongsangbukdo">
                            <div class="local__title">
                                <p>경북</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/GyeongSang-north.png" alt="경상북도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>울진</dt>
                                        <dd>대게 | 돌미역 | 산채</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>봉화</dt>
                                        <dd>송이버섯 | 고추 | 약초</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영주</dt>
                                        <dd>인삼 | 사과 | 산약</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>예천</dt>
                                        <dd>참기름 | 누에 | 사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>문경</dt>
                                        <dd>사과 | 표고버섯 | 오미자 | 한우</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>상주</dt>
                                        <dd>곶감 | 쌀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>의성</dt>
                                        <dd>마늘 | 쌀 | 사과 | 양파</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>안동</dt>
                                        <dd>고추 | 간고등어</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영양</dt>
                                        <dd>고추 | 사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영덕</dt>
                                        <dd>대게 | 복숭아 | 쪽파</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>청송</dt>
                                        <dd>사과 | 고추 | 파프리카</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>구미</dt>
                                        <dd>쌀 | 김치 | 사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>김천</dt>
                                        <dd>포도 | 자두 | 참외 | 감자</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>성주</dt>
                                        <dd>참외 | 수박 | 벌꿀 | 메주 | 고추장 | 된장</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>고령</dt>
                                        <dd>딸기 | 돼지 | 감자 |수박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>칠곡</dt>
                                        <dd>토종꿀 | 미나리 | 참외</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>군위</dt>
                                        <dd>오이 | 사과 | 마늘</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영천</dt>
                                        <dd>양파 | 자두 | 포도 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>포항</dt>
                                        <dd>과메기 | 부추 | 한과 | 시금치</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>경주</dt>
                                        <dd>법주 | 민속주 | 황남빵 | 찰토마토</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>경산</dt>
                                        <dd>대추 | 포도 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>청도</dt>
                                        <dd>복숭아 | 감 | 양파</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>울릉</dt>
                                        <dd>오징어 | 호박엿</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__gyeongsangnamdo">
                            <div class="local__title">
                                <p>경남</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/GyeongSang-south.png" alt="경상남도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>거창</dt>
                                        <dd>사과 | 덩굴차 | 딸기 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>함양</dt>
                                        <dd>밤 | 흑돼지 | 포도 | 산채</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>산청</dt>
                                        <dd>곶감 | 누에가루 | 황화씨 | 약초</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>합천</dt>
                                        <dd>돼지 | 한과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>의령</dt>
                                        <dd>수박 | 호박 | 버섯</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>창녕</dt>
                                        <dd>양파 | 마늘 | 고추 | 단감</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>밀양</dt>
                                        <dd>깻잎 | 사과 | 풋고추 | 대추</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>양산</dt>
                                        <dd>달걀 | 미역 | 작설차 | 참외</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>창원</dt>
                                        <dd>풋고추 | 단감 | 수박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>함안</dt>
                                        <dd>곶감 | 수박 | 연근</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>마산</dt>
                                        <dd>파프리카 | 미더덕 | 국화</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>진해</dt>
                                        <dd>피조개</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>진주</dt>
                                        <dd>고추 | 배</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>하동</dt>
                                        <dd>녹차 | 인삼 | 배 | 작설차</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>사천</dt>
                                        <dd>단감 | 쥐치포 | 멸치</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>남해</dt>
                                        <dd>유자 | 멸치 | 마늘</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>고성</dt>
                                        <dd>방울토마토 | 멸치젓</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>거제</dt>
                                        <dd>죽순 | 멸치 | 유자</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__Jeollabukdo">
                            <div class="local__title">
                                <p>전북</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/JeoLa-north.png" alt="전라북도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>군산</dt>
                                        <dd>쌀 | 가물치 | 나물 | 고추장 | 마른꽃새우</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>김제</dt>
                                        <dd>쌀 | 송주</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>남원</dt>
                                        <dd>쌀 | 배 | 딸기 | 사과 | 포도 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>익산</dt>
                                        <dd>가물치엑기스 | 수연소면 | 영지차 | 칡차</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>전주</dt>
                                        <dd>국화 | 배 | 이강주</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>정읍</dt>
                                        <dd>쌀 | 사과 | 배 | 수박 | 감 | 참외 | 방울토마토 | 느타리버섯</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>고창</dt>
                                        <dd>고창수박 | 복분자주 | 배 | 느타리</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>무주</dt>
                                        <dd>구천동한과 | 깐호두 | 사과 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>부안</dt>
                                        <dd>쌀 | 젓갈 | 김 | 죽염</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>순창</dt>
                                        <dd>고추장 | 동외정과 | 한과 | 장아찌</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>완주</dt>
                                        <dd>고산감식초 | 감 | 대추 | 포도</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>임실</dt>
                                        <dd>김치류 | 청결고추가루| 전통한과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>장수</dt>
                                        <dd>사과 | 배 | 대양초고추 | 인삼 | 오미자</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>진안</dt>
                                        <dd>인삼 | 마늘 | 고추 | 토종흑염소 | 진안돼지</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__Jeollanamdo">
                            <div class="local__title">
                                <p>전남</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/JeoLa-south.png" alt="전라남도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>곡성</dt>
                                        <dd>사과 | 딸기 | 한과 </dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>광양</dt>
                                        <dd>매실 | 밤 | 오이 | 작설차 | 고로쇠</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>구례</dt>
                                        <dd>오이 | 작설차 | 고추</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>능주</dt>
                                        <dd>복숭아 | 참깨</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>담양</dt>
                                        <dd>산채 | 엿</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>무안</dt>
                                        <dd>양파</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>법성</dt>
                                        <dd>굴비 | 김 | 굴</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>보성</dt>
                                        <dd>녹차</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>성전</dt>
                                        <dd>참외 | 채소류 | 곡물</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영광</dt>
                                        <dd>영광굴비</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영암</dt>
                                        <dd>참깨 | 소금</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>완도</dt>
                                        <dd>김 | 미역 | 전복 | 해삼</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>이양</dt>
                                        <dd>무 |  배추</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>장흥</dt>
                                        <dd>표고버섯 | 해산물 | 모시 | 감</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>진도</dt>
                                        <dd>구기자 | 미역 | 꽃게</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>창평</dt>
                                        <dd>쌀엿</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>토지</dt>
                                        <dd>고추 | 참깨 | 과일</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>학교</dt>
                                        <dd>고추 | 참깨 | 곡물</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>함평</dt>
                                        <dd>쌀 | 양파 | 고추 | 참깨</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>해남</dt>
                                        <dd>젓갈류 | 낙지 | 김</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>화순</dt>
                                        <dd>수박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>강진</dt>
                                        <dd>오이 | 표고버섯 | 낙지 | 꼬막</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>고흥</dt>
                                        <dd>단감 | 김</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>나주</dt>
                                        <dd>배</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>순천</dt>
                                        <dd>단감 | 매실</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>목포</dt>
                                        <dd>낙지</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>신안</dt>
                                        <dd>천일염 | 시금치</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>여수</dt>
                                        <dd>건어물 | 돌산 갓김치</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>장성</dt>
                                        <dd>새송이버섯</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__Chungcheongbukdo">
                            <div class="local__title">
                                <p>충북</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/ChungCheong-north.png" alt="충청북도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>단양</dt>
                                        <dd>마늘 | 고추 | 사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>제천</dt>
                                        <dd>약초 | 사과 | 더덕</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>충주</dt>
                                        <dd>사과 | 복숭아 | 수박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>음성</dt>
                                        <dd>고추 | 복숭아 | 수박</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>진천</dt>
                                        <dd>쌀 | 관상어</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>증평</dt>
                                        <dd>인삼 | 딸기 | 고추 | 고구마</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>괴산</dt>
                                        <dd>고추 | 찰옥수수</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>청주</dt>
                                        <dd>딸기 | 전통떡 | 대추술 | 쌀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>청원</dt>
                                        <dd>쌀 | 수박 | 애호박 | 딸기</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>보은</dt>
                                        <dd>대추 | 사과 | 배</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>옥천</dt>
                                        <dd>포도 | 율무 | 복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>영동</dt>
                                        <dd>포도 | 감 | 곶감 | 포도주</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__Chungcheongnamdo">
                            <div class="local__title">
                                <p>충남</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/ChungCheong-south.png" alt="충청남도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>태안</dt>
                                        <dd>대하</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>서산</dt>
                                        <dd>굴</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>당진</dt>
                                        <dd>바지락 | 밤 | 마늘 | 오이</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>아산</dt>
                                        <dd>표고버섯 | 포도 | 쌀 | 토마토 | 오이</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>천안</dt>
                                        <dd>호두 | 참외</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>예산</dt>
                                        <dd>사과</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>홍성</dt>
                                        <dd>새우젓 | 광천김</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>청양</dt>
                                        <dd>구기자 | 표고버섯</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>공주</dt>
                                        <dd>밤 | 인삼 | 쌀</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>연기</dt>
                                        <dd>복숭아</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>부여</dt>
                                        <dd>수박 | 토끼 | 인삼</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>논산</dt>
                                        <dd>딸기 | 오골계</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>계룡</dt>
                                        <dd>물엿</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>서천</dt>
                                        <dd>김</dd>
                                    </dl>
                                    <dl class="table-box">
                                        <dt>금산</dt>
                                        <dd>인삼</dd>
                                    </dl>                                    
                                </div>
                            </div>
                        </article>

                        <article class="local__introduce" id="local__jeju">
                            <div class="local__title">
                                <p>제주</p>
                            </div>
                            <div>
                                <div id="local__image">
                                    <img src="./resources/Images/BoardProduct/JeJu.png" alt="제주도" />
                                </div>
                            </div>
                            <div>
                                <div id="local__text">
                                    <dl class="table-box">
                                        <dt>제주 / 서귀포 </dt>
                                        <dd>흑돼지 | 제주감귤 | 한라봉 | 옥돔</dd>
                                    </dl>                             
                                </div>
                            </div>
                        </article>
                    
                    </section>

              </div>
            </div>
        </div>
    </main>
    <!-- contents 끝 -->


    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>