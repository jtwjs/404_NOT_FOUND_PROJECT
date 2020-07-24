<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.spring.boardproduct.BoardProductVO"%>
<%@ page import="java.util.ArrayList"%>
<%
	int discount = (request.getParameter("discount") == null) ? 0 : Integer.parseInt(request.getParameter("discount"));
int totProductPrice = 0;
int totDeliveryPrice = 0;
int totPrice = 0;

ArrayList<BoardProductVO> vo_list = null;
if ((ArrayList<BoardProductVO>) request.getAttribute("vo_list") != null) {
	vo_list = (ArrayList<BoardProductVO>) request.getAttribute("vo_list");

}

ArrayList<Integer> quantity_list = null;
if ((ArrayList<Integer>) request.getAttribute("quantity_list") != null) {
	quantity_list = (ArrayList<Integer>) request.getAttribute("quantity_list");
}

for (int i = 0; i < vo_list.size(); i++) {
	totProductPrice += (vo_list.get(i).getPrice() * quantity_list.get(i));
	totDeliveryPrice += vo_list.get(i).getDelivery_price();
}
totPrice = totProductPrice + totDeliveryPrice;
%>
<!DOCTYPE html>
<html>
<head>
<!-- header, css -->
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/reset.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/header.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css?after'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Order/order_sheet.css?after'/>"
	rel="stylesheet" />
 <!-- iamport.payment.js -->

<title>주문서 작성/결제</title>
</head>
<body>
	<section id="sub-main" class="cartView">
		<div class="sub-top">
			<h2 class="sub-title">장바구니</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>장바구니</strong></li>
				<li><strong>주문서 작성/결제</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="CartView.or"> <span>장바구니</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-12" id="order__title">
					<img src="./resources/Images/Order/order_mark.png" /><br /> <span>주문서
						작성/결제</span>
				</div>


				<div class="col-xs-4" id="order__step-1">
					<span>STEP01</span><br /> <b>장바구니</b>
				</div>
				<div class="col-xs-4" id="order__step-2">
					<span>STEP02</span><br /> <b>주문서 작성/결제</b>
				</div>
				<div class="col-xs-4" id="order__step-3">
					<span>STEP03</span><br /> <b>주문접수/완료</b>
				</div>

