<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="<c:url value='/resources/css/Common/sub_main.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Buyer/mypage_recentlyView.css'/>"
	rel="stylesheet" />
<title>최근 본 상품</title>
</head>
<body>
	<section id="sub-main" class="mypage">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
				<li><strong>최근 본 상품</strong></li>
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
							<h2 class="content-title">최근 본 상품</h2>
							<article id="content__view">
								<div id="content__view--box">
									<div>
										<span class="explain">- 최대 50개까지 조회 가능합니다.</span>
									</div>

									<div>
										<input type="button" value="삭제" id="view-delete" /> <input
											type="button" value="관심상품저장" id="view-wish" />
									</div>
								</div>
							</article>

							<article id="transaction__detail">
								<form
									action='<c:url value='/BuyerMyPageRecentlyView_Check.by' />'
									method="POST" id="recentView_form">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<table class="transaction__detail--table">
										<thead>
											<tr>
												<th class="product-check"><input id="all-check"
													type="checkbox" /></th>
												<th class="product-title">상품명</th>
												<th class="product-price">가격</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${fn:length(list) == 0}">
												<tr>
													<td class="non-post" colspan="3">최근 본 상품이 없습니다.</td>
												</tr>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</c:if>
											<c:forEach var="list" items="${list}" varStatus="status">
												<tr>
													<th class="product-check"><input type="checkbox"
														name="ck_item" value="${list.board_id}" /></th>
													<td class="product-name"><a
														href="BoardProductView.bo?board_id=${list.board_id}">
															<img class="product-img"
															src="display?path=${list.thumbnail_thum_path}&name=${list.thumbnail_thum}"
															alt="상품 썸네일 이미지" />
															<dl class="item-info">
																<dt>원산지: ${list.product_country} / 상품명:
																	${list.product_name}</dt>
																<dd>${list.title}</dd>
															</dl>
													</a></td>
													<td>${list.price}원</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<input type="hidden" id="separation" name="separation" />
								</form>
							</article>
							<div class="n-paging">
								<ul>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(pageMaker.startPage - 1)}"
											class="prev">이전</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<c:if test="${currentPage eq idx}">
											<li><a
												href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(idx)}"
												class="page active">${idx}</a></li>
										</c:if>
										<c:if test="${currentPage ne idx}">
											<li><a
												href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(idx)}"
												class="page">${idx}</a></li>
										</c:if>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
										<li><a
											href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(pageMaker.endPage + 1)}"
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
		src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_recentlyView.js?after'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js'/>"></script>
	<!-- footer,js end -->
</body>
</html>