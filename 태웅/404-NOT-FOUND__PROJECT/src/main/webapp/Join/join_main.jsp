<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->
	<link href="<c:url value='/resources/css/Join/join_main.css'/>" rel="stylesheet" />
<title>회원가입</title>
</head>
<body>
 	<div class="container">
        <div class="row">
            <div class="col-xs-12">
                <section class="join__main">
                    <div class="join__main--title">
                        <h2>회원가입</h2>
                        <div class="join__main--location-navi">
                            <ul class="location-list">
                                <li>
                                    <a href="#">HOME</a>
                                </li>
                                <li>
                                    <a href="#">회원가입</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="join__main--content">
                        <h2 class="join__main--content--title"><span class="brand-title">이웃</span>#에 오신것을 환영합니다.<span class="enter">해당하는 회원 유형을 선택해주세요.</span></h2>
                        <div class="join__main--content--sort">
                            <div class="join--buyer">
                                <h2 class="join--type">개인구매회원<span class="enter">가입</span></h2>       
                                <p class="join--content">
                                    *Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                </p>
                                <div class="easy-signUp">
                                    <dl>
                                        <dt>간편회원</dt>
                                        <dd>자주 사용하는 SNS 아이디로 간편하게 가입하실 수 있습니다.</dd>
                                        <dd class="sns-wrap">
                                            <a href="#" class="naver-btn"  title="네이버로 가입"><span class="hide-text">네이버로 가입</span></a>
                                            <a href="#" class="kakao-btn" title="카카오로 가입"><span class="hide-text">카카오로 가입</span></a>
                                            <a href="#" class="facebook-btn" title="페이스북으로 가입"><span class="hide-text">페이스북으로 가입</span></a>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="join--seller">
                                <h2 class="join--type">판매사업자회원<span class="enter">가입</span></h2>
                                <p class="join--content">
                                    *Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                    Nisl tincidunt eget nullam non
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
     <jsp:include page="../footer.jsp" flush="false"/>
     <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
</body>
</html>