<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
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
	href="<c:url value='/resources/css/Admin/admin_accountManagement_main.css?after'/>"
	rel="stylesheet" />
	

<title>관리자페이지</title>
</head>
<body onload="setWindow();">
	<section id="sub-main" class="">
		<div class="sub-top">
			<h2 class="sub-title">회원관리페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>회원관리페이지</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="AccountManagement.ad"> <span>회원관리페이지</span>
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
							<h2 class="content-title">회원 현황</h2>
							
							<article id="order__chart">
                                <div style="display: inline-block;">
                                    <canvas id="join-data__chart" width="300px" height="300px"></canvas>
                                </div>
                                
                                <div style="display: inline-block;">
                                   <canvas id="regist-data__chart" width="300px" height="300px"></canvas> 
                                </div>    
                                
                                <div style="display: inline-block;">
                                    <canvas id="member-data__chart" width="300px" height="300px"></canvas>
                                </div>
                            
                            </article>
							
							<article id="account__info">
								<div class="buyer__info">
									<div onclick="javascript:location.href='AdminBuyerList.ad'">
										<h2 class="info--title">구매자 회원</h2>
										<ul class="info">
											<li><span class="account_count" >회원 수</span></li>
											<li class="account-counting">
												<h2 id="account">
													<c:choose>
														<c:when test="${buyerAccountCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${buyerAccountCount }
														</c:otherwise>
													</c:choose>	
												</h2>
											</li>
											<li>
												<a class="account_info-connect" href="AdminBuyerList.ad">회원 현황 보기</a>
											</li>											
										</ul>
									</div>
								</div>

								<div class="seller__info">
									<div onclick="javascript:location.href='AdminSellerList.ad'">
										<h2 class="info--title">판매자 회원</h2>
										<ul class="info">
											<li><span class="account_count">회원 수</span></li>
											<li class="account-counting">
												<h2 id="account">
													<c:choose>
														<c:when test="${serllerAccoutCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${serllerAccoutCount }
														</c:otherwise>
													</c:choose>	
												</h2>
											</li>
											<li>
												<a class="account_info-connect" href="AdminSellerList.ad">회원 현황 보기</a>
											</li>											
										</ul>
									</div>
								</div>
								
								<div class="disabledBuyer__info">
									<div onclick="javascript:location.href='AdminBuyerDelflagList.ad'">
										<h2 class="info--title">비활성화 회원 <br /> (구매자)</h2>
										<ul class="info">
											<li><span class="account_count">회원 수</span></li>
											<li class="account-counting">
												<h2 id="account">
													<c:choose>
														<c:when test="${buyerDelFlagAccountCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${buyerDelFlagAccountCount }
														</c:otherwise>
													</c:choose>	
												</h2>
											</li>
											<li>
												<a class="account_info-connect" href="AdminBuyerDelflagList.ad">회원  현황 보기</a>
											</li>										
										</ul>
									</div>
								</div>
								
								<div class="disabledSeller__info">
									<div onclick="javascript:location.href='AdminSellerDelflagList.ad'">
										<h2 class="info--title">비활성화 회원<br/> (판매자)</h2>
										<ul class="info">
											<li><span class="account_count">회원 수</span></li>
											<li class="account-counting">
												<h2 id="account">
													<c:choose>
														<c:when test="${sellerDelFlagAccountCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${sellerDelFlagAccountCount }
														</c:otherwise>
													</c:choose>													
												</h2>
											</li>
											<li>
												<a class="account_info-connect" href="AdminSellerDelflagList.ad">회원 현황 보기</a>
											</li>											
										</ul>
									</div>
								</div>	
								
								<div class="allAccount__info">
									<div onclick="javascript:location.href='AdminAllAccountList.ad'">
										<h2 class="info--title">모든 회원</h2>
										<ul class="info">
											<li><span class="account_count">총 회원 수</span></li>
											<li class="account-counting">
												<h2 id="account">
													<c:choose>
														<c:when test="${allAccountCount eq 0}" >
															0
														</c:when>
														<c:otherwise>
															${allAccountCount }
														</c:otherwise>
													</c:choose>													
												</h2>
											</li>	
											<li>
												<a class="account_info-connect" href="AdminAllAccountList.ad">회원 현황 보기</a>
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
	
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_accountManagement_main.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_menu.js?after'/>"></script>
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