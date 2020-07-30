<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.boardproduct.BoardProductVO"%>

<%
	List<BoardProductVO> AdminBoardlist = (List<BoardProductVO>) request.getAttribute("AdminBoardlist");

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
	href="<c:url value='/resources/css/Admin/admin_productList.css?after'/>"
	rel="stylesheet" />
<title>게시물 관리</title>
</head>
<body>
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
						<jsp:include page="admin_template.jsp" flush="false" />
						<section id="myPage">
							<div class="contnt__boardproductlist">
								<h4 class="content-title--site" align="center">게시글 목록</h4>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="contnt_boardproductlist">
									<div class="boardproduct_B">
										<font size=3>판매 게시글 수 : ${listcount }</font>
									</div>
									<table class="setting_form">
										<thead>
											<tr class="BoardProductlist--cont">
												<th class="TH--B--num">NO.</th>
												<th class="TH--B-thumbnail_origin">이미지</th>
												<th class="TH--B-sellerid">판매자</th>
												<th class="TH--B-title">게시글 제목</th>
												<th class="TH--B-register_date">게시판 등록일</th>
												<th class="TH--B-hit">판매수</th>
												<th class="TH--B-del">삭제</th>
											</tr>
										</thead>
										<tbody>
										<%
											if(AdminBoardlist.size() == 0) {
									    %>
										<tr>
											<td colspan="7">
												<br /><br />
												등록된 게시물이 없습니다.
												<br /><br /><br />
											</td>
										</tr>
										<%} %>
											<%
												int num = listcount - ((nowpage - 1) * 10);
											for (int i = 0; i < AdminBoardlist.size(); i++) {
												BoardProductVO Abl = (BoardProductVO) AdminBoardlist.get(i);
											%>
											<tr>
												<td class="TH--B--num1"><%=num%></td>
												<td class="TH--B-thumbnail_origin1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abl.getBoard_id()%>'"><img
													src="display?path=<%=java.net.URLEncoder.encode(Abl.getThumbnail_thum_path(), "UTF-8")%>&name=<%=java.net.URLEncoder.encode(Abl.getThumbnail_thum(), "UTF-8")%>"
													style="width: auto; height: 80px;">
												<td class="TH--B-sellerid1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abl.getBoard_id()%>'"><%=Abl.getSeller_id()%></td>
												<td class="TH--B-title1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abl.getBoard_id()%>'"><%=Abl.getTitle()%></td>
												<td class="TH--B-register_date1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abl.getBoard_id()%>'">
												<fmt:formatDate	pattern="YYyy-MM-dd" value="<%=Abl.getRegister_date()%>" /></td>
												<td class="TH--B-hit1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abl.getBoard_id()%>'"><%=Abl.getHit()%></td>
												<td class="del_BoardList">
													<button type="button" class="deleteBtn" id="deleteBtn"
														onclick="location.href='AdminBoardProductListDelete.ad?board_num=<%=Abl.getBoard_num()%>'">삭제</button>
												</td>
											</tr>

											<%
												num--;
											}
											%>
											<tr align=center height=20>
												<td class="ABoardProduct_page" colspan=12
													style="font-family: Tahoma; font-size: 10pt;">
													<%
														if (nowpage <= 1) {
													%> [이전]&nbsp; <%
 	} else {
 %> <a href="./AdminBoardProductList.ad?page=<%=nowpage - 1%>">[이전]</a>&nbsp;
													<%
														}
													%> <%
 	for (int a = startpage; a <= endpage; a++) {
 	if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./AdminBoardProductList.ad?page=<%=a%>">[<%=a%>]
												</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./AdminBoardProductList.ad?page=<%=nowpage + 1%>">[다음]</a>
													<%
														}
													%>
												</td>
											</tr>
										</tbody>
									</table>
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