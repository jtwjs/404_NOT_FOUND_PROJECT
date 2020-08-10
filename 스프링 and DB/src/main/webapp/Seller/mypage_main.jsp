<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Seller/mypage_template.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Seller/mypage_main.css?after'/>"
	rel="stylesheet" />
<title>판매자 페이지</title>
</head>
<body>
	<section id="sub-main" class="mypage">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="SellerMyPage.se"> <span>마이페이지</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<section id="content">
						<jsp:include page="mypage_template.jsp" flush="false" />

						<section id="myPage">
							<h2 class="content-title">My Page</h2>
							<article id="seller__info">
								<div class="mypage__starRating">
									<div class="overall-rating">
										<h2>판매자 평점</h2>
										<dl class="rating">
											<dt>
												<span class="enter">종합평점</span>
											</dt>
											<dd>
												<img id="star-rating" src="${avgStarImgSrc}"
													alt="start rating">
											</dd>
											<dd class="rating-score">
												<strong class="grade">${avg_satis}</strong>/5
											</dd>
											<dd id="rating-explain">* 해당 평점은 지금까지 판매된 품목에 대한 총
												평점입니다.</dd>
										</dl>
									</div>
									<div class="detail-rating">
										<ul class="detail-rating--list">
											<li class="detail-rating--item">
												<h2>상품만족</h2> <c:choose>
												
												

													<c:when test="${product_satis >= 3.5}">
														<div class="rating-grade excellent">
															<p>
																<strong><fmt:formatNumber value="${product_satis}" maxFractionDigits="1"/></strong> <span class="enter">우수</span>
															</p>
														</div>
													</c:when>
													<c:when test="${product_satis >= 2.5}">
														<div class="rating-grade warring">
															<p>
																<strong><fmt:formatNumber value="${product_satis}" maxFractionDigits="1"/></strong> <span class="enter">주의</span>
															</p>
														</div>
													</c:when>
													<c:otherwise>
														<div class="rating-grade bad">
															<p>
																<strong><fmt:formatNumber value="${product_satis}" maxFractionDigits="1"/></strong> <span class="enter">나쁨</span>
															</p>
														</div>
													</c:otherwise>
												</c:choose>
											</li>
											<li class="detail-rating--item">
												<h2>배송속도</h2> <c:choose>
													<c:when test="${delivery_satis >= 3.5}">
														<div class="rating-grade excellent">
															<p>
																<strong><fmt:formatNumber value="${delivery_satis}" maxFractionDigits="1"/></strong> <span class="enter">우수</span>
															</p>
														</div>
													</c:when>
													<c:when test="${delivery_satis >= 2.5}">
														<div class="rating-grade warring">
															<p>
																<strong><fmt:formatNumber value="${delivery_satis}" maxFractionDigits="1"/></strong> <span class="enter">주의</span>
															</p>
														</div>
													</c:when>
													<c:otherwise>
														<div class="rating-grade bad">
															<p>
																<strong><fmt:formatNumber value="${delivery_satis}" maxFractionDigits="1"/></strong> <span class="enter">나쁨</span>
															</p>
														</div>
													</c:otherwise>
												</c:choose>
											</li>
											<li class="detail-rating--item">
												<h2>문의응대</h2> <c:choose>
													<c:when test="${avgAnswer > 3.5 }">
														<div class="rating-grade excellent">
															<p>
																<strong>${avgAnswer}</strong> <span class="enter">우수</span>
															</p>
														</div>
													</c:when>
													<c:when test="${avgAnswer > 2.5 }">
														<div class="rating-grade warring">
															<p>
																<strong>${avgAnswer}</strong> <span class="enter">주의</span>
															</p>
														</div>
													</c:when>
													<c:otherwise>
														<div class="rating-grade bad">
															<p>
																<strong>${avgAnswer}</strong> <span class="enter">나쁨</span>
															</p>
														</div>
													</c:otherwise>
												</c:choose>
											</li>
										</ul>
									</div>
								</div>
								<div class="mypage__subInfo">

									<div class="settlement-amount">
										<h2>오늘정산</h2>
										<dl>
											<dt>정산대상금액</dt>
											<dd>
												<span id="amount" class="item">${todayAmount}</span> 원
											</dd>
										</dl>
									</div>
									<div class="additional-info">
										<dl>
											<dt class="info-regProduct">등록된상품</dt>
											<dd class="item">${countArray[0]}</dd>
										</dl>
										<dl>
											<dt class="info-qna">미답변 Q&A</dt>
											<dd class="item">${countArray[1]}</dd>
										</dl>
										<dl>
											<dt class="info-reqDelivery">오늘발송요청</dt>
											<dd class="item">${countArray[2]}</dd>
										</dl>
										<dl>
											<dt class="info-sales">판매현황</dt>
											<dd class="item">${countArray[3]}</dd>
										</dl>
									</div>
								</div>

							</article>
							<article id="inquery">
								<div class="inquery__order-delivery">
									<div class="inquery--title">
										<h2>
											주문<span class="slash">/</span>발송조회
										</h2>
										<a class="view-all" href="#" title="전체보기">전체</a>
									</div>
									<div class="inquery--content">
										<ul class="inquery--list">
											<li class="inquery--list-item"><p>${orderHistoryCntArray[0]}<span
														class="enter">입금대기중</span>
												</p></li>
											<li class="inquery--list-item"><p>${orderHistoryCntArray[1]}<span
														class="enter">배송준비중</span>
												</p></li>
											<li class="inquery--list-item"><p>${orderHistoryCntArray[2]}<span
														class="enter">배송중</span>
												</p></li>
											<li class="inquery--list-item complete"><p>${orderHistoryCntArray[3]}<span
														class="enter">배송완료</span>
												</p></li>
										</ul>
									</div>
								</div>
								<div class="inquery__return-exchange">
									<div class="inquery--title">
										<h2>
											취소<span class="slash">/</span>교환<span class="slash">/</span>반품
											내역
										</h2>
										<a class="view-all" href="#" title="전체보기">전체</a>
									</div>
									<ul class="inquery--list">
										<li class="inquery--list-item"><p>${orderHistoryCntArray[4]}<span
													class="enter">취소신청</span>
											</p></li>
										<li class="inquery--list-item complete"><p>${orderHistoryCntArray[5]}<span
													class="enter">취소완료</span>
											</p></li>
										<li class="inquery--list-item"><p>${orderHistoryCntArray[6]}<span
													class="enter">환불신청</span>
											</p></li>
										<li class="inquery--list-item complete"><p>${orderHistoryCntArray[7]}<span
													class="enter">환불완료</span>
											</p></li>
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
											<th class="order-number">주문번호</th>
											<th class="product-name">상품명</th>
											<th class="order-amount">주문금액</th>
											<th class="order-date">주문일자</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${fn:length(orderList) == 0}">
										<tr>
											<td class="non-post" colspan="4">거래내역이 없습니다.</td>
										</tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:if>
									<c:forEach var="list" items="${orderList}"  end="5" varStatus="status">
										<tr>
											<td>${list.order_id}</td>
											<td>${list.board_title}</td>
											<td>${list.price}</td>
											<td>${fn:substring(list.order_date,0,11)}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</article>

						</section>
					</section>
				</div>
			</div>
		</div>
	</main>


	<script type="text/javascript"
		src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
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