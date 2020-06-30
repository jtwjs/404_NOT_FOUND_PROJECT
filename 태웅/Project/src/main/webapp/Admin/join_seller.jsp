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
    <link href="<c:url value='/resources/css/Admin/join_seller.css?after'/>" rel="stylesheet" />
    <title>판매자 회원가입</title>
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
	  		  <strong>판매자 회원가입</strong>
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
                    <div class="join__form--marketer">

                        <div class="join__form--marketer_1">
                            <h5><b>회원정보 입력</b></h5>
                            <form name="join__form--marketer_1">
                                <div class="join_id">
                                    <label for="userId" class="essential">아이디</label>
                                    <input type="text" class="inputId" id="userId" name="userId" maxlength="20" value="" >
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
                            </form>
                        </div>

                        <br /><br />

                        <div class="join__form--marketer_2">
                            <h5><b>사업자 입력</b></h5>
                            <form name="join__form--marketer_2">
                                <div class="join_marketName"> 
                                    <label for="marketName" class="essential">상호명</label>
                                    <input type="text" class="inputMarketName" id="marketName" name="marketName" maxlength="20" value="">
                                </div>

                                <div class="join_ceoName"> 
                                    <label for="ceoName" class="essential">대표자명</label>
                                    <input type="text" class="inputCeoName" id="ceoName" name="ceoName" maxlength="20" value="">
                                </div>

                                <div class="join_addr">
                                    <label for="addr" class="essential">주소</label>
                                    <input type="text" id="sample4_postcode" class="inputAddrNum" name="addr_num" placeholder="우편번호">
                                    <button type="button" class="addrNumBtn" onclick="sample4_execDaumPostcode()">우편번호찾기</button><br>
                                    <input type="text" id="sample4_roadAddress" class="inputAddr1" id="sample4_roadAddress" placeholder="도로명주소">
                                    <span id="guide" style="color:#999;display:none"></span>                                
                                    <input type="text" class="inputAddr2" id="sample4_detailAddress" placeholder="상세주소">
                                    
    
                                </div>

                                <div class="join_saleNum"> 
                                    <label for="saleNum" class="essential">통신판매신고번호</label>
                                    <input type="text" class="inputSaleNum" id="saleNum" name="saleNum" maxlength="20" value="">
                                    
                                    <input type="checkbox" class="inputChkSaleFile" name="chk_saleFile" id="chk_saleFile" checked> 통신판매신고증 첨부하기
                                    <button type="button" class="SaleFileBtn" onclick="location.href='#'">첨부하기</button>
                                </div>

                                <div class="join_name"> 
                                    <label for="userName" class="essential">담당자 이름</label>
                                    <input type="text" class="inputName" id="userName" name="userName" maxlength="20" value="">
                                </div>

                                <div class="join_Phone">
                                    <label for="Phone" class="essential">전화번호</label>
                                    <input id="Phone1" class="inputPhone1" name="Phone1" type="text" value="" size="4" maxlength="4">
                                    -
                                    <input id="Phone2" class="inputPhone2" name="Phone2" type="text" value="" size="4" maxlength="4">
                                    -
                                    <input id="Phone3" class="inputPhone3" name="Phone3" type="text" value="" size="4" maxlength="4">
                                </div>

                                <div class="join_email">
                                    <label for="email1" class="essential">이메일 주소</label>
                                    <input type="text" class="inputEmail1" id="email01" name="email01" size="20" maxlength="20" value="">
                                    @
                                    <input type="text" class="inputEmail2" id="email02" name="email02" size="20" maxlength="20" value="">
                                    <select class="selectEmail3" name="inputEmail3" id="email03">
                                        <option value="메일 선택" selected>메일 선택</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        <option value="직접 입력" >직접 입력</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        
                        <br /><br />

                        <div class="join__form--marketer_3">
                            <h5><b>정산계좌정보 입력</b></h5>
                            <form name="join__form--marketer_3">
                                <div class="join_bankNum">
                                    <label for="bankNum" class="essential">계좌번호</label>
                                    <select class="selectBankNum1" id="bankNum1" name="bankNum1">
                                        <option value="은행명" selected>은행명</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="국민은행">국민은행</option>
                                        <option value="우리은행">우리은행</option>
                                        <option value="기업은행">기업은행</option>
                                    </select>
                                    <input id="bankNum" class="inputBankNum2" name="bankNum2" type="text" value="" size="20" maxlength="20" placeholder="계좌번호">
                                </div>
                            </form>
                        </div>

                        <div class="join__form--marketer_4"></div>
                            <form name="join__form--marketer_4">
                                <div class="join_finish">
                                    <br />
                                    <button type="button" class="submitBtn" onclick="location.href='JoinSellerComplete.ad'">판매자 등록하기</button>
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