<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Admin/join_buyer_complete.css'/>" rel="stylesheet" />
    <title>구매자 회원가입 완료</title>
</head>
<body>
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="join__customer--success2">
                        <div class="join__customer--form">
                            <div class="join__customer--checkimg2">
                                <img src="./resources/Images/Admin/welcome.png" alt="check">
                            </div>
                            <h2 class="join__customer--noti2">회원가입이 완료되었습니다.</h2>
                            <h6>저희 이웃샵을 이용해 주셔서 감사합니다.</h6>
                            <button type="button" class="join__customer--btn2" onclick="location.href='Index.in'">메인페이지로</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>




    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>