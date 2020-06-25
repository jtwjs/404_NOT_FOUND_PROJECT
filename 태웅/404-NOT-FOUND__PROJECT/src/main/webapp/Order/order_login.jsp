<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Order/order_login.css'/>" rel="stylesheet" />
    <title>주문조회</title>
</head>
<body>

    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="order__login--wrap">
                        <!-- 일반회원 주문조회 로그인-->
                            <h5 class="order_tit">로그인</h5>                        
                            <p class="login__member">회원</p>
                        <div class="login__border">
                       </div>    
                        <form name="order__login--form">
    
                            <div class="id">
                                <input type="text" class="inputId" id="userId" name="userId" maxlength="20" value=""
                                    placeholder="  아이디를 입력해 주세요.">
                            </div>
    
                            <div class="password">
                                <input type="password" class="inputPw" id="userPw" name="userPw" maxlength="20"
                                    placeholder="  비밀번호를 입력해 주세요.">
                            </div>
                            <div class="check_id">
                                <input type="checkbox" class="chk_Id" name="chk_Id" id="Id_button" checked> 아이디 저장
                            </div>
                            <div class="login_btn">
                            </div>
    
                            <button type="button" class="submitBtn" onclick="location.href='#'">로그인</button>
    
                            <div class="loginfind_btn">
                                <a href="#" id="findIdBtn" class="findIdBtn" onclick="location.href='#'">아이디
                                        찾기</a>
                                &nbsp; | &nbsp;
                                <a href="#" id="findPwBtn" class="findPwBtn" onclick="location.href='#'">비밀번호
                                        찾기</a>
                            </div>
                            <div class="join_btn">
                                <button type="button" class="submitjoinBtn"
                                    onclick="location.href='#'">회원가입하기</button>
                            </div>
    
                            <div class="other_login">
                                <a id="naver-login-btn" href="#" role="button">
                                    <img src="resources/Images/Order/naver.png" width="37%" height="45" />
                                </a>
                                &nbsp; &nbsp; &nbsp;
                                <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>
    
                                <a id="kakao-login-btn" href="#" role="button">
                                    <img src="./resources/Images/Order/kakao_login_medium_narrow.png" width="37%" height="45" />
                                    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
                                </a>
                            </div>
                        </form>
                    </div>
                    <!-- 비회원 주문조회 -->
                    <div class="order__login--wrap2">  
                            <h5 class="order_tit2">비회원 주문조회</h5>                        
                            <p class="login__member2">비회원</p>                        
                        <div class="login__border2">
                        </div>
                        <form name="order__login--form2">
                            <div class="irum">
                                <input type="text" class="inputIrum" id="userIrum" name="userIrum" maxlength="20" value=""
                                    placeholder="  주문자명을 입력해 주세요.">
                            </div>
    
                            <div class="phone">
                                <input type="text" class="inputPhone" id="userPhone" name="userPhone" maxlength="20"
                                    placeholder="  휴대폰번호를 입력해 주세요.">
                            </div>
    
                            <div class="cart_btn">
                                <button type="button" class="submitcartBtn" onclick="location.href='#'">주문조회</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>