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
    <link href="<c:url value='/resources/css/Admin/join_buyer.css?after'/>" rel="stylesheet" />
    <title>구매자 회원가입</title>
</head>
<body>
<!-- contents 시작 -->
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
	  		  <strong>구매자 회원가입</strong>
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

                    <div class="join__form--customer">
                        <h5><b>회원정보 입력</b></h5>
                        <form name="join__form--customer">

                            <div class="join_name">
                                <label for="userName" class="essential">이름</label>
                                <input type="text" class="inputName" id="userName" name="userName" maxlength="20" value="">
                            </div>

                            <div class="join_id">
                                <label for="userId" class="essential">아이디</label>
                                <input type="text" class="inputId" id="userId" name="userId" maxlength="20" value="">
                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
                            </div>

                            <div class="join_pw">
                                <label for="userPw" class="essential">비밀번호</label>
                                <input type="password" class="inputPw" id="userPw" name="userpPw" maxlength="20" autocomplete="off">
                                <span class="guide">공백 없는 영문, 숫자 포함 6 ~ 20자</span>
                            </div>

                            <div class="join_pwcheck">
                                <label for="userPwCheck" class="essential">비밀번호 확인</label>
                                <input type="password" class="inputPwCheck" id="userPwCheck" name="userPwCheck" maxlength="20" autocomplete="off">
                                <span class="guide">비밀번호 확인을 위해 한번 더 입력하세요.</span>
                            </div>

                            <div class="join_email">
                                <label for="email1" class="virtual">이메일 주소</label>
                                <input type="text" class="inputEmail1" id="email01" name="email01" size="20" maxlength="20" value="">
                                @
                                <input type="text" class="inputEmail2" id="email02" name="email02" size="20" maxlength="20" value="">
                                <select class="selectEmail3" name="selectEmail3" id="email03">
                                    <option value="메일 선택" selected>메일 선택</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                                    <option value="직접 입력">직접 입력</option>
                                </select>
                            </div>

                            <div class="join_mPhone">
                                <label for="mPhone1" class="essential">휴대폰번호</label>
                                <select class="selectPhone" id="mPhone1" name="mPhone1">
                                    <option value="010" selected>010</option>
                                    <option value="011">011</option>
                                    <option value="016">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                -
                                <input type="text" class="inputPhone2" id="mPhone2" name="mPhone2" value="" size="4" maxlength="4">
                                -
                                <input type="text" class="inputPhone3" id="mPhone3" name="mPhone3" value="" size="4" maxlength="4">

                                <input type="checkbox" class="inputChkSms" name="chk_sms" id="sms_button" checked> SMS를 수신하겠습니다.

                                <div class="smsAgree">
                                    <br />SMS 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다.
                                    <br />회원가입관련, 주문배송관련 등의 SMS는 수신동의와 상관없이 구매 회원에게 발송됩니다.
                                </div>
                            </div>

                            <div class="join_addr">
                                <label for="addr" class="virtual">주소</label>
                                <input type="text" id="sample4_postcode" class="inputAddrNum" name="addr_num" placeholder="우편번호">
                                <button type="button" class="addrNumBtn" onclick="sample4_execDaumPostcode()">우편번호찾기</button><br>
                                <input type="text" id="sample4_roadAddress" class="inputAddr1" id="sample4_roadAddress" placeholder="도로명주소">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input type="text" class="inputAddr2" id="sample4_detailAddress" placeholder="상세주소">

                                

                            </div>

                            <div class="join_finish">
                                <br />
                                <button type="button" class="submitBtn" onclick="location.href='JoinBuyerComplete.ad'">회원가입</button>
                                <button type="button" class="resetBtn" onclick="location.href='Index.in'">취소</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- contents 끝 -->


    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>" ></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>