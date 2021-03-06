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
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Admin/join_seller_complete.css'/>" rel="stylesheet" />
    <title>판매자 회원가입 완료</title>
</head>
<body>
<section id="sub-main" class="serviceCenter">
	  <div class="sub-top">
	  	<h2 class="sub-title">회원가입</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>회원가입</strong>
	  		</li>
	  		<li>
	  		  <strong>판매자 회원가입</strong>
	  		</li>
	  		<li>
	  		  <strong>회원가입 완료</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="JoinSelect.ad">
	  				<span>회원가입</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="join__marketer--success2">
                        <div class="join__marketer--form">
                            <div class="join__marketer--checkimg2">
                                <img src="./resources/Images/Admin/welcome.png" alt="check">
                            </div>
                            <h2 class="join__marketer--noti2">판매자가입이 완료되었습니다.</h2>
                            <h6>저희 이웃샵을 이용해 주셔서 감사합니다.</h6>
                            <button type="button" class="join__marketer--btn2" onclick="location.href='Index.in'">메인페이지로</button>
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