<!-- onsubmit="return orderSheetCheck();" -->
				<!-- 주문상품 목록 --> <!-- action="OrderComplete.or" -->
				<form id="orerSheetForm" method="post" action="OrderComplete.or"
					>
					<input type="hidden" name="buyer_id" value="${buyer_id}"/>
					
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
								<%
									if (vo_list != null) {
										int totalSP =0;
								%>
								<%
									for (int i = 0; i < vo_list.size(); i++) {
									
										totalSP +=  (int)(((vo_list.get(i).getPrice() * quantity_list.get(i)) - discount) / 10);
								%>
								<tr class="product__list">
									<td class="list__thum"><img
										src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum_path(), "UTF-8")%>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum(), "UTF-8")%>"></td>
									<td class="list__title"><input type="text"
										name="board_title" class="board_title"
										value="<%=vo_list.get(i).getTitle()%>" readonly /> <input
										type="hidden" name="board_id" class="board_id"
										value="<%=vo_list.get(i).getBoard_id()%>" /> <input
										type="hidden" name="seller_id" class="seller_id"
										value="<%=vo_list.get(i).getSeller_id()%>" /></td>
									<td><input type="text" name="amount" class="amount"
										value="<%=quantity_list.get(i)%>" readonly /></td>
									<td><input type="text" name="price" class="price"
										value="<%=vo_list.get(i).getPrice()%>" readonly /></td>
									<td class="discount"><%=discount%></td>
									<td><input type="text" name="tot_price" class="tot_price"
										value="<%=(vo_list.get(i).getPrice() * quantity_list.get(i)) - discount%>"
										readonly /></td>
									<td class="save_point"><%=(int) (((vo_list.get(i).getPrice() * quantity_list.get(i)) - discount) / 10)%></td>
									<td><input type="text" name="delivery_price"
										class="delivery_price"
										value="<%=vo_list.get(i).getDelivery_price()%>" readonly /></td>
								</tr>
								<%
									}%>
									<input type="hidden" id="total_sp" value="<%=totalSP%>" />
								<%
								}
								%>
							</tbody>
						</table>
					</div>

					<!-- 회원 정보 -->

					<div class="col-xs-12" id="order__info">
						<div class="order__title">
							<span>주문자 정보</span>
						</div>
						<div id="order__info--table">
							<div id="order__info--info">
								<div>
									<span class="order__info--check">*</span> <span
										class="order__info--classification">이름</span> <input
										type="text" class="order__info--input-name"
										value="${user.name}" name="buyer_name" id="buyer_name"
										maxlength="16" />
								</div>
								<div>
									<span class="order__info--check">*</span> <span
										class="order__info--classification">휴대폰</span> <span
										class="order__info--input-phone-data"> <input
										type="text" class="order__info--input-phone"
										value="${user.telCarrierNum}" maxlength="3" id="caarierNum"/> - <input
										type="text" class="order__info--input-phone"
										value="${user.telAllocationNum}" maxlength="4" id="allocatioNum" /> - <input
										type="text" class="order__info--input-phone"
										value="${user.telDiscretionaryNum}" maxlength="4" id="discretionaryNum" />
										 <input
										type="hidden" value="" name="buyer_phone" id="buyer_phone" />
									</span>
								</div>
								<div>
									<span class="order__info--check">*</span> <span
										class="order__info--classification">이메일</span> <input
										type="text" class="order__info--input-email" maxlength="33"
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

					<!-- 주문배송 정보 -->


					<div class="col-xs-12" id="order__delivery">
						<div class="order__title">
							<span>주문 배송</span>
						</div>
						<div id="order__delivery--table">
							<div id="order__delivery--info">
								<div>
									<div class="order__delivery--info-head">&nbsp;</div>
									<div class="order__delivery--info-body">
										<input type="radio" name="order__delivery--radio-select"
											id="default_addr" checked /> 기본 배송지
										<sec:authorize access="hasRole('ROLE_BUYER')">
											<input type="radio" name="order__delivery--radio-select"
												id="new_addr" /> 새로운 배송지
                                <input type="button" value="주소록"
												class="order__delivery--search-btn" id="addrBook_btn">
										</sec:authorize>

									</div>
								</div>
								<div>
									<div class="order__delivery--info-head">
										<span class="order__info--check">*</span> <span>배송주소</span>
									</div>
									<div class="order__delivery--info-body">
										<sec:authorize access="hasRole('ROLE_BUYER')">
											<input type="text" id="sample4_postcode"
												value="${user.addrNum}" name="addrNum" maxlength="5" />
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<input type="text" id="sample4_postcode" name="addrNum"
												maxlength="5" />
										</sec:authorize>
										<input type="hidden" value="${user.addrNum}" id="userAddrNum" name="order_postalCode"/>
										<input type="button" value="우편번호 검색"
											class="order__delivery--search-btn" id="zip-code-btn"
											onclick="sample4_execDaumPostcode()" />
										<sec:authorize access="hasRole('ROLE_BUYER')">
											<input type="checkbox" /> 기본 배송지로 저장
                                </sec:authorize>
									</div>
								</div>
								<div>
									<div class="order__delivery--info-head">&nbsp;</div>
									<div class="order__delivery--info-body">
										<sec:authorize access="hasRole('ROLE_BUYER')">
											<input type="text" class="address__text" maxlength="50"
												name="addrRoadName" id="sample4_roadAddress"
												value="${user.addrRoadName}" />
											<input type="hidden" value="${user.addrRoadName}"
												id="userAddrRoadName" />
											<span id="guide" style="color: #999; display: none"></span>
											<input type="text" placeholder="나머지 주소를 입력해주세요"
												name="addrDetail" class="address__text" maxlength="50"
												id="sample4_detailAddress" value="${user.addrDetail}" />
											<input type="hidden" value="${user.addrDetail}"
												id="userAddrDetail" />
											<input type="hidden" value="" name="order_address"
												id="order_address" />
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
											<input type="text" class="address__text" maxlength="50"
												name="addrRoadName" id="sample4_roadAddress" />
											<input type="hidden" id="userAddrRoadName" />
											<span id="guide" style="color: #999; display: none"></span>
											<input type="text" placeholder="나머지 주소를 입력해주세요"
												name="addrDetail" class="address__text" maxlength="50"
												id="sample4_detailAddress" value="${user.addrDetail}" />
											<input type="hidden" id="userAddrDetail" />
											<input type="hidden" value="" name="order_address"
												id="order_address" />
										</sec:authorize>
									</div>
								</div>

								<div>
									<div class="order__delivery--info-head">
										<span class="order__info--check">*</span> <span>받는 분</span>
									</div>
									<div class="order__delivery--info-body">
										<input type="text" id="recipient__text--name"
											name="order_name" maxlength="16" /> <input type="checkbox"
											onclick="data_check();" class="data-checkBox" /> 주문자 정보와 동일
									</div>
								</div>

								<div>
									<div class="order__delivery--info-head">
										<span class="order__info--check">*</span> <span>받는 분 전화</span>
									</div>
									<div class="order__delivery--info-body">
										<input type="text" class="recipient__text--phone"
											maxlength="3" id="recipent_carrierNum"/> - <input type="text"
											class="recipient__text--phone" maxlength="4"
											id="recipent_allocationNum" /> - <input
											type="text" class="recipient__text--phone" maxlength="4" 
											id="recipent_discretionaryNum"/>
										<input type="hidden" value="" name="order_phone"
											id="order_phone" />
									</div>
								</div>

								<div>
									<div class="order__delivery--info-head">
										<span class="order__info--check">&nbsp;</span> <span>배송요청사항</span>
									</div>
									<div class="order__delivery--info-body">
										<textarea id="order__delivery--message" name="order_demand"
											maxlength="200"
											placeholder="이 곳은 집배원님이 보시는 메시지입니다. 전달사항이 있으신 분들은 게시판을 이용해주세요"></textarea>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- 결제금액 -->

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
										<span> <input type="text" id="save-point__input-text" />원
											<input type="button" value="전액사용" id="save-point__input-btn" />
										</span>
										<p class="explain">적립금은 상품 금액의 7%까지만 사용 가능합니다.</p>
									</div>
								</div>
								<div class="reserveWrap">
									<div class="order__delivery--info-head">
										<span>보유한 적립금</span>
									</div>
									<div class="my_reserves">
										<input type="text" id="reserves" value="${user.savePoint}" readonly /> 
										
									</div>
								</div>
								<div class="reserveWrap">
									<div class="order__delivery--info-head">
										<span>예상적립혜택</span>
									</div>
									<sec:authorize access="isAnonymous()">
									<div class="order__delivery--info-body">
                           				비회원인 경우에는 적립혜택이 없습니다
                           			</div>
                           			<input type="hidden" value="Y" name="member_flag">
                         			</sec:authorize>
									<sec:authorize access="isAuthenticated()">
									<div class="expected_reserve">
										<input type="text" id="expected_sp" readonly />
									</div>
									<input type="hidden" value="N" name="member_flag">
									</sec:authorize>
									
								</div>
							</div>
							<div id="order__final-payment--total-price">
								<div>
									<div class="amountWrap">
										<dl>
											<dt>총 상품금액</dt>
											<dd><input type="text" id="totalProductAmount" value="<%=totProductPrice%>" readonly /></dd>
											<input type="hidden" id="totalProductAmountValue" value="<%=totProductPrice%>" />
										</dl>
									</div>
									<div class="amountWrap">
										<dl>
											<dt>총 배송비</dt>
											<dd><input type="text" id="totalDeliveryAmount" value="<%=totDeliveryPrice%>" readonly /></dd>
											<input type="hidden" id="totalDeliveryAmountValue" value="<%=totDeliveryPrice%>" />
										</dl>
									</div>
									<div class="amountWrap">
										<dl>
											<dt class="discount-title">사용 적립금</dt>
											<dd><input type="text" name= "reserveUse" id="reserveUse" value="0" readonly /></dd>
										</dl>
									</div>
									<div class="amountWrap">
										<dl>
											<dt class="discount-title">총 할인</dt>
											<dd><input type="text" id="totalDiscount" value="0" readonly /></dd>
										</dl>
									</div>
									<div class="amountWrap">
										<dl class="finalAmount">
											<dt>총 결제금액</dt>
											<dd><input type="text" id="totalPaymentAmount" value="0" readonly /></dd>
										</dl>
									</div>

								</div>
							</div>
						</div>
					</div>


					<!-- 결제방식 -->
					<div id="order__payment">
						<p class="order_payment-title">결제정보입력</p>
						<div class="order__payment-content">
							<div class="payment-subContent">
								<h2 class="payment-title">결제 수단</h2>
								<ul class="payment-method_list">
									<li class="payment-method_list-item">
											<input id="kakao" type="radio" name="payment-method" value="카카오페이" checked />
											 <label for="kakao" id="kakao-pay">
											 	<img src="./resources/Images/Order/payment_icon_yellow_small.png" alt="카카오페이결제">
											 </label>
									 </li>
									<li class="payment-method_list-item"><input id="credit"
										type="radio" name="payment-method" value="신용카드"  /> <label
										for="credit">신용카드</label></li>
									<li class="payment-method_list-item"><input id="virtual"
										type="radio" name="payment-method" value="가상계좌" /> <label
										for="virtual">가상 계좌(무통장)</label></li>
									<li class="payment-method_list-item"><input id="transfer"
										type="radio" name="payment-method" value="계좌이체" /> <label
										for="transfer">계좌이체(에스크로)</label></li>
									<li class="payment-method_list-item"><input id="mobile"
										type="radio" name="payment-method" value="휴대전화" /> <label
										for="mobile">휴대전화</label></li>
								</ul>
							</div>
							<div class="payment-subContent">
								<h2 class="payment-title">결제 안내</h2>
								<div class="payment-guide">
									<!-- 카카오페이 -->
									<div id="kakao_pay">
										<div class="kakao-detail">
											<p class="bold">카카오페이 안내</p>
											<p class="explain">
												카카오페이는 카카오톡에서 카드를 등록, 간단하게 비밀번호만으로 결제할 수 있는 빠르고 편리한 모바일 결제
												서비스입니다.<span class="enter">-지원 카드 : 모든 카드 등록/결제 가능</span>
											</p>
										</div>
									</div>
									<!-- 신용카드 -->
									<div id="credit-card" class="hide">
										<div class="card-detail">
											<div class="card-datail-content">
												<select name="card">
													<option value="">카드 선택</option>
													<option value="하나카드">하나카드</option>
													<option value="BC카드">BC카드</option>
													<option value="하나BC">하나 BC</option>
													<option value="제주카드">제주카드</option>
													<option value="외한카드">외한카드</option>
													<option value="씨티카드">씨티카드</option>
													<option value="신협카드">신협카드</option>
													<option value="현대카드">현대카드</option>
													<option value="KB카드">KB카드(현대증권)</option>
													<option value="카카오뱅크">카카오뱅크</option>
													<option value="KDB산업">KDB산업</option>
													<option value="하나(외환)">하나(외환)</option>
													<option value="광주카드">광주카드</option>
													<option value="케이뱅크">케이뱅크</option>
													<option value="KB국민">KB국민</option>
													<option value="롯데카드">롯데카드</option>
													<option value="신한카드">신한카드</option>
													<option value="NH채움">NH채움</option>
													<option value="우체국카드">우체국카드</option>
													<option value="MG새마을">MG새마을</option>
													<option value="저축은행">저축은행</option>
													<option value="수협카드">수협카드</option>
													<option value="삼성카드">삼성카드</option>
												</select> <select name="installment">
													<option value="일시불">일시불</option>
													<option value="2개월">2개월</option>
													<option value="3개월">3개월</option>
													<option value="4개월">4개월</option>
													<option value="5개월">5개월</option>
													<option value="6개월">6개월</option>
													<option value="7개월">7개월</option>
													<option value="8개월">8개월</option>
													<option value="9개월">9개월</option>
													<option value="10개월">10개월</option>
													<option value="11개월">11개월</option>
												</select>
											</div>
											<p class="explain">※할부는 50,000원 이상만 가능합니다.</p>
										</div>
										<div class="safe_payment">
											<dl>
												<dt>안전결제(ISP) [국민카드/BC카드/우리카드]</dt>
												<dd class="explain">온라인 쇼핑시 주민등록번호, 비밀번호 등의 주요 개인정보를
													입력하지 않고 고객님이 사전에 미리 설정한 안전결제(ISP) 비밀번호만 입력, 결제하도록 하여 개인정보
													유출 및 카드 도용을 방지하는 서비스입니다.
												<dd>
											</dl>
										</div>
										<div class="safe_click">
											<dl>
												<dt>안심클릭결제 [삼성/외환/롯데/현대/신한/시티/하나/NH/수협/전북/광주/산업은행/제주은행]</dt>
												<dd class="explain">
													온라인 쇼핑시 주민등록번호,비밀번호 등의 주요 개인 정보를 입력하지 않고 고객님이 사전에 미리 설정한 전자
													상거래용 안심 클릭 비밀번호를 입력하여<span class="enter"> 카드 사용자 본인
														여부를 확인함으로써 온라인상에서의 카드도용을 방지하는 서비스입니다.</span>
												<dd>
											</dl>
										</div>

									</div>
									<!-- 가상계좌 -->
									<div id="virtual_account" class="hide">
										<div class="virtual-detail">
											<select name="virtual">
												<option value="">입금은행 선택</option>
												<option value="기업은행">기업은행</option>
												<option value="우리은행">우리은행</option>
												<option value="하나은행">하나은행</option>
												<option value="국민은행">국민은행</option>
												<option value="수협">수협</option>
												<option value="농협">농협</option>
												<option value="부산은행">부산은행</option>
												<option value="SC제일은행">SC제일은행</option>
												<option value="신한은행">신한은행</option>
												<option value="KEB하나은행">KEB하나은행</option>
												<option value="광주은행">광주은행</option>
												<option value="대구은행">대구은행</option>
												<option value="경남은행">경남은행</option>
											</select> <input type="text" readonly value="" />
										</div>
										<div class="virtual-account_guide">
											<p>
												<span class="bold">가상 계좌 안내</span> 계좌 유효 기간 <span
													class="timer"></span>
											</p>
											<p class="explain small">
												가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명이 다르더라도 입금이 확인이 가능합니다.
												단, 선택하신 은행을 통해 결제 금액을 1원 단위까지 정확히 맞추셔야 합니다. 가상계좌의 입금 유효기간은
												주문 후 2일 이내이며, 기간 초과 시 계좌번호는 소멸되어 입금되지 않습니다. 구매 가능 수량이 1개로
												제한된 상품은 주문 취소 시, 24시간 내 가상 계좌를 통한 재주문이 불가 합니다. 인터넷뱅킹, 텔레뱅킹,
												ATM/CD기계, 은행 창구 등에서 입금할 수 있습니다.<span class="enter">ATM
													기기는 100원 단위 입금이 되지 않으므로 통장 및 카드로 계좌이체 해주셔야 합니다. 은행 창구에서도 1원
													단위 입금이 가능합니다.<span class="enter"> 자세한 내용은 <span
														class="faq"onclick="window.open('BoardFaq.sc')">FAQ</span>를 확인하여 주시기 바랍니다.
												</span>
												</span>
											</p>
										</div>
									</div>
									<!-- 계좌이체 -->
									<div id="bank_transfer" class="hide">
										<div class="transfer-detail">
											<p class="bold">계좌이체(에스크로) 안내</p>
											<p class="explain">
												계좌이체는 ATM이나 은행 홈페이지에 접속하지 않고 이웃# 홈페이지 내에서 즉시 결제, 출금되는 결제방식
												입니다. <span class="enter">현재 약 20여 개의 은행이 가능하며 현금영수증
													발행은 결제 시 즉시 발급받으실 수 있습니다.</span>
											</p>
										</div>
									</div>
									<!-- 휴대전화 -->
									<div id="mobile_pay" class="hide">
										<div class="mobile-detail">
											<p class="bold">휴대폰 결제(수수료) 안내</p>
											<p class="explain">
												휴대폰 결제는 통신사와 결제 대행사의 정책/높은 수수료/늦은 정산 주기로 인해 50만원 이하 상품만 가능하며
												<span class="fee_guide">결제하실 금액의 5%가 결제 수수료로 추가됩니다.</span> <span
													class="enter">예) 판매 금액 50,000원 상품을 휴대폰 결제할 경우
													52,500원이 결제됩니다. 환불 시에는 수수료를 포함한 결제 금액이 환불됩니다.</span>
											</p>

											<p class="explain">
												※<span class="bold">저렴한 구매를 원하실 경우 타 결제 수단(신용카드, 가상
													계좌, 계좌이체)를 이용</span>하시기 바랍니다. <span class="enter">※부분환불/결제
													월이 지난 경우, 계좌로 환불됩니다.</span>
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="payment-subContent">
								<div class="order-agree">
									<h2 class="payment-title">주문자 동의</h2>
									<div class="all_agree">
										<input type="checkbox" id="all_check" /> <label
											for="all_check"><span class="explain">전체 동의</span></label>
									</div>
								</div>
								<div class="agree">
									<div class="order-consent">
										<input type="checkbox" name="buyer_agree" id="privacy-agree"
											value="privacyCheck" /> <label for="privacy-agree">개인정보
											제3자 제공 동의(필수)</label>
									</div>
									<div class="order-consent-desc">
										<p class="explain">
											배송 등 거래를 위한 판매자에게 개인정보가 공유됩니다. <span class="detail">자세히</span>
										</p>
										<p class="explain detail-desc hide">이웃#의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, 이웃#은 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.
										<span class="enter">1. 이웃#은 귀하께서 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.</span>
										<span class="enter">2. 개인정보를 공유받는자 :<span class="bold">판매자</span></span>
										<span class="enter">3. 공유하는 개인정보 항목</span>
										<span class="enter">- 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보</span>
										<span class="enter">- 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소</span>
										<span class="enter">4. 개인정보를 공유받는 자의 이용 목적 : <span class="bold">판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등</span></span>
										<span class="enter">5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : <span class="bold">개인정보 수집 및 이용 목적 달성 시까지 보관합니다.</span></span>
										<span class="enter">6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.</span></p>
									</div>
									<div class="order-conset">
										<input type="checkbox" name="buyer_agree" id="purchase-agree"
											value="purchaseCheck" /> <label for="purchase-agree">위
											상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.(필수)</label>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 결제 정보 end -->

					<div class="col-xs-12" id="order__submit">
						<div id="order__submit--payment">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<button type="button" id="submitBtn">상품 결제하기</button>
							<button type="button" id="cancleBtn"
								onclick="javascript:location.href='Index.in'">결제 취소하기</button>
						</div>
					</div>

				</form>

				<!-- 상품 결제 버튼 end -->

			</div>
		</div>
	</main>


	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/Order/order_sheet.js?after'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>