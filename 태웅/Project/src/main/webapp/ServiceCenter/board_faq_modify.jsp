<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.service.BoardFaqVO"%>
<%
	/* String id=(String)session.getAttribute("id"); */
	BoardFaqVO bfl = (BoardFaqVO)request.getAttribute("vo");
	System.out.println("bfl.getNum()=" + bfl.getNum());
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- header, css -->
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/reset.css?after'/>"	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board_faq.css?after'/>" rel="stylesheet" />
<title>자주하는질문</title>

</head>

<body>
<!-- 게시판 수정 -->

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
								<li><a href="#" class="selected-menu" onclick="location.href='BoardFaq.sc'">자주묻는질문</a></li>
								<li><a href="#" onclick="location.href='BoardQna.sc'">고객문의</a></li>
							</ul>
						</aside>

						<article id="center-list">
							<h2 id="center-list__title">자주묻는질문</h2>
							<h5 class="text-center">게시글 수정</h5>
							<form action="FaqBoardModify.sc" method="get" >
								<input type="hidden" class="form-control" name="num" value="<%=bfl.getNum() %>">
								<table class="table table-striped">
									<tr>
										<td>작성자</td>
										<td><input type="hidden" class="form-control" name="writer" value="관리자"></td>
									</tr>
									<tr>
										<td>제목</td>
										<td><input name="title" class="form-control" size="50" maxlength="100" value="<%=bfl.getTitle()%>"></td>
									</tr>
									<tr>
										<td>글내용</td>
										<td><textarea name="content" class="form-control" cols="67" rows="15"><%=bfl.getContent() %></textarea></td>
									</tr>

									<tr>
										<td colspan="2">
											<div class="faqWrite_btn">
												<input type="submit" class="faq_success" value="수정">
												<input type="reset" class="faq_reset" value="다시작성" onclick="'FaqBoardModifyform.sc'" >
												<button type="button" class="faq_main" onclick="location.href='BoardFaq.sc'">전체 게시글보기</button>
											</div>
										</td>
									</tr>
								</table>
							</form>
						</article>
					</section>
				</div>
			</div>
		</div>
	</main>

	<script type="text/javascript" src="<c:url value='/resources/js/ServiceCenter/serviceCenter_board_faq.js?after'/>"></script>

	<!-- footer,js -->

	<script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->

</body>
</html>