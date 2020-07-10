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
      <article id="join_seller">
        <form id="join_form" name="join__form" action="JoinSeller.se" method="post">
          <div class="join_seller--agreement">
            <h2>약관동의</h2>
            <div class="agreement--content">
              <ul>
                <li>
                  <div class="agreement-input">
                    <input type="checkbox" name="agreement" id="agreement01" class="chkBox" />
                    <label for="agreement01">이용약관에 동의합니다.(필수)</label>
                  </div>
                  <a href="termsUse.ad" class="btn_detail" target="_blank">전체보기</a>
                </li>
                <li>
                  <div class="agreement-input">
                    <input type="checkbox" name="agreement" id="agreement02" class="chkBox"/>
                    <label for="agreement02">개인정보취급방침에 동의합니다.(필수)</label>
                  </div>
                  <a href="privacyPolicy.ad" class="btn_detail" target="_blank">전체보기</a>
                </li>
                <li>
                  <div class="agreement-input">
                    <input type="checkbox" name="agreement" id="agreement03" class="chkBox" />
                    <label for="agreement03">본인은 만 14세 이상입니다.(선택)</label>
                  </div>
                </li>
                <li>
                  <div class="agreement-input">
                    <input type="checkbox" name="agreement" id="agreement04" class="chkBox" />
                    <label for="agreement04">문자 수신에 동의합니다.(선택)</label>
                  </div>
                </li>
                <li>
                  <div class="agreement-input">
                    <input type="checkbox" name="agreement" id="agreement05" class="chkBox" />
                    <label for="agreement05">이메일 수신에 동의합니다.(선택)</label>
                  </div>
                </li>
              </ul>
              <p class="agreement-input">
                <input type="checkbox" name="agreementAll" id="agreementAll" />
                <label for="agreementAll">이용약관,개인정보취급방침,문자,이메일 수신에 모두 동의합니다.</label>
              </p>
            </div>
          </div>
          <div class="join_seller--required-info">
            <h2>회원정보입력</h2>
            <div class="required-info--content">
              <ul>
                <li>
                  <div class="required-info--input">
                    <div class="label">
                      구분
                    </div>
                    <div class="label-content first">
                      판매회원
                    </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input">
                    <label for="userId" class="label">
                      아이디
                    </label>
                    <div class="label-content">
                      <input type="text" id="userId" name="id" minlength="5" maxlength="16" placeholder="공백 없는 5 ~ 16자의 영문 소문자,숫자 포함" required />
                      <p id="id_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input">
                    <label for="userPw" class="label">
                      비밀번호
                    </label>
                    <div class="label-content">
                      <p class="password">
                        <input type="password" id="userPw" name="password" minlength="8" maxlength="16" autocomplete="off"
                        placeholder="공백 없는 8 ~ 16자의 영문 대/소문자,숫자 및 특수문자 포함"required/>
                      </p>
                      <p id="pw_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input">
                    <label for="userPwCheck" class="label">
                      비밀번호 확인
                    </label>
                    <div class="label-content">
                    <p class="password-confirm">
                      <input type="password" id="userPwCheck" minlength="8" maxlength="16" autocomplete="off" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." required />
                      </p>
                      <p id="pwConfirm_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                
              </ul>
            </div>
          </div>
          <div class="join_seller--required-info">
            <h2>사업자정보입력</h2>
            <div class="required-info--content">
              <ul id="business-info">
                <li>
                  <div class="required-info--input">
                    <label for="businessName" class="label">
                      상호명
                    </label>
                    <div class="label-content">
                      <input type="text" id="businessName" name="shopName"  maxlength="16" placeholder="상호명을 입력하세요" required />
                    </div>
                  </div>
                </li>
                
                <li>
                  <div class="required-info--input">
                    <label for="representative" class="label">
                      대표자
                    </label>
                    <div class="label-content">
                      <input type="text" id="representative" name="represent" minlength="2" maxlength="16" placeholder="대표자를 입력하세요" required />
                      <p id="representative_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input addr">
                    <label class="label">
                      주소
                    </label>
                    <div class="label-content addr">
                    <div class="zip-code">
                      <input type="text" id="sample4_postcode"  name="addrNum" placeholder="우편번호" readonly  required />
                      <button type="button" id="zip-code-btn" onclick="sample4_execDaumPostcode()">우편번호찾기</button>
                      </div>
                      <input type="text" id="sample4_roadAddress" class="address--road" name="addrRoadName" id="sample4_roadAddress" placeholder="도로명주소" readonly required>
                      <span id="guide" style="color:#999;display:none"></span>
                      <input type="text" class="address--detail" id="sample4_detailAddress" name="addrDetail" placeholder="상세주소">
                    </div>
                  </div>
                </li>
                   <li>
                  <div class="required-info--input">
                  
                    <label for="mailOrd-reportNum" class="label reportNum">
                      통신판매<span class="enter">신고번호</span>
                    </label>
                    <div class="label-content">
                      <div class="wrap-input mailOrd">
						<input type="text" id="mailOrd-reportNum" name="orderReportNum" maxlength="20" placeholder="통신판매신고번호를 입력하세요" required />
						<label for="reportCard" class="reportCard-btn">통신판매신고증<span class="enter">첨부하기</span></label>
	                  	<input type="file" id="reportCard" class="hide" accept=".gif, .jpg, .png" name="orderReportImg" required>  
                      </div>
                      <p id="mailOrd_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input">
                    <label for="customerName" class="label">
                      담당자
                    </label>
                    <div class="label-content">
                      <input type="text" id="customerName" name="name" minlength="2" maxlength="16" placeholder="담당자를 입력하세요" required />
                      <p id="customerName_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
                
                <li>
                  <div id="tel-input" class="required-info--input">
                    <label for="mPhone1" class="label">
                      연락처
                    </label>
                    <div class="tel-input--wrap">
                      <div class="label-content tel">
                       <div class="wrap-input">
                          <select id="mPhone1" name="telCarrierNum">
                            <option value="010" selected>010</option>
                            <option value="011">011</option>
                            <option value="016">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                          </select>
                          <input type="text" id="mPhone2" name="telAllocationNum" value="" size="4" maxlength="4" required />
                          <input type="text" id="mPhone3" name="telDiscretionaryNum" value="" size="4" maxlength="4" required />
                          <a href="#" class="sendAtNum-btn">인증번호 발송</a>
                         </div>
                        <p id="tel_check" class="check hide"></p>
                      </div>
                      <div class="Authentication">
                        <input type="text" id="Authentication-num" placeholder="인증정보확인" />
                        <a href="#" class="AtNum-confirm-btn">확인</a>
                      </div>
                   </div>
                  </div>
                </li>
                <li>
                  <div class="required-info--input">
                    <label for="userPwCheck" class="label">
                      이메일
                    </label>
                    <div class="label-content e-mail">
                      <input type="text" id="email01" name="emailId" size="20" maxlength="20" />
                      <p class="email-address">
                        <input type="text" id="email02" name="emailAddr" size="20" maxlength="20" />
                      </p>
                      <select name="selectEmail3" id="email03">
                        <option value="">직접 입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                      </select>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="join_seller--required-info">
            <h2>정산계좌정보입력</h2>
            <div class="required-info--content">
              <ul id="settlement">
                <li>
                  <div class="required-info--input">
                    <label for="userId" class="label">
                      계좌번호
                    </label>
                    <div class="label-content">
                      <div class="bank_account">
                        <select id="bank" name="bankName">
                            <option value="" selected>은행명</option>
                            <option value="신한은행">신한은행</option>
                            <option value="우리은행">우리은행</option>
                            <option value="농협은행">농협은행</option>
                            <option value="기업은행">기업은행</option>
                            <option value="하나은행">하나은행</option>
                            <option value="국민은행">국민은행</option>
                            <option value="BNK부산은행">BNK부산은행</option>
                            <option value="BNK경남은행">BNK경남은행</option>
                            <option value="DGB대구은행">DGB대구은행</option>
                            <option value="광주은행">광주은행</option>
                            <option value="전북은행">전북은행</option>
                            <option value="제주은행">제주은행</option>
                          </select>
                          <input type="text" id="bank_account" name="bankAccountNum"  size="4" maxlength="20" placeholder="계좌번호 '-'없이 숫자만 입력하세요" required />
                      </div>
                      <p id="bankAccount_check" class="check hide"></p>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="join_button">
            <button type="button" class="submitBtn">가입완료</button>
            <button type="button" class="resetBtn" onclick="location.href='Index.in'">취소</button>
          </div>
        </form>
      </article>
    </main>
    <!-- contents 끝 -->


    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/post_search.js'/>" ></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Admin/join_seller.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>