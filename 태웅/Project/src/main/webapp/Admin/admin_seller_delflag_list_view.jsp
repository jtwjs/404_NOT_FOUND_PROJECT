<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.seller.SellerVO"%>


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
	href="<c:url value='/resources/css/Admin/admin_template.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Admin/admin_seller_delflaglist_view.css?after'/>"
	rel="stylesheet" />
<title>회원 관리</title>
</head>
<body>
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
						<jsp:include page="admin_template.jsp" flush="false" />
						<section id="myPage">
							<div class="contnt__Sellerdelflaglist">
								<div class="site_content">
									<h4 class="content-title--site">비활성 판매자 회원 정보</h4>
									<form name="update__form--sellerdelflaglist"
										id="update__form--sellerdelflaglist"
										action="AdminUpdateSellerdelflagList.ad" method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="contnt_sellerdelflaglist">
											<div class="Sellerdelflag_S">
												<span class="Sellerdelflag_S1"> ${sellerDelflaglist.shopName} 판매자님의
													회원정보입니다.</span>
											</div>
											<table class="setting_form">
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH--profileImg">판매자 프로필 사진</td>
													<td class="TH--profileImg1"><img src="display?path=${sellerDelflaglist.profileImgPath}&name=${sellerDelflaglist.profileImg}" alt="profile" style="width: auto; height: 200px;"/></td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<th class="TH--id">판매자 아이디</th>
													<td class="TH--id1"><input type="hidden"
														class="sellerdelflag_list_id" name="id"
														value="${sellerDelflaglist.id}" />${sellerDelflaglist.id}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<th class="TH--shopName">상호명</th>
													<td class="TH--shopName1"><input type="text"
														class="sellerdelflag_list_shopName" name="shopName"
														value="${sellerDelflaglist.shopName }" /></td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<th class="TH--orderReportNum">통신판매신고번호</th>
													<td class="TH--orderReportNum1"><input type="text"
														class="sellerdelflag_list_orderReportNum" name="orderReportNum"
														value="${sellerDelflaglist.orderReportNum }" /></td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<th class="TH--orderReportImg">통신판매신고증</th>
													<td class="TH--orderReportImg1">${sellerDelflaglist.orderReportImg }<label
														for="reportCard" class="reportCard-btn">통신판매신고증<span
															class="enter">첨부하기</span></label> <input type="file"
														id="reportCard" class="hide" accept=".gif, .jpg, .png"
														name="orderReportImg" required></td>
													<p id="mailOrd_check" class="check hide"></p>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-represent">대표자</td>
													<td class="TH-represent1"><input type="text"
														class="sellerdelflag_list_represent" name="represent"
														value="${sellerDelflaglist.represent }" /></td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-address">주소</td>
													<td class="TH-address1"><input type="text"
														id="sample4_postcode" class="inputAddrNum" name="addrNum"
														placeholder="우편번호" value="${addrNum }"><input
														type="text" id="sample4_roadAddress" class="inputAddr1"
														id="sample4_roadAddress" placeholder="도로명주소"
														name="addrRoadName" value="${addrRoadName }">
														<button type="button" class="addrNumBtn"
															onclick="sample4_execDaumPostcode()">우편번호찾기</button> <span
														id="guide" style="color: #999; display: none"></span> <input
														type="text" class="inputAddr2" id="sample4_detailAddress"
														name="addrDetail" placeholder="상세주소"
														value="${addrDetail }"> <script
															src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
													</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-name">담당자 이름</td>
													<td class="TH-name1"><input type="hidden"
														class="sellerdelflag_list_name" name="name"
														value="${sellerDelflaglist.name }">${sellerDelflaglist.name }</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-tel">담당자 연락처</td>
													<td class="TH-tel1"><input type="hidden"
														class="sellerdelflag_list_tel" name="tel"
														value="${sellerDelflaglist.tel}">${sellerDelflaglist.tel}</td>
												</tr>

												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-email">담당자 이메일</td>
													<td class="TH-email1"><input type="hidden"
														class="sellerdelflag_list_email" name="email"
														value="${sellerDelflaglist.email}">${sellerDelflaglist.email}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-bank_name">정산대금 은행명</td>
													<td class="TH-bank_name1"><input type="hidden"
														class="sellerdelflag_list_bankName" name="bankName"
														value="${sellerDelflaglist.bankName}">${sellerDelflaglist.bankName}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-bank_account ">정산대금 계좌번호</td>
													<td class="TH-bank_account1"><input type="hidden"
														class="sellerdelflag_list_bankAccountNum" name="bankAccountNum"
														value="${sellerDelflaglist.bankAccountNum}">${sellerDelflaglist.bankAccountNum}</td>
												</tr>
												<tr class="sellerlist_Tr">
													<td class="TH-seller_reg_num">판매자 등록번호</td>
													<td class="TH-seller_reg_num1"><input type="hidden"
														class="sellerdelflagr_list_sellerNum" name="sellerNum"
														value="${sellerDelflaglist.sellerNum}">${sellerDelflaglist.sellerNum}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-seller_grade">판매자 등급
													<td class="TH-seller_grade1"><input type="hidden"
														class="sellerdelflag_list_grade" name="grade"
														value="${sellerDelflaglist.grade}">${sellerDelflaglist.grade}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-member_type">멤버타입</td>
													<td class="TH-member_type1"><input type="hidden"
														class="sellerdelflag_list_memberType" name="memberType"
														value="${sellerDelflaglist.memberType}">${sellerDelflaglist.memberType}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-join_date">회원가입일</td>
													<td class="TH-join_date1"><input type="hidden"
														class="sellerdelflag_list_joinDate" name="joinDate"
														value="${sellerDelflaglist.joinDate}">${sellerDelflaglist.joinDate}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-loginDate">마지막접속</td>
													<td class="TH-loginDate1"><input type="hidden"
														class="sellerdelflag_list_loginDate" name="jologinDateinDate"
														value="${sellerDelflaglist.loginDate}">${sellerDelflaglist.loginDate}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-delFlag">비활성여부</td>
													<td class="TH-delFlag1"><input type="hidden"
														class="sellerdelflag_list_delFlag" name="delFlag1"
														value="${sellerDelflaglist.delFlag}">${sellerDelflaglist.delFlag}</td>
												</tr>
												<tr class="Sellerdelflaglist_Tr">
													<td class="TH-delFlag">비활성설정</td>
													<td class="TH-delFlag2" id="chck_A"><input
														type="radio" id="delFlag" class="SellerdelFlag_checkbox_B"
														name="delFlag" value="Y" checked="checked"/> 비활성 <input type="radio"
														id="delFlag" class="SellerdelFlag_checkbox_B1" name="delFlag"
														value="N"  /> 활성</td>
												</tr>
											</table>
											<div class="Sellerdelflaglist_btn">
												<button type="button" class="sellerdelflaglist_modify"
													id="submitBtn">수정</button>
												<button type="button" class="sellerdelflaglist_main"
													onclick="location.href='javascript:history.go(-1)'">뒤로</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>

	<!-- footer,js -->
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_menu.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_seller_delflag_list_modify.js?after'/>"></script>
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>">
		
	</script>
	<!-- footer,js end -->

</body>
</html>