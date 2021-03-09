<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%
	SimpleDateFormat format_time = new SimpleDateFormat("yyyy-MM-dd");
String today = format_time.format(Calendar.getInstance().getTime());
%>
<!DOCTYPE html>
<html>
<head>
<!-- header, css -->
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/header.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/reset.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Buyer/mypage_productQna.css?after'/>"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	rel="stylesheet" />
<title>상품문의</title>
</head>
<body>
	<section id="sub-main" class="mypage">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
				<li><strong>상품문의</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="BuyerMyPage.by"> <span>마이페이지</span>
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
							<h2 class="content-title">상품문의</h2>

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
											<th class="qna-item_info">상품정보</th>
											<th class="qna-content">내용</th>
											<th class="qna-type">문의유형</th>
											<th class="qna-regDate">작성일</th>
											<th class="qna-status">처리상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(qnaList) == 0}">
											<tr>
												<td class="non-post" colspan="5">등록한 문의내용이 없습니다.</td>
											</tr>

											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
										<c:forEach var="list" items="${qnaList}" varStatus="status">
											<tr class="qna">
												<td class="item_info"
													onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'">
													<img
													src="display?path=${list.thumbnail_thum_path}&name=${list.thumbnail_thum}"
													alt="상품 이미지">

													<p>${list.board_title}</p>
												</td>
												<td class="qna_info"
													onclick="active(this, '${status.index}');">${list.title }</td>
												<td>${list.str_qna_status }</td>
												<td><fmt:formatDate value="${list.register_date}"
														pattern="yyyy.MM.dd" /></td>
												<c:if test="${list.process_status eq '답변예정' }">
													<td class="expected">${list.process_status}</td>
												</c:if>
												<c:if test="${list.process_status eq '답변완료' }">
													<td class="complete">${list.process_status}</td>
												</c:if>
											</tr>
											<tr class="qna_desc">
												<td></td>
												<td>${list.content}</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<c:if test="${list.answer_status eq 1 }">
												<tr class="qna_answer index-${status.index}">
													<td class="seller">판매자(${list.seller_id})</td>
													<td>${list.recommend}</td>
													<td></td>
													<td><fmt:formatDate value="${list.recommend_date}"
															pattern="yyyy.MM.dd" /></td>
													<td></td>
												</tr>
											</c:if>
											<c:if test="${list.answer_status eq 0 }">
												<tr class="qna_answer">
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</article>
							<div class="n-paging">
								<ul>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="BuyerMyPageReview.by${pageMaker.makeQuery(pageMaker.startPage - 1,startDate,endDate)}"
											class="prev">이전</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<c:if test="${currentPage eq idx}">
											<li><a
												href="BuyerMyPageReview.by${pageMaker.makeQuery(idx,startDate,endDate)}"
												class="page active">${idx}</a></li>
										</c:if>
										<c:if test="${currentPage ne idx}">
											<li><a
												href="BuyerMyPageReview.by${pageMaker.makeQuery(idx,startDate,endDate)}"
												class="page">${idx}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
										<li><a
											href="BuyerMyPageReview.by${pageMaker.makeQuery(pageMaker.endPage + 1,startDate,endDate)}"
											class="next">다음</a></li>
									</c:if>
								</ul>
							</div>
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_productQna.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/date_search.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js'/>"></script>
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