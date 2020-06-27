<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Home/index.css?after'/>" rel="stylesheet" />
    <title>Home</title>
</head>
<body>
    <main id="main_1">
        <section id="main_visual">
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
            
            
            
                </div>
            </div>
        </div>
        
        </section>
    </main>
    
    
    
    
    <!-- footer,js -->
    <jsp:include page="footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>