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
    <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8" ></script>
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
                    <div class="login__box">
                    	<div class="order__login--wrap">
                        <!-- 일반회원 주문조회 로그인-->
                            <h5 class="order_title">로그인</h5>                        
                     <form name="order__login--form" id="login_form" action='<c:url value='/Login.ad'/>' method="post">
    
                            <div class="id">
                            	<label for="userId">아이디</label>
                                <input type="text" class="inputId" id="userId" name="userId" maxlength="20" value=""
                                    placeholder="  아이디를 입력해 주세요.">
                            </div>
    
                            <div class="password">
                            	<label for="userPw">비밀번호</label>
                                <input type="password" class="inputPw" id="userPw" name="userPw" maxlength="20"
                                    placeholder="  비밀번호를 입력해 주세요.">
                            </div>
                            <div class="find">
	                            <div class="check_id">
	                                <input type="checkbox" class="chk_Id" name="remember" id="Id_button" >
	                                <label for="Id_button" id="Id_buttonLabel">로그인 유지</label>
	                            </div>
	                            <div class="loginfind_btn">
	                                <a href="#" id="findIdBtn" class="findIdBtn" onclick="location.href='#'">아이디
	                                        찾기</a>
	                                <a href="#" id="findPwBtn" class="findPwBtn" onclick="location.href='#'">비밀번호
	                                        찾기</a>
	                            </div>
                            </div>
                          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button type="button" class="submitBtn" value="Login">로그인</button>
                            <button type="button" class="submitjoinBtn"
                                     onclick="javascript:location.href='JoinSeller.ad'">회원가입하기</button>
    
                            <!-- <div class="other_login">
                                <a id="naver-login-btn" href="#" role="button">
                                    <img src="resources/Images/Order/naver.png" width="37%" height="45" />
                                </a>
                                <a id="kakao-login-btn" href="#" role="button">
                                    <img src="./resources/Images/Order/kakao_login_medium_narrow.png" width="37%" height="45" />
                                </a>
                            </div> -->
                        </form> 
                      </div>
               	   </div>
                </div>
            </div>
        </div>
    </main>



    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
     <script type="text/javascript" src="<c:url value='/resources/js/Admin/seller_login.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>