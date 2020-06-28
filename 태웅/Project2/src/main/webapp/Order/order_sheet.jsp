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
    <link href="<c:url value='/resources/css/Order/order_sheet.css?after'/>" rel="stylesheet" />
    <title>주문서 작성/결제</title>
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
                <span>주문서 작성/결제</span>
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
            
            
            <form id="order__form" action="OrderComplete.or" method="post" onsubmit="">
            
            <div class="col-xs-12" id="order__list--check">
                <div class="order__title">
                    <span>주문상품 확인 및 할인적용</span>
                </div>
                <table>
                    <thead>
                        <tr>
                            <td class="list__name">주문상품</td>
                            <td class="list__amount">수량</td>
                            <td class="list__price">상품금액</td>
                            <td class="list__discount">할인</td>
                            <td class="list__discount-price">할인가격</td>
                            <td class="list__save-point">적립</td>
                            <td class="list__delivery-price">배송비</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!-- 주문상품 리스트 end -->
            
            
            <div class="col-xs-12" id="order__final-payment">
                <div class="order__title">
                    <span>최종결제금액</span>
                </div>
                <div id="order__final-payment--table">
                   <div id="order__final-payment--save-point">
                       <div>
                           <div class="order__delivery--info-head">
                               <span>적립금</span>
                           </div>
                           <div class="order__delivery--info-body">
                               <span>
                                   <input type="text" id="save-point__input-text" />원 
                                   <input type="button" value="전액사용" id="save-point__input-btn" />
                               </span>
                           </div>
                       </div>
                       <div>
                           <div class="order__delivery--info-head">
                               <span>보유한 적립금</span>
                           </div>
                           <div class="order__delivery--info-body">
                               <span>0 원</span>
                           </div>
                       </div>
                       <div>
                           <div class="order__delivery--info-head">
                               <span>예상적립혜택</span>
                           </div>
                           <div class="order__delivery--info-body">
                               <span>적립금 0 원 | 포인트 0 P</span>
                           </div>
                       </div>
                   </div>
                   <div id="order__final-payment--total-price">
                       <div>
                           <div>
                               <span>총 상품금액</span>
                               <span class="order__final-payment--price-check">원</span>
                           </div>
                           <div>
                               <span>총 배송비</span>
                               <span class="order__final-payment--price-check">원</span>
                           </div>
                           <div>
                               <span>총 할인</span>
                               <span class="order__final-payment--price-check">원</span>
                           </div>
                           <div>
                               <span>사용 적립금</span>
                               <span class="order__final-payment--price-check">원</span>
                           </div>
                           <div class="order__final-payment--total-price-check">
                               <span><b>총 결제금액</b></span>
                               <span class="order__final-payment--price-check"><b>원</b></span>
                           </div>  
                           
                       </div>
                   </div>
                </div>
            </div>
            
            <!-- 최종결제금액 end -->
            
            
            <div class="col-xs-12" id="order__info">
                <div class="order__title">
                    <span>주문자 정보</span>
                </div>
                <div id="order__info--table">
                    <div id="order__info--info">
                        <div>
                            <span class="order__info--check">*</span>
                            <span class="order__info--classification">이름</span>
                            <input type="text" class="order__info--input-name"/>
                        </div>
                        <div>
                            <span class="order__info--check">*</span>
                            <span class="order__info--classification">휴대폰</span>
                            <span class="order__info--input-phone-data">
                            <input type="text" class="order__info--input-phone" /> - 
                            <input type="text" class="order__info--input-phone" /> - 
                            <input type="text" class="order__info--input-phone" />
                            </span>
                        </div>
                        <div>
                            <span class="order__info--check">*</span>
                            <span class="order__info--classification">이메일</span>
                            <input type="text" class="order__info--input-email"/>
                        </div>
                    </div>
                    <div id="order__info--precautions">
                        <div>* 비회원의 주문배송조회를 위한 로그인은 휴대폰번호로 확인할 수 있습니다.</div>
                        <div>* 구매내역을 이메일과 SMS로 안내해 드립니다.</div>
                        <div>* 정확한 이메일과 휴대폰 번호를 입력해 주세요.</div>
                    </div>
                </div>
            </div>
            
            <!-- 주문자 정보 end -->
            
            
            <div class="col-xs-12" id="order__delivery">
                <div class="order__title">
                    <span>주문 배송</span>
                </div>
                <div id="order__delivery--table">
                    <div id="order__delivery--info">
                        <div>
                            <div class="order__delivery--info-head">&nbsp;</div>
                            <div class="order__delivery--info-body">
                                <input type="radio" name="order__delivery--radio-select" /> 자주 쓰는 기본 배송지
                                <input type="radio" name="order__delivery--radio-select" /> 새로운 배송지
                                <input type="radio" name="order__delivery--radio-select" /> 회원정보주소
                                <input type="button" value="주소록" class="order__delivery--search-btn" 
                                    onclick="" />
                            </div>
                        </div>
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">*</span>
                                <span>배송주소</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <input type="text" id="postal-code__text" /> 
                                <input type="button" value="우편번호 검색" class="order__delivery--search-btn" />
                                <input type="checkbox" /> 기본 배송지로 저장
                            </div>
                        </div>
                        <div>
                            <div class="order__delivery--info-head">&nbsp;</div>
                            <div class="order__delivery--info-body">
                                <input type="text" class="address__text" /> 
                                <input type="text" placeholder="나머지 주소를 입력해주세요" class="address__text" />
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">*</span>
                                <span>받는 분</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <input type="text" id="recipient__text--name" /> 
                                <input type="checkbox" /> 주문자 정보와 동일
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">*</span>
                                <span>받는 분 전화</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <input type="text" class="recipient__text--phone" /> - 
                                <input type="text" class="recipient__text--phone" /> - 
                                <input type="text" class="recipient__text--phone" />
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">&nbsp;</span>
                                <span>배송요청사항</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <textarea id="order__delivery--message" 
                                    placeholder="이 곳은 집배원님이 보시는 메시지입니다. 전달사항이 있으신 분들은 게시판을 이용해주세요"></textarea>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            
            <!-- 배송지 end -->
            
            
            
            <div class="col-xs-12" id="order__payment">
                <div class="order__title">
                    <span>결제정보입력</span>
                </div>
                <div id="order__payment--table">
                    <div>
                        <div id="order__payment--info">
                            <div>
                                <div class="order__delivery--info-head">
                                    <span>일반 결제</span>
                                </div>
                                <div class="order__delivery--info-body">
                                    <input type="radio" name="order__payment--ordinary-payment"> 카카오페이
                                    <input type="radio" name="order__payment--ordinary-payment"> 무통장
                                    <input type="radio" name="order__payment--ordinary-payment"> 카드결제
                                </div>
                            </div>
                            <div>
                                <div class="order__delivery--info-head">
                                    <span>에스크로 결제</span>
                                </div>
                                <div class="order__delivery--info-body">
                                    <input type="radio" name="order__payment--ordinary-payment"> 실시간계좌이체
                                    <input type="radio" name="order__payment--ordinary-payment"> 가상계좌
                                </div>
                            </div>
                            <div>
                                <div class="order__delivery--info-head">
                                    <span>매출증빙</span>
                                </div>
                                <div class="order__delivery--info-body">
                                    <span>카드매출전표(또는 휴대폰결제전표)로 대체합니다</span>
                                </div>
                            </div>
                        </div>
                        
                        <div id="order__payment--total-price">
                            <div id="total-price__title">최종결제금액</div>
                            <div id="total-price__bar">
                                <span id="total-price__total-price">29000</span>
                                <span>원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 결제 정보 end -->
            
            
            <div class="col-xs-12" id="order__submit">
                <div id="order__submit--check">
                    <input type="checkbox" /> 
                    <span>주문 상품, 가격, 배송정보, 할인내역 등을 최종 확인 후 구매 동의 (전자상거래법 제 8조 제 2항)</span>
                </div>
                <div id="order__submit--payment">
                    <input type="submit" value="상품 결제하기" />
                    <input type="button" value="결제 취소하기" onclick="javascript:location.href='Index.in'" />
                </div>
            </div>
            
            <!-- 상품 결제 버튼 end -->
            
            </form>
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