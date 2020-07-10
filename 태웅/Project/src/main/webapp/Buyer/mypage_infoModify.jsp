<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>

<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_infoModify.css?after'/>" rel="stylesheet" />
    <title>프로필 수정</title>
</head>
<body>
 	<section id="sub-main" class="">
	  <div class="sub-top">
	  	<h2 class="sub-title">마이페이지</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>마이페이지</strong>
	  		</li>
  			<li>
	  			<strong>회원정보수정</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="BuyerMyPage.by">
	  				<span>마이페이지</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section>
<main id="main">
    <div class="container">
        <div class="row">
        	<div class="col-xs-12">
        		<section id="content">
		            <jsp:include page="mypage_template.jsp" flush="false"/>
		            <section id="myPage">
	                	<h2 class="content-title">프로필수정</h2>
                   		<article class="update__form--customer">
                   			<h5><b>회원정보 입력</b></h5>
                    			<form name="update__form--customer" id="update__pforile--form" action="" method="post" >
                    			<div class="update_profile-photo">
                    				<div id="update_profile-showingPart">
	                    			    <label for="profilePhoto" class="virtual">사진</label>
	                    			    <dl>
	                    			    	<dt>
	                    			    		<img src="./resources/Images/Buyer/Avatar 3.png" alt="profile photo" />
	                    			    	</dt>
	                    			    	<dd>	
												회원님을 알릴 수 있는 사진을 등록해 주세요.
												<span class="enter">등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다</span>
											</dd>
	                    			    </dl>
	                    			    <button type="button" id="change_profile-photo">사진 변경</button>
                    			    </div> 
                    			    <div id="update_profile-hidePart">
                    			    	<div class="profile_hidePart-change">
	                    			    	<label for="change-photo">사진 선택</label>
	                    			    	<input type="file" id="change-photo" class="hide"/>
	                    			    	<button type="button" id="default-photo">기본이미지로 변경</button>
                    			    	</div>
                    			    	<div class="profile_hidePart-result">
                    			    	<button type="button" id="result-completeBtn">완료</button>
                    			    		<button type="button" id="result-cancleBtn">취소</button>
                    			    	</div>
                    			    </div>
                    			</div>
	                            <div class="update_name"> 
	                                <label for="userName" class="essential">이름</label>
	                                <input type="hidden" class="hiddenName" id="userName" name="userName" value="" />기존이름
	                            </div>
	
	                            <div class="update_id">
	                                <label for="userId" class="essential">아이디</label>
	                                <input type="hidden" class="hiddenId" id="userId" name="userId" value="" />기존아이디                               
	                            </div>
	
	                            <div class="update_pw">
	                            	<div class="update_pw-existing">
		                                <label for="userPw" class="essential">기존 비밀번호</label>
		                                <input type="password" class="inputPw" id="userPw" name="userpPw" maxlength="20" autocomplete="off">                                
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
	                                </div>
	                                <div class="update_pw-new">
	                                    <label for="userPwCheck" class="essential">신규 비밀번호</label>
		                                <input type="password" class="inputPwCheck" id="userPwCheck" name="userPwCheck" maxlength="20" autocomplete="off">
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
									</div>
									<div class="update_pw-confirm">		                                
		                                <label for="userPwCheck" class="essential">신규 비밀번호 재입력</label>
		                                <input type="password" class="inputPwCheck" id="userPwCheck-confirm" name="userPwCheck-confirm" maxlength="20" autocomplete="off">
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
	                                </div>
	                            </div>

	
	                            <div class="update_email">
	                                <label for="email1" class="virtual">이메일 주소</label>
	                                <input type="text" class="inputEmail1" id="email01" name="email01" size="20" maxlength="20" value="">
									&#64;
	                                <input type="text" class="inputEmail2" id="email02" name="email02" size="20" maxlength="20" value="">
	                                <select class="selectEmail3" name="selectEmail3" id="email03">
	                                    <option value="메일 선택" selected>메일 선택</option>
	                                    <option value="naver.com">naver.com</option>
	                                    <option value="daum.net">daum.net</option>
	                                    <option value="gmail.com">gmail.com</option>
	                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
	                                    <option value="직접 입력" >직접 입력</option>
	                                </select>
	                            </div>
	                            <div class="update_mPhone">
	                                <label for="mPhone1" class="essential">휴대폰번호</label>
	                                <select class="selectPhone" id="mPhone1" name="mPhone1">
	                                    <option value="010" selected>010</option>
	                                    <option value="011">011</option>
	                                    <option value="016">017</option>
	                                    <option value="018">018</option>
	                                    <option value="019">019</option>
	                                </select>
	                                -
	                                <input id="mPhone2" class="inputPhone2" name="mPhone2" type="text" value="" size="4" maxlength="4">
	                                -
	                                <input id="mPhone3" class="inputPhone3" name="mPhone3" type="text" value="" size="4" maxlength="4">
	                                
	                                <input type="checkbox" class="inputChkSms" name="chk_sms" id="sms_button" > SMS를 수신하겠습니다.
	
	                                <div class="smsAgree">
	                                    <br />*SMS 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다.
	                                    <br />회원가입관련, 주문배송관련 등의 SMS는 수신동의와 상관없이 구매 회원에게 발송됩니다.
	                                </div>
	                            </div>
	                            <div class="update_finish">
	                                <button type="button" id="submitBtn" onclick="location.href='#'">회원정보수정</button>
	                                <button type="button" id="resetBtn" onclick="location.href='#'">취소</button> 
	                        	</div>                   
                        	</form>
                   		</article>
            	   	</section>    
           	  	</section>      
            </div>
        </div>
    </div>
</main>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_infoModify.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
    
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>  
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>