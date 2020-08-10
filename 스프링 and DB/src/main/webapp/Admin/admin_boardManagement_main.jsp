<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	href="<c:url value='/resources/css/Admin/admin_boardManagement_main.css?after'/>"
	rel="stylesheet" />
<title>관리자페이지</title>
</head>
<body onload="setWindow();">
<script>
function setWindow(){
	window.scrollTo(0, 380);
}
</script>
	<section id="sub-main" class="">
		<div class="sub-top">
			<h2 class="sub-title">게시물 관리페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>게시물 관리페이지</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="BoardManagement.ad"> <span>게시물 관리페이지</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<section id="content">
						<section id="myPage">
							<h2 class="content-title">게시물 현황</h2>
							
							<article id="board__info">
								
								
								<div class="default__info">
								</div>
								
								<div class="product__info">
									<div onclick="javascript:location.href='AdminBoardProductList.ad'">
										<h2 class="info--title">판매 게시물 현황</h2>
										<ul class="info">
											<li><span class="board_count" >게시글 수</span></li>
											<li class="board-counting">
												<h2 id="board">
													<c:choose>
														<c:when test="${productBoardCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${productBoardCount }
														</c:otherwise>
													</c:choose>
												</h2>
											</li>
											<li>
												<a class="board_info-connect" href="AdminBoardProductList.ad">게시글 현황 보기</a>
											</li>											
										</ul>
									</div>
								</div>

								<div class="review__info">
									<div onclick="javascript:location.href='AdminBoardReviewList.ad'">
										<h2 class="info--title">리뷰 현황</h2>
										<ul class="info">
											<li><span class="board_count">리뷰 수</span></li>
											<li class="board-counting">
												<h2 id="board">
													<c:choose>
														<c:when test="${reviewCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${reviewCount }
														</c:otherwise>
													</c:choose>
												</h2>
											</li>
											<li>
												<a class="board_info-connect" href="AdminBoardReviewList.ad">리뷰 현황 보기</a>
											</li>											
										</ul>
									</div>
								</div>		
								
							</article>					
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>

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