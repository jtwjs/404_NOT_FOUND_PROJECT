

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.*"%>
<%@page import="com.spring.service.BoardNoticeVO"%>
<%
	BoardNoticeVO boardnotice = (BoardNoticeVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
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
	href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board_notice.css'/>"
	rel="stylesheet" />
<title>공지사항</title>
</head>
<body>
	<section id="sub-main" class="serviceCenter">
		<div class="sub-top">
			<h2 class="sub-title">고객센터</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>고객센터</strong></li>
				<li><strong>공지사항</strong></li>
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
							<h2>공지사항</h2>
							<ul>
								<li><a href="#" class="selected-menu"
									onclick="location.href='BoardNotice.sc'">공지사항</a></li>
								<li><a href="#" onclick="location.href='BoardFaq.sc'">자주묻는질문</a></li>
							</ul>
						</aside>
						<article id="center-list">
							<h2 id="center-list__title">공지사항</h2>
							<h5 class="text-center">게시글</h5>
							<form action="BoardNoticeWrite.sc"  method="post" name="notice_Forms"enctype="multipart/form-data" onsubmit="" >							
							
								<table class="table table-striped">
									<tr>
										<td>제목</td>
										<td><input type="hidden" class="form-control" name="title" value="<%=boardnotice.getTitle()%>"><%=boardnotice.getTitle()%></td>
										<td></td>
									</tr>
									<tr>
										<td>글내용</td>
												<td><textarea style=resize:none;border:0;overflow-y:hidden;background-color:#ffffff; 
												rows="17%" cols="50" name="content" class="form-control" disabled><%=boardnotice.getContent()%></textarea></td>
												<td></td>											
									
									</tr>
									<tr>
										<td colspan="4">
											<div class="notice_btn">	
											<sec:authorize access="hasRole('ROLE_ADMIN')">
											<button type="button" class="notice_modify" onclick="location.href='Boardnoticemodifyform.sc?num=<%=boardnotice.getNum() %>'">수정</button>	
											<button type="button" class="notice_delete" onclick="location.href='BoardNoticeDelete.sc?num=<%=boardnotice.getNum() %>'">삭제</button>
											</sec:authorize>										
											<button type="button" class="notice_main" onclick="location.href='BoardNotice.sc'">전체 게시물보기</button>
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
	
	
		<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
		<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js?after'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js?after'/>"></script>
	<!-- footer,js end -->
</body>
</html>
