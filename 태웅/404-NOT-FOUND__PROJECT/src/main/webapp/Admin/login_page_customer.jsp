<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- 필수영역 -->
	<link href="<c:url value='/resources/css/Admin/login_page_customer.css'/>" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
 <section id="main__login__customer">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="main__login__customer--wrap">
                        <!--일반 회원 로그인-->
                        <div class="login_tit">
                            <h5><b>로그인</b></h5>
                        </div>
                        <div class="login__member--tabs">
                            <div class="login__member">
                                <a href="login_page_customer.html">
                                    <p><b>회원</b></p>
                                </a>
                            </div>
                            <div class="login__border">
                            </div>
                        </div>
                        <div class="main__login--form">
                            <form name="main__login--form">

                                <div class="id">
                                    <input type="text" class="inputId" id="userId" name="userId" maxlength="20" value=""
                                        placeholder="  아이디를 입력해 주세요.">
                                </div>

                                <div class="password">
                                    <input type="password" class="inputPw" id="userPw" name="userPw" maxlength="20"
                                        placeholder="  비밀번호를 입력해주세요.">
                                </div>
                                <div class="checkbox">
                                    <input type="checkbox" class="chk_Id" name="chk_Id" id="Id_button" checked> 아이디 저장
                                </div>
                                <div class="login_btn">
                                </div>

                                <button type="button" class="submitBtn" onclick="location.href='#'"><b>로그인</b></button>

                                <div class="loginfind_btn">
                                    <a href="#" id="findIdBtn" class="findIdBtn" onclick="location.href='#'"><b>아이디
                                            찾기</b></a>
                                    &nbsp; <b>|</b> &nbsp; 
                                    <a href="#" id="findPwBtn" class="findPwBtn" onclick="location.href='#'"><b>비밀번호
                                            찾기</b></a>
                                </div>
                                <div class="join_btn">
                                    <button type="button" class="submitjoinBtn"
                                        onclick="location.href='#'"><b>회원가입하기</b></button>
                                </div>

                                <div class="other_login">
                                    <a id="naver-login-btn" href="#" role="button">
                                        <img src="./resources/Images/Admin/naver.png" width="28%" height="45" />
                                    </a>
                                    &nbsp;
                                    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>

                                    <a id="kakao-login-btn" href="#" role="button">
                                        <img src="./resources/Images/Adminkakao_login_medium_narrow.png" width="28%" height="45" />
                                        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- 개인사업자 로그인 -->
                    <div class="main__login__customer--wrap2">
                        <div class="login__member2">
                            <a href="#"></a>
                                <p><b>개인사업자</b></p>
                        </div>
                        <div class="login__border2">
                        </div>
                    </div>
                </div>
            </div>
    </section>
        <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>

</body>
</html>