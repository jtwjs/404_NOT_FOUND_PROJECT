<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="java.util.ArrayList" %>
<%

    int discount = (request.getParameter("discount") == null) ? 0 : Integer.parseInt(request.getParameter("discount"));
    int totProductPrice = 0;
    int totDeliveryPrice = 0;
    int totPrice = 0;

    ArrayList<BoardProductVO> vo_list = null;
    if((ArrayList<BoardProductVO>)request.getAttribute("vo_list") != null){
    	vo_list = (ArrayList<BoardProductVO>)request.getAttribute("vo_list");
    	
    }
    
    ArrayList<Integer> quantity_list = null;
    if((ArrayList<Integer>)request.getAttribute("quantity_list") != null){
    	quantity_list = (ArrayList<Integer>)request.getAttribute("quantity_list");
    }
    
    for(int i = 0; i < vo_list.size(); i++){
    	totProductPrice += (vo_list.get(i).getPrice() * quantity_list.get(i));
    	totDeliveryPrice += vo_list.get(i).getDelivery_price();
    }
    totPrice = totProductPrice + totDeliveryPrice;
    
%>
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
            
            <form id="orerSheetForm" method="post" action="OrderComplete.or" 
                onsubmit="return orderSheetCheck();">
            <div class="col-xs-12" id="order__list--check">
                <div class="order__title">
                    <span>주문상품 확인 및 할인적용</span>
                </div>
	                <table id="order-product_table">
	                    <thead>
	                        <tr class="product__list-title">
	                            <td class="list__name" colspan="2">주문상품</td>
	                            <td class="list__amount">수량</td>
	                            <td class="list__price">상품금액</td>
	                            <td class="list__discount">할인</td>
	                            <td class="list__discount-price">가격</td>
	                            <td class="list__save-point">적립</td>
	                            <td class="list__delivery-price">배송비</td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <%if(vo_list != null){ %>
	                        <%for(int i = 0; i < vo_list.size(); i++){ %>
	                        <tr class="product__list">
	                            <td class="list__thum"><img src="<%=vo_list.get(i).getThumbnail_thum_path() %><%=vo_list.get(i).getThumbnail_thum()%>"></td>
	                            <td class="list__title">
	                            <input type="text" name="board_title" class="board_title" 
	                                value="<%=vo_list.get(i).getTitle() %>" readonly />
	                            <input type="hidden" name="board_id" class="board_id" 
	                                value="<%=vo_list.get(i).getBoard_id() %>" />
	                            <input type="hidden" name="seller_id" class="seller_id"  
	                                value="<%=vo_list.get(i).getSeller_id() %>" />
	                            </td>
	                            <td>
	                            <input type="text" name="amount" class="amount" 
	                                value="<%=quantity_list.get(i) %>" readonly />
	                            </td>
	                            <td>
	                            <input type="text" name="price" class="price" 
	                                value="<%=vo_list.get(i).getPrice() %>" readonly />
	                            </td>
	                            <td class="discount"><%=discount %></td>
	                            <td>
	                            <input type="text" name="tot_price" class="tot_price" 
	                                value="<%=(vo_list.get(i).getPrice() * quantity_list.get(i)) - discount %>" readonly />
	                            </td>
	                            <td class="save_point"><%=(int)(((vo_list.get(i).getPrice() * quantity_list.get(i)) - discount) / 10) %></td>
	                            <td>
	                            <input type="text" name="delivery_price" class="delivery_price" 
	                                value="<%=vo_list.get(i).getDelivery_price() %>" readonly />
	                            </td>
	                        </tr>
	                        <%} 
	                        }%>
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
                               <span>${user.savePoint} 원</span>
                           </div>
                       </div>
                       <div>
                           <div class="order__delivery--info-head">
                               <span>예상적립혜택</span>
                           </div>
                           <div class="order__delivery--info-body">
                               <span>적립금 0 원</span>
                           </div>
                       </div>
                   </div>
                   <div id="order__final-payment--total-price">
                       <div>
                           <div>
                               <span>총 상품금액</span>
                               <span class="order__final-payment--price-check"><%=totProductPrice %> 원</span>
                           </div>
                           <div>
                               <span>총 배송비</span>
                               <span class="order__final-payment--price-check"><%=totDeliveryPrice %> 원</span>
                           </div>
                           <div>
                               <span>총 할인</span>
                               <span class="order__final-payment--price-check">0 원</span>
                           </div>
                           <div>
                               <span>사용 적립금</span>
                               <span class="order__final-payment--price-check">0 원</span>
                           </div>
                           <div class="order__final-payment--total-price-check">
                               <span><b>총 결제금액</b></span>
                               <span class="order__final-payment--price-check"><b><%=totPrice %> 원</b></span>
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
                            <input type="text" class="order__info--input-name" value="${user.name}" 
                                name="buyer_name" id="buyer_name" maxlength="16" />
                        </div>
                        <div>
                            <span class="order__info--check">*</span>
                            <span class="order__info--classification">휴대폰</span>
                            <span class="order__info--input-phone-data">
                            <input type="text" class="order__info--input-phone" value="${user.telCarrierNum}" maxlength="3" /> - 
                            <input type="text" class="order__info--input-phone" value="${user.telAllocationNum}" maxlength="4" /> - 
                            <input type="text" class="order__info--input-phone" value="${user.telDiscretionaryNum}" maxlength="4" />
                            <input type="hidden" value="" name="buyer_phone" id="buyer_phone" />
                            </span>
                        </div>
                        <div>
                            <span class="order__info--check">*</span>
                            <span class="order__info--classification">이메일</span>
                            <input type="text" class="order__info--input-email" maxlength="33" 
                                value="${user.email}" name="buyer_email" id="buyer_email" />
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
                                <input type="radio" name="order__delivery--radio-select" id="default_addr" checked/> 기본 배송지
                                <input type="radio" name="order__delivery--radio-select" id="new_addr"/> 새로운 배송지
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
                                <input type="text" id="sample4_postcode" value="${user.addrNum}" 
                                    name="addrNum" maxlength="5" /> 
                                 <input type="hidden" value="${user.addrNum}" id="userAddrNum" />
                                <input type="button" value="우편번호 검색" class="order__delivery--search-btn"
                                 id="zip-code-btn" onclick="sample4_execDaumPostcode()"/>
                                <input type="checkbox" /> 기본 배송지로 저장
                            </div>
                        </div>
                        <div>
                            <div class="order__delivery--info-head">&nbsp;</div>
                            <div class="order__delivery--info-body">
                                <input type="text" class="address__text" maxlength="50" name="addrRoadName" id="sample4_roadAddress"
                                	value="${user.addrRoadName}"/>
                                	<input type="hidden" value="${user.addrRoadName}" id="userAddrRoadName" />
                                 <span id="guide" style="color:#999;display:none"></span> 
                                <input type="text" placeholder="나머지 주소를 입력해주세요" name="addrDetail" class="address__text" maxlength="50" id="sample4_detailAddress"
                                    value="${user.addrDetail}"/>
                                    <input type="hidden" value="${user.addrDetail}" id="userAddrDetail" />
                                <input type="hidden" value="" name="order_address" id="order_address" />
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">*</span>
                                <span>받는 분</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <input type="text" id="recipient__text--name" name="order_name" maxlength="16" /> 
                                <input type="checkbox" onclick="data_check();" class="data-checkBox" /> 주문자 정보와 동일
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">*</span>
                                <span>받는 분 전화</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <input type="text" class="recipient__text--phone" maxlength="3" /> - 
                                <input type="text" class="recipient__text--phone" maxlength="4" /> - 
                                <input type="text" class="recipient__text--phone" maxlength="4" />
                                <input type="hidden" value="" name="order_phone" id="order_phone" />
                            </div>
                        </div>
                        
                        <div>
                            <div class="order__delivery--info-head">
                                <span class="order__info--check">&nbsp;</span>
                                <span>배송요청사항</span>
                            </div>
                            <div class="order__delivery--info-body">
                                <textarea id="order__delivery--message" name="order_demand" maxlength="200" 
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
                                <span id="total-price__total-price"><%=totPrice %></span>
                                <span>원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 결제 정보 end -->
            
            <div class="col-xs-12" id="order__submit">
                <div id="order__submit--check">
                    <input type="checkbox" class="agree_checkBox" /> 
                    <span>주문 상품, 가격, 배송정보, 할인내역 등을 최종 확인 후 구매 동의 (전자상거래법 제 8조 제 2항)</span>
                </div>
                <div id="order__submit--payment">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <input type="submit" value="상품 결제하기" />
                    <input type="button" value="결제 취소하기" onclick="javascript:location.href='Index.in'" />
                </div>
            </div>
            
            </form>
            
            <!-- 상품 결제 버튼 end -->
            
        </div>
    </div>
</main>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Order/order_sheet.js?after'/>" ></script>  
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>