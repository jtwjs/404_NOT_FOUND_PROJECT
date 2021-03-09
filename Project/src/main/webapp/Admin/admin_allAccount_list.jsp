<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.admin.AccountVO"%>

<%
	List<AccountVO> allAccountList = (List<AccountVO>) request.getAttribute("allAccountList");

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
	href="<c:url value='/resources/css/Admin/admin_allAccountList.css?after'/>"
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
								<div class="contnt__allAccountList">
									<div class="site_content">
										<h4 class="content-title--site" align="center">모든 회원 목록</h4>
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
										<div class="contnt_buyerlist">
											<div class="allAccountList_C">
												<font size=3>모든 회원 수 : ${listcount }</font>
											</div>
											<table class="setting_form">
												<thead>
													<tr class="account--cont">
														<th class="TH--NO">NO.</th>
														<th class="TH--id">아이디</th>
														<th class="TH--type">회원 구분</th>
														<th class="TH--info"></th>
													</tr>
												</thead>
												<tbody>
													<%
														if (allAccountList.size() == 0) {
													%>
													<tr>
														<td colspan="4"><br />
														<br /> 등록된 회원이 없습니다. <br /><br />
														<br /></td>
													</tr>
													<%
														}
													%>
													<%
														int num = listcount - ((nowpage - 1) * 10);
													for (int i = 0; i < allAccountList.size(); i++) {
														AccountVO allList = (AccountVO) allAccountList.get(i);
													%>
													<tr>
														<td class="TH--NO1"><%=num%></td>
														<td class="TH--id1"><%=allList.getId()%></td>
														<td class="TH--type1">
															<%
																if (allList.getMemberType().equals("ADMIN")) {
															%> 관리자 <%
																} else if(allList.getMemberType().equals("BUYER")) {
															%> 구매자 <%
																} else if(allList.getMemberType().equals("SELLER")) {
													 		%> 판매자 <%
															}
															%>
														</td>
														<td class="TH--info1">
															<%
																if (allList.getMemberType().equals("ADMIN")) {
															%> 
																관리자
															<%
																} else if(allList.getMemberType().equals("BUYER")) {	
															%> 
																	<button type="button" class="info-button"
																		onclick="javascript:location.href='AdminBuyerListView.ad?id=<%=(allList.getId())%>'">정보 보기</button>
															<%
																		
																} else if(allList.getMemberType().equals("SELLER")) {
													 		%> 
														 			<button type="button" class="info-button"
																		onclick="javascript:location.href='AdminSellerListView.ad?id=<%=(allList.getId())%>'">정보 보기</button>
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
														<td class="page" colspan=12
															style="font-family: Tahoma; font-size: 10pt;">
															<%
																if (nowpage <= 1) {
															%> [이전]&nbsp; <%
 	} else {
 %> <a href="./AdminAllAccountList.ad?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 	if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./AdminAllAccountList.ad?page=<%=a%>">[<%=a%>]
														</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./AdminAllAccountList.ad?page=<%=nowpage + 1%>">[다음]</a> <%
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

	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_menu.js?after'/>"></script>

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