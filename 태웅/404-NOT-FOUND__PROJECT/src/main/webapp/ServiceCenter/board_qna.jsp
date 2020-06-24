<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spring.service.QnaVO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    
    <link href="<c:url value='/resources/css/ServiceCenter/serviceCenter_board.css'/>" rel="stylesheet" />
    <title>고객문의</title>
</head>
<body>
    <section id="main">
    	<div class="container">
	        <div class="row">
            	<div class="col-xs-12" >
	            	<section id="content">
	           			<aside id="side">
                            <h2>고객센터</h2>
							<ul>
								<li><a href="#" onclick="location.href='BoardNotice.sc'">공지사항</a></li>
								<li><a href="#" onclick="location.href='BoardFaq.sc'">자주묻는질문</a></li>
								<li><a href="#" class="selected-menu" onclick="location.href='BoardQna.sc'">고객문의</a></li>
							</ul>								           				
	           			</aside>
	           			<article id="center-list">
           					<h2 id="center-list__title">고객문의</h2>
	           				<table id="center-list__table">
	                        	<thead>
		                             <tr>
		                                 <td class="center-list__table--num">번호</td>
		                                 <td class="center-list__table--title">제목</td>
		                                 <td class="center-list__table--date">작성일</td>
		                                 <td class="center-list__table--hit">조회</td>
		                             </tr>
		                          </thead>
		                          <tbody>
	                          	<c:choose>
		                        	<c:when test = "${empty list}">  	
		                              <tr>
		                                  <td colspan="4" class="center-list__table--none-content">등록된 게시글이 없습니다</td>
		                              </tr>
		                              </c:when>
		                              <c:otherwise>
		                              <tr>
		                                  <td></td>
		                                  <td></td>
		                                  <td></td>
		                                  <td></td>
		                              </tr>
		                              </c:otherwise>
	                            </c:choose>
	                        	</tbody>
	                    	</table>
	           			</article>
	       			</section>
	       		 </div>	
       		</div>
        </div>	    
    </section>
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
</body>
</html>