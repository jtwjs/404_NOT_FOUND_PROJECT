<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp" flush="false"/>
    <jsp:include page="../footer.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->
    
    <style>
        .container {
            width: 1200px;
            max-width: none !important;
        }
    </style>
    <!-- 각자 view에 연결된 css 파일에 .container 부분 넣어줄 것 -->
    
    
    <link href="<c:url value='/resources/css/Seller/mypage_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_sidebar.css'/>" rel="stylesheet" />
    <title>판매자 페이지</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <jsp:include page="mypage_sidebar.jsp" flush="false"/>
        </div>
    </div>
</body>
</html>