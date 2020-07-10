<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.spring.service.BoardFaqVO"%>

<%

	/* String id=null;
	id = (String)session.getAttribute("id"); */

	List<BoardFaqVO> faqboardlist = (List<BoardFaqVO>) request.getAttribute("faqboardlist");

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
	href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board.css?after'/>"
	rel="stylesheet" />
<link
	href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board_faq.css?after'/>"
	rel="stylesheet" />

<title>자주하는질문</title>
</head>
<body>
	<section id="sub-main" class="serviceCenter">
		<div class="sub-top">
			<h2 class="sub-title">고객센터</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>고객센터</strong></li>
				<li><strong>FAQ</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="BoardNotice.sc"> <span>고객센터</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<section id="content">
						<aside id="side">
							<h2>고객센터</h2>
							<ul>
								<li><a href="#" onclick="location.href='BoardNotice.sc'">공지사항</a></li>
								<li><a href="#" class="selected-menu"
									onclick="location.href='BoardFaq.sc'">자주묻는질문</a></li>
							</ul>
						</aside>

						<article id="center-list">
							<h2 id="center-list__title">자주묻는질문</h2>
							<td align=right><font size=2>글 개수 : ${listcount }</font></td>
							<table id="center-list__table">
								<thead>
									<tr>
										<td class="center-list__table--num">번호</td>
										<td class="center-list__table--title" colspan="3">제목</td>
										<td></td>
										<td></td>

										<!-- 삭제해도 될꺼같은 테이블
										<td class="center-list__table--date">작성일</td>
										<td class="center-list__table--hit">조회</td>
										 -->
									</tr>
								</thead>
								<tbody>
									<%
										int num = listcount - ((nowpage - 1) * 10);
									for (int i = 0; i < faqboardlist.size(); i++) {
										BoardFaqVO bfl = (BoardFaqVO) faqboardlist.get(i);
									%>
									<tr>
										<td class="center-list__table--num"><%=num%></td>

										<td align="center" class="center-list__table--title" colspan="3"><a href="#first" name="trigger"><%=bfl.getTitle()%></a></td>
										<%-- <%if(faq_id!=null && faq_id.equals("admin")){%> --%>
										<td class="list__table--modify"><a href="./FaqBoardModifyform.sc?num=<%=bfl.getNum()%>">[수정]</a></td>
										<td class="list__table--delete"><a href="./FaqBoardDelete.sc?num=<%=bfl.getNum()%>">[삭제]</a></td>
										<%-- <%}%> --%>

									</tr>

									<tr name="article" class="hide">
										<td></td>
										<td><a name="first" id="first"></a>
											<p><%=bfl.getContent()%></p></td>
									</tr>
									<script>
										$("a[name='trigger']").click(
												function() {
													$("tr[name='article']")
															.hide();
													$(this).closest("tr")
															.next().show();
												});
									</script>
									<%
										num--;
									}
									%>


									<tr align=center height=20>
										<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
											<%
												if (nowpage<=1) {
											%> [이전]&nbsp; <%
												} else {
											%> <a href="./BoardFaq.sc?page=<%=nowpage-1%>">[이전]</a>&nbsp;
											<%
												}
											%> <%
												for (int a=startpage; a<=endpage; a++) {
												if (a==nowpage) {
											%> [<%=a%>] <%
												} else {
											%> <a href="./BoardFaq.sc?page=<%=a%>">[<%=a%>]
																				</a> &nbsp; <%
												}
											%> <%
												}
											%> <%
												if (nowpage>=maxpage) {
											%> [다음] <%
												} else {
											%> <a href="./BoardFaq.sc?page=<%=nowpage+1%>">[다음]</a> <%
												}
											%>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="faqList_btn">
								<%-- <%if(faq_id!=null && faq_id.equals("admin")){%> --%>
								<button name="boardFaq_wr" class="boardFaq_wr"
									onclick="location.href='FaqBoardWriteForm.sc'">글쓰기</button>
								<%-- <%}%> --%>
							</div>
						</article>
					</section>
				</div>
			</div>
		</div>
	</main>


	<script type="text/javascript"
		src="<c:url value='/resources/js/ServiceCenter/serviceCenter_board_faq.js?after'/>"></script>

	<!-- footer,js -->

	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>