<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/header.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/reset.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Seller/mypage_template.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Seller/mypage_calculateManager.css'/>"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
<title>정산관리</title>
</head>
<body>
	<section id="sub-main" class="mypage">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
				<li><strong>정산관리</strong></li>
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
							<h2 class="content-title">정산관리</h2>

							<div class="search-date">
								<div class="date-filter_wrap">
									<input type="radio" id="1week" value="1week" name="dateSelect"
										class="hide" /> <label for="1week" class="date_label"
										id="1week_label">1주일</label> <input type="radio" id="1month"
										value="1month" name="dateSelect" class="hide" /> <label
										for="1month" class="date_label" id="1month_label">1개월</label>
									<input type="radio" id="3month" value="3month"
										name="dateSelect" class="hide" /> <label for="3month"
										class="date_label" id="3month_label">3개월</label> <input
										type="radio" id="all_date" value="all_date" class="hide"
										checked /> <label for="all_date" class="date_label"
										id="all_label">전체 시기</label>
								</div>
								<div class="date-select_wrap">
									<input type="text" name="startDate" id="startDate"
										class="datePicker" readonly /> <img
										src="./resources/Images/Buyer/date_range_24px_rounded.png"
										id="start_calender" alt="달력이미지" /> <input type="text"
										name="endDate" id="endDate" class="datePicker" readonly /> <img
										src="./resources/Images/Buyer/date_range_24px_rounded.png"
										id="end_calender" alt="달력이미지" />

								</div>
								<div class="submitBtn_wrap">
									<button type="button" id="dateSubmit">조회</button>
								</div>
							</div>

							<article id="transaction__detail">

								<table class="transaction__detail--table">
									<thead>
										<tr>
											<th class="cal_date">정산일</th>
											<th class="cal_totOrder">총주문건수</th>
											<th class="cal_realOrder">총주문액</th>
											<th class="cal_completed">수수료</th>
											<th class="cal_netSales">정산금액</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(orderList) == 0 }">
											<tr>
												<td class="non-post" colspan="8">거래내역이 없습니다.</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
										<c:forEach var="list" items="${orderList}" varStatus="status">
											<tr>
												<td>${list.date_order_date}</td>
												<td>${list.date_order_id}</td>
												<td>${list.date_tot_price}</td>
												<td>${list.commission}</td>
												<td>${list.calculate}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</article>

							
							<div class="n-paging">
									<ul>
										<c:if test="${pageMaker.prev}">
											<li><a
												href="SellerCalculateManager.se${pageMaker.makeQuery(pageMaker.startPage - 1,startDate,endDate)}"
												class="prev">이전</a></li>
										</c:if>

										<c:forEach begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}" var="idx">
											<c:if test="${currentPage eq idx}">
												<li><a
													href="SellerCalculateManager.se${pageMaker.makeQuery(idx,startDate,endDate)}"
													class="page active">${idx}</a></li>
											</c:if>
											<c:if test="${currentPage ne idx}">
												<li><a
													href="SellerCalculateManager.se${pageMaker.makeQuery(idx,startDate,endDate)}"
													class="page">${idx}</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
											<li><a
												href="SellerCalculateManager.se${pageMaker.makeQuery(pageMaker.endPage + 1,startDate,endDate)}"
												class="next">다음</a></li>
										</c:if>
									</ul>
								</div>
							
							<article id="Glossary">
								<div>
									<p>
										- 총주문 : 주문일 기준으로 주문액 합계가 표시됨<br />
										- 입금 전 취소 : 현금 관련 주문의 경우 취소일 기준으로 입금전 취소액 합계가 표시됨<br />
										- 실결제주문 : 결제 체크 된 날을 기준으로 결제된 주문액 합계가 표시됨<br />
										- 배송 전 취소 : 취소일 기준으로 배송 전 취소액의 합계가 표시됨<br />
										- 배송 완료 : 배송 완료 체크된 날을 기준으로 매출로 인식됨<br />
										- 취소반품(환불) : 배송 완료 후 취소된 주문액을 취소일 기준으로 표시함<br />
										- 순매출 : 배송완료에서 취소/반품(환불)을 차감한 순수한 매출액임 
									</p>
								</div>
							</article>


						</section>

					</section>
				</div>
			</div>
		</div>

	</main>


	<script type="text/javascript"
		src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Seller/date_search.js'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
	<!--  date-picker -->
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"></script>
</body>
</html>