<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@page import="com.spring.seller.SellerVO"%>

<%
   List<SellerVO> SellerDelflaglist = (List<SellerVO>) request.getAttribute("SellerDelflaglist");

int listcount = ((Integer) request.getAttribute("listcount")).intValue();
int nowpage = ((Integer) request.getAttribute("page")).intValue();
int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
int startpage = ((Integer) request.getAttribute("startpage")).intValue();
int endpage = ((Integer) request.getAttribute("endpage")).intValue();
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
	href="<c:url value='/resources/css/Admin/admin_template.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/Admin/admin_seller_delflag_list.css?after'/>"
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
								<div class="contnt__Sellerdelflaglist">
									<div class="site_content">
										<h4 class="content-title--site" align="center">비활성 판매자 회원 목록</h4>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="contnt_Sellerdelflaglist">
											<div class="sellerdelflaglist_C">
												<font size=3>비활성 회원 수 : ${listcount }</font>
											</div>
											<table class="setting_form">
												<thead>
													<tr class="sellerdelflag--cont">
													<th class="TH--se-num">NO.</th>
													<th class="TH--se-name">아이디</th>
													<th class="TH--se-add">상호명</th>
													<th class="TH--se-tel">연락처</th>
													<th class="TH--se-joindate">가입일</th>
													<th class="TH--se-logindate">마지막 접속</th>
													<th class="TH-delflag">활성상태</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (SellerDelflaglist.size() == 0) {
													%>
													<tr>
														<td colspan="7"><br />
														<br /> 비활성화된 회원이 없습니다. <br /><br />
														<br /></td>
													</tr>
													<%
														}
													%>
													<%
														int num = listcount - ((nowpage - 1) * 10);
													for (int i = 0; i < SellerDelflaglist.size(); i++) {
														SellerVO SelDel = (SellerVO) SellerDelflaglist.get(i);
													%>
													<tr>
														<td class="TH--NO1"><%=num%></td>
														<td class="TH--id1"
															onclick="javascript:location.href='AdminSellerdelflagListView.ad?id=<%=SelDel.getId()%>'"><%=SelDel.getId()%></td>
														<td class="TH--name1"
															onclick="javascript:location.href='AdminSellerdelflagListView.ad?id=<%=SelDel.getId()%>'"><%=SelDel.getShopName()%></td>
														<td class="TH-tel1"><%=SelDel.getTel()%></td>
														<td class="TH-joindate1"><%=SelDel.getJoinDate()%></td>
														<td class="TH-logindate1"><%=SelDel.getLoginDate()%></td>
														<td class="TH-del_flag1">
															<% 
																if(SelDel.getDelFlag() == ('N')) {
															%>
																활성
															<%
																} else {
															%>
																비활성
															<%
															}															
															%>
														</td>
													</tr>
													<%
														num--;
													}
													%>
													<tr align=center height=20>
														<td class="sellerdelflaglist_page" colspan=12
															style="font-family: Tahoma; font-size: 10pt;">
															<%
																if (nowpage <= 1) {
															%> [이전]&nbsp; <%
															 	} else {
															 %> <a href="./AdminSellerDelflagList.ad?page=<%=nowpage - 1%>">[이전]</a>&nbsp;
																														<%
																															}
																														%> <%
															 	for (int a = startpage; a <= endpage; a++) {
															 	if (a == nowpage) {
															 %> [<%=a%>] <%
															 	} else {
															 %> <a href="./AdminSellerDelflagList.ad?page=<%=a%>">[<%=a%>]
																													</a> &nbsp; <%
															 	}
															 %> <%
															 	}
															 %> <%
															 	if (nowpage >= maxpage) {
															 %> [다음] <%
															 	} else {
															 %> <a href="./AdminSellerDelflagList.ad?page=<%=nowpage + 1%>">[다음]</a>
																														<%
																}
															%>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
						</section>
					</section>
				</div>
			</div>
		</div>
	</main>



	<!-- footer,js -->
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