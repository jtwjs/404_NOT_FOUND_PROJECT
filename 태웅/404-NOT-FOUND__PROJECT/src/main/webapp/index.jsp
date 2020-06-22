<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="header.jsp" flush="false"/>
    
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
    <title>Home</title>
</head>
<body>
    <h1>hello</h1>
    
    
    
    
    
    
<jsp:include page="footer.jsp" flush="false"/>    
<script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
</body>
</html>