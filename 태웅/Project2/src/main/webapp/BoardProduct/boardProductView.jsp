<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/BoardProduct/boardProductView.css'/>" rel="stylesheet" />
    <title></title>
</head>
<body>
    <!-- contents 시작 -->
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <!-- 사진 및 제목, 부연설명 -->
                    <div class="seller__dataWrap">

                        <!-- 이미지 -->
                        <div class="seller__datathumb--img">
                            <div class="seller-imgBig" style="background-image: url(#);">
                                <img src="#" alt="">
                            </div>
                            
                            <div class="seller__img--thumb">
                                <ul>
                                    <li><img src="#" alt=""></li>
                                </ul>
                            </div>
                        </div>

                        <!-- 제품 설명란 -->
                        <div class="seller__datatxt">
                            <div class="seller__datatxtBox">
                                <div class="seller__datatitle">
                                    상품명  대
                                </div>
                            </div>
                            
                            <div class="seller__datatxtBox">
                                <div class="seller__datatxtarea">
                                    상품명  소  
                                </div>
                            </div>
                            <hr />

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>판매가</li>
                                    <li>금액</li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>배송</li>
                                    <li>
                                        <select class="selectDelivery" name="selectDelivery" id="delivery">
                                            <option value="택배(선불)" selected>택배(선불)</option>
                                            <option value="후불">후불</option>
                                            <option value="퀵서비스">퀵서비스</option>
                                            <option value="직접수령"">직접수령</option>
                                        </select>
                                    </li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>배송비</li>
                                    <li>금액</li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>고객평가</li>
                                    <li>()건 0.0/5</li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>원산지</li>
                                    <li>국내산</li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>지역</li>
                                    <li>강원</li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>단위</li>
                                    <li>1Kg</li>
                                </ul>
                            </div>
                            <div class="seller__datatxtBox">
                                <ul>
                                    <li>수량</li>
                                    <li class="etc__number">2,000</li>
                                </ul>
                            </div>
                           
                            <hr />
                            <div class="seller__datatxtBox seller__dataValue">
                                <ul>
                                    <li>금액</li>
                                    <li>
                                        <span>18,000</span>원
                                    </li>
                                </ul>
                            </div>

                            <hr />
                            <!-- 농원소개 -->

                            <script>
                                $(function () {
                                    $(".seller__datatxt .seller__data--btn > div  button").click(function (e) {
                                        confirm_ok = confirm('로그인 후 이용가능합니다.\n로그인 페이지로 이동하시겠습니까?');
                                        if (confirm_ok) {
                                            location.href = '#';
                                        } else {
                                            return false;
                                        }
                                    });
                                })
                            </script>
                            <div class="seller__data--btn">
                                <div class="seller__btnWrap">
                                    <button type="button" class="button1"><b>구매하기</b></button>
                                </div>
                                <div class="seller__btnWrap">
                                    <button type="button" class="button2"><b>장바구니</b></button>
                                </div>
                                <div class="seller__btnWrap">
                                    <button type="button" class="button3"><b>♡위시리스트</b></button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr />

                    <!-- 메뉴 바 -->
                    <div class="menu-bar">
                        
                        <a href="#seller-data" name="seller-data">상세 정보</a>
                        
                        <a href="#customer-review" name="customer-review">상품 후기</a>
                  
                        <a href="#customer-qna" name="customer-qna">상품 문의</a>
                  
                        <a href="#seller-etc" name="seller-etc">배송/교환/환불안내</a>
                 
                    </div>

                    <hr />

                    <!-- 상세정보 -->
                    <div class="seller-data" id="seller-data">
                        <h4 class="seller-head">
                            상세 정보
                        </h4>
                        <div class="rs-table-list">
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>판매 생산자</dt>
                                    <dd>홍길동</dd>
                                </dl>
                            </div>
                            
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>원산지</dt>
                                    <dd>강원도 영월군</dd>
                                </dl>
                            </div>
                            
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>상품 중량</dt>
                                    <dd>5kg</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>상품 크기</dt>
                                    <dd>-</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>수량</dt>
                                    <dd>1 박스</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>제조년월일</dt>
                                    <dd>2020 년산</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>유통기한 품질유지기한</dt>
                                    <dd>10개월</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>유전자 변형 농수산물 표시</dt>
                                    <dd>해당사항 없음</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>지리적 표시</dt>
                                    <dd>해당사항 없음</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>상품구성</dt>
                                    <dd>-</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>보관방법</dt>
                                    <dd>서늘한 곳에 보관</dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>소비자 상담 문의</dt>
                                    <dd>-</dd>
                                </dl>
                            </div>   

                        </div>
                    </div>

                    <hr />

                    <!-- 상품 후기 -->
                    <div class="customer-review" id="customer-review">
                        <h4 class="seller-head">
                            상품 후기
                        </h4>
                        <div class="customer-review__table">
                            <table>
                                <thead>
                                    <tr>
                                        <td class="customer-review__table--num" align="center">번호</td>
                                        <td class="customer-review__table--title" align="center">후기</td>
                                        <td class="customer-review__table--date" align="center">작성일</td>
                                        <td class="customer-review__table--hit" align="center">조회</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td colspan="4" class="customer-review__table--none-content" align="center">등록된 게시글이 없습니다</td>
                                    </tr>
                                    
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <hr />

                    <!-- 상품 문의 -->
                    <div class="customer-qna" id="customer-qna">
                        <h4 class="seller-head">
                            상품 문의
                        </h4>
                        <div class="customer-qna__table">
                            <table>
                                <thead>
                                    <tr>
                                        <td class="customer-qna__table--num" align="center">번호</td>
                                        <td class="customer-qna__table--title" align="center">문의</td>
                                        <td class="customer-qna__table--date" align="center">작성일</td>
                                        <td class="customer-qna__table--hit" align="center">조회</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td colspan="4" class="customer-qna__table--none-content" align="center">등록된 게시글이 없습니다</td>
                                    </tr>
                                    
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>

                    </div>

                    <hr />

                    <!-- 배송/교환/환불안내 -->
                    <div class="seller-etc" id="seller-etc">
                        <h4 class="seller-head">
                            배송/교환/환불안내
                        </h4>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt>반품/교환 안내</dt>
                                <dd>* 반품/교환에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.</dd>
                            </dl>
                        </div>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt><br /><br />반품/교환 사유에 따른 요청 가능 기간</dt>
                                <dd>* 반품 시 먼저 판매자와 연락하셔서 반품사유,택배사,배송비,반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.<br /><br />
                                    &nbsp;&nbsp;1. 구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품배송비 부담)<br />
                                    &nbsp;&nbsp;2. 표시/관고와 상이, 상품하자의 경우 상품 수령 후  3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.<br /><br />
                                    &nbsp;&nbsp;둘 중 하나 경과 시 반품/교환 불가(판매자 반품배송비 부담)
                                </dd>
                            </dl>
                        </div>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt><br /><br /><br /><br /><br /><br />반품/교환 불가능 사유</dt>
                                <dd>1. 반품요청기간이 지난 경우<br /><br />
                                    2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)<br /><br />
                                    3. 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예:식품,화장품,향수류,음반 등)<br /><br />
                                    4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)<br /><br />
                                    5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br /><br />
                                    6. 고객주문 확인 후 상품제작에 들어가는 주문제작상품<br /><br />
                                    7. 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <hr />
                
            </div>
        </div>
    </main>
    <!-- contents 끝 -->




    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>