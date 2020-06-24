<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 --> 
    <%-- <link href="<c:url value='/resources/css/Seller/mypage_main.css'/>" rel="stylesheet" /> --%>
    <link href="${pageContext.request.contextPath}/resources/css/Seller/mypage_main.css" rel="stylesheet" />

    <title>판매자 페이지</title>
</head>
<body>
<main id="main">
    	<div class="container">
	        <div class="row">
            	<div class="col-xs-12" >
	            	<section id="content">
	           			<aside id="side">
                            <article id="side__profile">
                                <dl>
                                    <dt class="profile-img">
                                        <img src="./resources/Images/Seller/profile.jpg" alt="profile" />
                                    </dt>
                                    <dd class="profile-content">
                                        <p class="seller">판매자</p>
                                        <p><span id="profile-name">윤기석</span> 님</p>
                                        <p>마지막 접속일자: <span id="last_access_date">2020.06.23</span></p>
                                    </dd>
                                </dl>
                            </article>
                            <article id="side__menu">
                                <dl>
                                    <dt id="menu-profile" >
                                        프로필
                                    </dt>
                                        <dd id="menu-profile--item">
                                            <a href="#" onclick="location.href=''">수정하기</a>
                                        </dd>
                                    <dt id="menu-product">
                                        상품내역
                                    </dt>
                                        <dd id="menu-product--item">
                                            <a href="#" onclick="location.href=''">상품등록</a>
                                            <a href="#" onclick="location.href=''">상품내역</a>
                                        </dd>
                                    <dt id="menu-transaction">
                                        거래내역
                                    </dt>   
                                        <dd id="menu-transaction--item">
                                            <a href="#" onclick="location.href=''">진행상황</a>
                                            <a href="#" onclick="location.href=''">거래목록</a>
                                            <a href="#" onclick="location.href=''">정산관리</a>
                                        </dd>
                                    
                                    <dt id="menu-quotations">
                                        시세정보
                                    </dt>   
                                        <dd id="menu-quotations--item">
                                            <a href="#" onclick="location.href=''">시세정보확인하기</a>
                                        </dd>
                                    
                                    <dt id="menu-qna">
                                        Q&A
                                    </dt>
                                        <dd id="menu-qna--item">
                                            <a href="#" onclick="location.href=''">상품문의</a>
                                            <a href="#" onclick="location.href=''">상품후기</a>
                                        </dd>
                                    
                                </dl>								           				
                            </article>
	           			</aside>
	           			<section id="myPage">
                            <h2 class="content-title">My Page</h2>
                            <article id="seller__info">
                                <div class="mypage__starRating">
                                    <div class="overall-rating">
                                        <h2>판매자 평점</h2>
                                        <dl class="rating">
                                            <dt><span class="enter">종합평점</span></dt>
                                            <dd><img id="star-rating" src="./resources/Images/Seller/star_3.png" alt="start rating"></dd>
                                            <dd class="rating-score"><strong class="grade">3.0</strong>/5</dd>
                                            <dd id="rating-explain">* 해당 평점은 지금까지 판매된 품목에 대한 총 평점입니다.</dd>
                                        </dl>
                                    </div>
                                    <div class="detail-rating">
                                        <ul class="detail-rating--list">
                                            <li class="detail-rating--item">
                                                <h2>상품만족</h2>
                                                <div class="rating-grade excellent">
                                                    <p>
                                                        <strong>5.0</strong>
                                                        <span class="enter">우수</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="detail-rating--item">
                                                <h2>배송속도</h2>
                                                <div class="rating-grade warring">
                                                    <p>
                                                        <strong>3.0</strong>
                                                        <span class="enter">주의</span>
                                                    </p>
                                                </div>
                                            </li>
                                            <li class="detail-rating--item">
                                                <h2>문의응대</h2>
                                                <div class="rating-grade bad">
                                                    <p>
                                                        <strong>1.0</strong>
                                                        <span class="enter">나쁨</span>
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mypage__subInfo">
                                    
                                    <div class="settlement-amount">
                                        <h2>오늘정산</h2>
                                        <dl>
                                            <dt>정산대상금액</dt>
                                            <dd><span id="amount" class="item">1,500,000</span> 원</dd>
                                        </dl>
                                    </div>
                                    <div class="additional-info">
                                        <dl>
                                            <dt class="info-regProduct">등록된상품</dt>
                                            <dd class="item">0</dd>
                                        </dl>
                                        <dl>
                                            <dt class="info-qna">상품Q&A</dt>
                                            <dd class="item">0</dd>
                                        </dl>
                                        <dl>
                                            <dt class="info-reqDelivery">오늘발송요청</dt>
                                            <dd class="item">0</dd>
                                        </dl>
                                        <dl>
                                            <dt class="info-sales">판매현황</dt>
                                            <dd class="item">0</dd>
                                        </dl>
                                    </div> 
                                </div>
                                
                            </article>  
                            <article id="inquery">
                                <div class="inquery__order-delivery">
                                    <div class="inquery--title">
                                        <h2>주문<span class="slash">/</span>발송조회</h2>
                                        <a class="view-all" href="#" title="전체보기">전체</a>
                                    </div>
                                    <div class="inquery--content">
                                        <ul class="inquery--list">
                                            <li class="inquery--list-item"><p>0<span class="enter">입금대기중</span></p></li> 
                                            <li class="inquery--list-item"><p>0<span class="enter">배송준비중</span></p></li> 
                                            <li class="inquery--list-item"><p>0<span class="enter">배송중</span></p></li> 
                                            <li class="inquery--list-item complete"><p>0<span class="enter">배송완료</span></p></li> 
                                        </ul>
                                    </div>
                                </div>
                                <div class="inquery__return-exchange">
                                    <div class="inquery--title">
                                        <h2>취소<span class="slash">/</span>교환<span class="slash">/</span>반품 내역</h2>
                                        <a class="view-all" href="#" title="전체보기">전체</a>
                                    </div>
                                    <ul class="inquery--list">
                                        <li class="inquery--list-item"><p>0<span class="enter">취소신청</span></p></li> 
                                        <li class="inquery--list-item"><p>0<span class="enter">교환신청</span></p></li> 
                                        <li class="inquery--list-item"><p>0<span class="enter">반품신청</span></p></li> 
                                        <li class="inquery--list-item complete"><p>0<span class="enter">반품완료</span></p></li> 
                                    </ul>
                                </div>
                            </article>
                            <article id="transaction__detail">
                                <div class="transaction__detail--title">
                                    <h2>거래내역</h2>
                                    <a class="view-all" href="#" title="전체보기">전체</a>
                                </div>    
                                <table class="transaction__detail--table">
                                    <thead>
                                        <tr>
                                            <th class="order-number">
                                                주문번호
                                            </th>             
                                            <th class="product-name">
                                                상품명
                                            </th>       
                                            <th class="order-amount">
                                                주문금액
                                            </th>       
                                            <th class="order-date">
                                                주문일자
                                            </th>       
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="non-post" colspan="4">
                                                거래내역이 없습니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </article>
                        </section>
	       			</section>
	       		 </div>	
       		</div>
        </div>	    
    </main>
    
    
    <jsp:include page="../footer.jsp" flush="false"/>
     <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
     <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_main.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
</body>
</html>