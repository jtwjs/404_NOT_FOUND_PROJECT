<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Admin/login_seller.css?after'/>" rel="stylesheet" />
    <title>로그인</title>
</head>
<body>
 <section id="sub-main" class="login">
	  <div class="sub-top">
	  	<h2 class="sub-title">로그인</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>로그인</strong>
	  		</li>
	  		<li>
	  		  <strong>판매자 로그인</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li class="unselect">
	  			<a href="LoginBuyer.ad">
	  				<span>구매자 로그인</span>
	  			</a>
	  		</li>
	  		<li>
	  			<a href="LoginSeller.ad">
	  				<span>판매자 로그인</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="main__login__maketer">
                        <div clss="main__login--foms">
                            <div class="main__login__maketer--wrap">
                                <!--일반 회원 로그인-->
                                <h5 class="login_tit">로그인</h5>
                                <div class="main__login__maketer--tabs">
                                    <div class="login__members1">
                                        <a href="LoginBuyer.ad">
                                            <p class="login__member">회원</p>
                                        </a>
                                    </div>
                                    <div class="login__border">
                                    </div>
                                </div>
                                <div class="main__login__maketer--form">
                                    <form name="main__login--form">
    
                                        <div class="id">
                                            <input type="text" class="inputId" id="userId" name="userId" maxlength="20"
                                                value="" placeholder="  아이디를 입력해 주세요.">
                                        </div>
    
                                        <div class="password">
                                            <input type="password" class="inputPw" id="userPw" name="userPw" maxlength="20"
                                                placeholder="  비밀번호를 입력해주세요.">
                                        </div>
                                        <div class="check_Id">
                                            <input type="checkbox" class="chk_Id" name="chk_Id" id="Id_button" checked> 아이디
                                            저장
                                        </div>
                                        <div class="login_btn">
                                            <button type="button" class="submitBtn" onclick="location.href='#'">로그인</button>
                                        </div>
    
                                        
    
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
    
                                        <div class="main__login__maketer--other_login">
                                            <a id="naver-login-btn" href="#" role="button">
                                                <img src="./resources/Images/Admin/naver.png" />
                                            </a>
    
                                            <a id="kakao-login-btn" href="#" role="button">
                                                <img src="./resources/Images/Admin/kakao_login_medium_narrow.png" />
                                            </a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- 개인사업자 로그인 -->
                            <div class="main__login__maketer--wrap2">
                                <div class="login__members2">
                                    <a href="#">
                                        <p class="login__member2">개인사업자</p>
                                    </a>
                                </div>
                                <div class="login__border2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        
        </div>
    </main>



    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>