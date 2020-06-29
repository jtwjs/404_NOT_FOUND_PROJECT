<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>

<!DOCTYPE html>
<html>
<head>
     <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_infoModify.css'/>" rel="stylesheet" />
    <title>프로필 수정</title>
</head>
<body>

<section id="sub-main" class="seller">
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
	  		  <strong>회원정보 수정</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="SellerMyPage.se">
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
	                    			    		<img src="./resources/Images/Seller/profile.jpg" alt="profile photo" />
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
                    			
                    			<div id="license_check">
                    			    <div>
                    			        <label for="business-license-number" class="virtual">사업자 등록번호</label>
                    			        <input type="hidden" id="business-license-number" />사업자 등록번호
                    			    </div>
	                                <div>
	                                    <label for="corporate_regist_number" class="virtual">법인등록번호</label>
	                                    <input type="hidden" id="corporate_regist_number" />법인등록번호
	                                </div>
	                                <div>
	                                    <label for="direct-sales-reference-number" class="virtual">통신판매신고번호</label>
	                                    <input type="hidden" id="direct-sales-reference-number" />통신판매신고번호
	                                </div>
	                                <div>
	                                    <label for="shopName" class="virtual">상호명</label>
	                                    <input type="hidden"id="shopName" />상호명
	                                    <span class="guide">상호명을 변경하려면 관리자에게 문의바랍니다</span>
	                                </div>
	                                <div>
	                                    <label for="representativeName" class="virtual">대표자명</label>
	                                    <input type="hidden"id="shopName" />대표자명
	                                    <span class="guide">대표자명을 변경하려면 관리자에게 문의바랍니다</span>
	                                </div>
                    			</div>
                    			
	                            <div class="update_id">
	                                <label for="userId" class="virtual">아이디</label>
	                                <input type="hidden" class="hiddenId" id="userId" name="userId" value="" />기존아이디                               
	                            </div>
	
	                            <div class="update_pw">
	                            	<div class="update_pw-existing">
		                                <label for="userPw" class="essential">기존 비밀번호</label>
		                                <input type="password" class="inputPw" id="userPw" name="userpPw" maxlength="20" autocomplete="off">                                
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자 (회원정보를 변경하기 위해선 필수입력)</span>
	                                </div>
	                                <div class="update_pw-new">
	                                    <label for="userPwCheck" class="virtual">신규 비밀번호</label>
		                                <input type="password" class="inputPwCheck" id="userPwCheck" name="userPwCheck" maxlength="20" autocomplete="off">
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
									</div>
									<div class="update_pw-confirm">		                                
		                                <label for="userPwCheck" class="virtual">신규 비밀번호 재입력</label>
		                                <input type="password" class="inputPwCheck" id="userPwCheck-confirm" name="userPwCheck-confirm" maxlength="20" autocomplete="off">
		                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
	                                </div>
	                            </div>
	                            
	                            <div id="update_manager-name">
	                                <div>
	                                    <label for="managerName" class="virtual">기존 담당자명</label>
	                                    <input type="hidden"id="managerName" />기존 담당자명
	                                </div>
	                                <div>
	                                    <label for="updateManagerName" class="virtual">신규 담당자명</label>
	                                    <input type="text" id="updateManagerName" />
	                                </div>
	                            </div>
	
	                            <div class="update_email">
	                                <div>
	                                    <label for="emailAddress" class="virtual">기존 이메일 주소</label>
	                                    <input type="hidden" id="emailAddress" />기존 이메일 주소
	                                </div>
	                                <div>
	                                    <label for="email1" class="virtual">신규 이메일 주소</label>
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
	                            </div>
	                            
	                            <div class="update_mPhone">
	                                <div>
	                                    <label for="mPhoneNumber" class="virtual">기존 연락처</label>
	                                    <input type="hidden" id="mPhoneNumber" />기존 연락처
	                                </div>
	                                <div>
	                                    <label for="mPhone1" class="virtual">휴대폰번호</label>
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
	                                </div>
	                            </div>
	                            
                                <div class="update_payment">
                                    <div>
	                                    <label for="paymentMethod" class="virtual">기존 은행계좌</label>
	                                    <input type="hidden" id="paymentMethod" />기존 은행계좌
                                    </div>
                                    <div>
	                                    <label for="bankAccount" class="virtual">기존 계좌번호</label>
	                                    <input type="hidden" id="bankAccount" />기존 계좌번호
                                    </div>
                                    <div>
                                        <label for="bankNum" class="virtual">계좌번호</label>
                                        <select class="selectBankNum1" id="bankNum1" name="bankNum1">
                                            <option value="은행명" selected>은행명</option>
                                            <option value="신한은행">신한은행</option>
                                            <option value="국민은행">국민은행</option>
                                            <option value="우리은행">우리은행</option>
                                            <option value="기업은행">기업은행</option>
                                        </select>
                                        <input id="bankNum" type="text" value="" maxlength="20" placeholder="계좌번호">
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
  
  
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_infoModify.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>"></script>
    
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>