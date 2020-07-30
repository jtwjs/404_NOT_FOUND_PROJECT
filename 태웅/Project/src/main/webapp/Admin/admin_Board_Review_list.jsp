<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.boardproduct.BoardReviewVO"%>

<%
	List<BoardReviewVO> AdminBoardReviewlist = (List<BoardReviewVO>) request.getAttribute("AdminBoardReviewlist");

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
	href="<c:url value='/resources/css/Admin/admin_Board_Review_list.css?after'/>"
	rel="stylesheet" />
<title>게시판 관리</title>
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
							<div class="contnt__boardreviewlist">
								<h4 class="content-title--site" align="center">댓글 목록</h4>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="contnt_boardreviewlist">
									<div class="boardreview_B">
										<font size=3>판매 게시글 수 : ${listcount }</font>
									</div>
									<table class="setting_form">
										<thead>
											<tr class="boardreviewlist--cont">
												<th class="TH--BR--num">NO.</th>
												<th class="TH--BR-reviewimgname">이미지</th>
												<th class="TH--BR-buyerid">구매자 아이디</th>
												<th class="TH--BR-title">판매글 제목</th>
												<th class="TH--BR-content">글내용</th>
												<th class="TH--BR-registerdate">작성일</th>
												<th class="TH--BR-del">삭제</th>
											</tr>
										</thead>
										<tbody>
										<%
											if(AdminBoardReviewlist.size() == 0) {
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
											for (int i = 0; i < AdminBoardReviewlist.size(); i++) {
												BoardReviewVO Abr = (BoardReviewVO) AdminBoardReviewlist.get(i);
											%>
											<tr >
												<td class="TH--BR--num1"><%=num%></td>
												<td class="TH--BR-reviewimgname1"><img
													src="display?path=<%=java.net.URLEncoder.encode(Abr.getReview_img_path(), "UTF-8")%>&name=<%=java.net.URLEncoder.encode(Abr.getReview_img_name(), "UTF-8")%>"
													style="width: auto; height: 80px;">
												<td class="TH--BR-buyerid1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abr.getBoard_id()%>'"><%=Abr.getBuyer_id()%></td>
												<td class="TH--BR-title1" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=Abr.getBoard_id()%>'"><%=Abr.getTitle()%></td>
												<td class="TH--BR-content1" >
													<p id="TH--BR-content1">
														<%=Abr.getContent()%>
													</p>
												</td>
												<td class="TH--BR-register_date1"><fmt:formatDate
														pattern="YYyy-MM-dd" value="<%=Abr.getRegister_date()%>" /></td>
												<td class="del_BoardReviewList">
													<button type="button" class="deleteBtn" id="deleteBtn" onclick="location.href='AdminBoardReviewListDelete.ad?review_num=<%=Abr.getReview_num()%>'">삭제</button>
												</td>
											</tr>

											<%
												num--;
											}
											%>
											<tr align=center height=20>
												<td class="ABoardReview_page" colspan=12
													style="font-family: Tahoma; font-size: 10pt;">
													<%
														if (nowpage <= 1) {
													%> [이전]&nbsp; <%
													 	} else {
													 %> <a
													href="./AdminBoardReviewList.ad?page=<%=nowpage - 1%>">[이전]</a>&nbsp;
													<%
														}
													%> <%
													 	for (int a = startpage; a <= endpage; a++) {
													 	if (a == nowpage) {
													 %> [<%=a%>] <%
													 	} else {
													 %> <a href="./AdminBoardReviewList.ad?page=<%=a%>">[<%=a%>]
																									</a> &nbsp; <%
													 	}
													 %> <%
													 	}
													 %> <%
													 	if (nowpage >= maxpage) {
													 %> [다음] <%
													 	} else {
													 %> <a
													href="./AdminBoardReviewList.ad?page=<%=nowpage + 1%>">[다음]</a>
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
	<script type="text/javascript"
		src="<c:url value='/resources/js/Admin/admin_menu.js?after'/>"></script>
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