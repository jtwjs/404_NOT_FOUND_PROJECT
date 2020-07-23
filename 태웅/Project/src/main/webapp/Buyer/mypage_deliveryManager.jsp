<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.buyer.deliveryVO"%>

<%
	System.out.println("h1");
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
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
	<section id="sub-main" class="">
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
							<form name="update__form--listdelivery"
								id="update__listdelivery--form"
								action="listdeliverymodifyform.by" method="post">
								
								<div class="contnt__delivery">
									<div class="site_content1">
										<h4 class="content-title--site">나의 배송지 목록</h4>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div>
									<table class="setting_form">
										<tr class="delivery--cont">
											<th class="TH--nick">배송지명</th>
											<th class="TH--name">수령인</th>
											<th class="TH--add">주소</th>
											<th class="TH-tel">연락처</th>

										</tr>
										<tr class="delivery--cont--f">
											<td><input type="hidden" class="delivery_list_num1"
												name="num" value="${deliveryY.num }" /></td>
										</tr>

										<tr class="delivery--cont--f1">
											<td class="setting_list"><img src="./resources/Images/Buyer/defaultaddress.JPG" class="defaultaddress--img">
												 <input type="text"	name="delivery_list_deliveryName1" class="member_delivery_deliveryName1"
												value="${deliveryY.deliveryName }" readonly /></td>
											<td class="setting_list"><input type="text"
												name="delivery_list_receiverName1"
												class="member_delivery_reciverName1"
												value="${deliveryY.receiverName}" readonly /></td>
											<c:set var="address" value="${deliveryY.address}" />
											<c:set var="addrIndex" value="${fn:indexOf(address,'+')}" />
											<c:set var="addrLength" value="${fn:length(address)}" />
											<td class="setting_list"><input type="text"
												name="delivery_list_address1"
												class="member_delivery_address1"
												value="${fn:substring(address,addrIndex+1,addrLength)}"
												readonly /></td>
											<td class="setting_list"><input type="text"
												name="delivery_list_phone1" class="member_delivery_phone1"
												value="${deliveryY.receiverPhone}" readonly /></td>

										</tr>
									</table>
								</div>

								<!-- <div class="contnt__delivery">
									<div class="site_content1">
										<h4 class="content-title--site">나의 배송지 목록</h4> -->
										<br />
										<br />
										<br />
										<span class="content-pp">자주 쓰는 배송지를 등록 및 관리 하실 수 있습니다.</span>
										<div class="delivery_Btn">
											<button type="button" id="deliveryBtn" class="deliveryBtn"
												onclick="location.href='ListDeliveryWriteForm.by'">배송지
												등록</button>
										</div>
									</div>

									<div class="site_content2">
										<table class="setting_form2">
											<thead class="setting_form--tabs2">
												<tr class="delivery--cont1" align=center>
													<th class="delivery--nick1">배송지명</th>
													<th class="delivery--name1">수령인</th>
													<th class="delivery--add1">주소</th>
													<th class="delivery--tel1">연락처</th>
													<th class="delivery--dd1">수정 /삭제</th>
												</tr>
											</thead>
											<tbody class="setting_form--tabs2">
												<c:forEach items="${list}" var="list">
													<tr>
														<td><input type="hidden" class="delivery_list_num"
															name="num" value="${list.num }" /></td>
													</tr>
													<tr>
														<td class="setting_list"><input type="text"
															name="delivery_list_deliveryName"
															class="member_delivery_deliveryName"
															value="${list.deliveryName}" readonly /></td>
														<td class="setting_list"><input type="text"
															name="delivery_list_receiverName"
															class="member_delivery_reciverName"
															value="${list.receiverName}" readonly /></td>
														<c:set var="address" value="${list.address}" />
														<c:set var="addrIndex" value="${fn:indexOf(address,'+')}" />
														<c:set var="addrLength" value="${fn:length(address)}" />
														<td class="setting_list"><input type="text"
															name="delivery_list_address"
															class="member_delivery_address"
															value="${fn:substring(address,addrIndex+1,addrLength)}"
															readonly /></td>
														<td class="setting_list"><input type="text"
															name="delivery_list_phone" class="member_delivery_phone"
															value="${list.receiverPhone}" readonly /></td>
														<td class="setting_list">
															<button type="button" class="modifyBtn" id="modifyBtn"
																onclick="location.href='ListDeliveryModifyForm.by?num=${list.num}'">수정</button>
															<button type="button" class="deleteBtn" id="deleteBtn"
																onclick="location.href='ListDeliveryDeleteDelete.by?num=${list.num}'">삭제</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</form>
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>


	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_listdelivery.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>