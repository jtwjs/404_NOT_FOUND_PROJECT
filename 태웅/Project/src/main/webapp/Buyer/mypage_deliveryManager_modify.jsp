<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.buyer.deliveryVO"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/reset.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/header.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css?after'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link
	href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Buyer/mypage_deliveryManager.css?after'/>"
	rel="stylesheet" />
<title>배송지 관리</title>
</head>
<body>
	<section id="sub-main" class="mypage">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
				<li><strong>배송지 관리</strong></li>
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
							<h2 class="content-title">배송지 수정</h2>
							<form name="update__form--listdelivery"
								id="update__form--listdelivery" action="ListDeliveryModfy.by"
								method="post">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="contnt__deliveryrwrite">
									<div class="site_content1">
										<h4 class="content-title--site">나의 배송지수정</h4>
										<span class="content-pp">자주 쓰는 배송지를 수정 하실 수 있습니다.</span>
									</div>

									<div class="site_content2">
										<table class="settingwrite_forms">
											<thead class="setting_form--write">

												<tr>
												<tr>
													<td><input type="hidden" class="delivery_list_id"
														name="id" value="${id }" /></td>
												</tr>
												<tr>
													<td><input type="hidden" class="delivery_list_num"
														name="num" value="${num }" /></td>
												</tr>
												<tr>
													<td class="form_tD">배송지명</td>
													<td><input type="text"
														class="delivery_list_deliveryName" name="deliveryName"
														value="${deliveryName }" /></td>
												</tr>
												<tr>
													<td class="form_tD">주소</td>
													<td><input type="text" id="sample4_postcode"
														class="inputAddrNum" name="addrNum" placeholder="우편번호"
														value="${addrNum }">
														<button type="button" class="addrNumBtn"
															onclick="sample4_execDaumPostcode()">우편번호찾기</button> <input
														type="text" id="sample4_roadAddress" class="inputAddr1"
														id="sample4_roadAddress" placeholder="도로명주소"
														name="addrRoadName" value="${addrRoadName }"> <span
														id="guide" style="color: #999; display: none"></span> <input
														type="text" class="inputAddr2" id="sample4_detailAddress"
														name="addrDetail" placeholder="상세주소"
														value="${addrDetail }"> <script
															src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
													</td>
												</tr>
												<tr>
													<td class="form_tD">수령인</td>
													<td><input type="text"
														class="delivery_list_receiverName" name="receiverName"
														value="${receiverName }" /></td>
												</tr>
												<tr class="update_tel">
													<td><label for="mPhone1" class="form_tD">연락처</label></td>
													<td><select id="mPhone1" name="telCarrierNum">
															<option value="${telCarrierNum }">${telCarrierNum }</option>
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
													</select> <input type="text" id="mPhone2" name="telAllocationNum"
														size="4" maxlength="4" value="${telAllocationNum }"
														required /> <input type="text" id="mPhone3"
														name="telDiscretionaryNum" size="4" maxlength="4"
														value="${telDiscretionaryNum }" required /></td>
												</tr>
												<tr>
													<td class="form_tD">기본 배송지</td>
													<td><input type="radio" id="defaultaddress"
														class="defaultaddress" name="defaultaddress" value="Y" />기본
														배송지 설정 <input type=radio id="defaultaddress"
														name="defaultaddress" value="N" checked="checked" />미설정</td>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</form>
							<div class="delivery_btn">
								<button type="button" class="listdelivery_modify" id="submitBtn">수정</button>
								<input type="reset" class="listdelivery_warning" value="다시작성"
									onclick="location.href='ListDeliveryModifyForm.by'">
								<button type="button" class="listdelivery_main"
									onclick="location.href='BuyerMyPageDeliveryManager.by'">뒤로</button>
							</div>
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>




	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_listdelivery_modify.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>