<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.buyer.BuyerVO"%>


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
	href="<c:url value='/resources/css/Admin/admin_buyerlist_view.css?after'/>"
	rel="stylesheet" />
<title>회원 관리</title>
</head>
<body onload="setWindow();">
<script>
function setWindow(){
	window.scrollTo(0, 380);
}
</script>
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
							<div class="contnt__buyerlist">
								<div class="site_content">
									<h4 class="content-title--site">구매자 회원 정보</h4>
									<form name="update__form--buyerlist"
										id="update__form--buyerlist" action="AdminUpdateBuyerList.ad"
										method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="contnt_buyerlist">
											<div class="buyer_B">
												<span class="buyer_B1">${buyerlist.id}님의 회원정보입니다.</span>
											</div>
											<table class="setting_form">
												<tr class="buyerlist_Tr">
													<td class="TH--profileImg">구매자 프로필 사진</td>
													<td class="TH--profileImg1"><img src="display?path=${buyerlist.profileImgPath}&name=${buyerlist.profileImg}" alt="profile" style="width: auto; height: 100px;"/></td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--id">아이디</td>
													<td class="TH--id1"><input type="hidden"
														class="buyer_list_id" name="id" value="${buyerlist.id}" />${buyerlist.id}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--name">이름</td>
													<td class="TH--name1"><input type="hidden"
														class="buyer_list_name" name="name"
														value="${buyerlist.name}" />${buyerlist.name}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--tel">전화번호</td>
													<td class="TH--tel1"><input type="hidden"
														class="buyer_list_tel" name="tel" value="${buyerlist.tel}" />${buyerlist.tel}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--email">이메일</td>
													<td class="TH--email1"><input type="hidden"
														class="buyer_list_email" name="email"
														value="${buyerlist.email}" />${buyerlist.email}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--address">주소</td>
													<td class="TH--address1"><input type="hidden"
														class="buyer_list_address" name="address"
														value="${buyerlist.address}" />${buyerlist.address}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--joindate">회원가입일</td>
													<td class="TH--joindate1"><input type="hidden"
														class="buyer_list_joinDate" name="joinDate"
														value="${buyerlist.joinDate}" />${buyerlist.joinDate}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--membertype">회원타입</td>
													<td class="TH--membertype1"><input type="hidden"
														class="buyer_list_memberType" name="memberType"
														value="${buyerlist.memberType}" />${buyerlist.memberType}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--buyernum">구매자 등록번호</td>
													<td class="TH--buyernum1"><input type="hidden"
														class="buyer_list_buyerNum" name="buyerNum"
														value="${buyerlist.buyerNum}" />${buyerlist.buyerNum}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH-grade">구매자등급</td>
													<td class="TH-grade1"><input type="hidden"
														class="buyer_list_grade" name="grade"
														value="${buyerlist.grade}" />${buyerlist.grade}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH-logindate">마지막 접속</td>
													<td class="TH-logindate1"><input type="hidden"
														class="buyer_list_loginDate" name="loginDate"
														value="${buyerlist.loginDate}" />${buyerlist.loginDate}</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH--delFlag">비활성여부</td>
													<td class="TH--delFlag1"><input type="hidden"
														class="buyer_list_delFlag" name="delFlag1"
														value="${buyerlist.delFlag}">${buyerlist.delFlag}								
													</td>
												</tr>
												<tr class="buyerlist_Tr">
													<td class="TH-delFlag2">비활성설정</td>
													<td><input type="radio" id="delFlag"
														class="delFlag_checkbox_B" name="delFlag" value="Y"
														checked="checked" /> 비활성 <input type="radio"
														id="delFlag" class="delFlag_checkbox_B1" name="delFlag"
														value="N" /> 활성</td>
												</tr>
											</table>
											<div class="buyerlist_btn">
												<button type="button" class="buyerlist_modify"
													id="submitBtn">수정</button>
												<button type="button" class="buyerlist_main"
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
		src="<c:url value='/resources/js/Admin/admin_buyerlist_modify.js?after'/>"></script>
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>