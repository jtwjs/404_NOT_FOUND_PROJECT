<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>

<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
   <link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>" rel="stylesheet" />
    <title>프로필 수정</title>
</head>
<body>
    <div class="container">
        <div class="row">
        	<div class="col-xs-12">
        		<section id="content">
		            <jsp:include page="mypage_template.jsp" flush="false"/>
		            <section id="myPage">
	                	<h2 class="content-title">프로필수정</h2>
	                         <article>
	                         
	                         
	                         </article>
	               	</section>    
               	</section>      
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_main.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>