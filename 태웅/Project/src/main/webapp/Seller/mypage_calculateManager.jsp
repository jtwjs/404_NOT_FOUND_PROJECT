<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="<c:url value='/resources/css/Seller/mypage_calculateManager.css'/>" rel="stylesheet" />
    <title>정산관리</title>
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
	  		  <strong>정산관리</strong>
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
                        <h2 class="content-title">시세정보</h2>
                        
                        <article id="content__calculateSystem--search">
                            <div id="content__calculateSystem--search-box">
                                <form id="calculateSystem__search-box--form" method="get" action="" onsubmit="">

                                    <div id="calculateSystem__search-box">
                                        <span>주문검색기간</span>
                                        <input type="date" /> ~ <input type="date" />
                                        <input type="button" value="오늘" />
                                        <input type="button" value="3일간" />
                                        <input type="button" value="일주일" />
                                        <input type="button" value="1개월" />
                                        <input type="button" value="3개월" />
                                        <input type="button" value="전체" />
                                    </div>
                                </form>
                            </div>
                        </article>

                        <article id="transaction__detail">

                            <table class="transaction__detail--table">
                                <thead>
                                    <tr>
                                        <th class="cal_date">정산일</th>
                                        <th class="cal_totOrder">총주문</th>
                                        <th class="cal_realOrder">실결제주문</th>
                                        <th class="cal_completed">배송완료</th>
                                        <th class="cal_netSales">순매출</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="non-post" colspan="8">
                                            거래내역이 없습니다.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </article>

                        <hr />

                        <article id="Glossary">
                            <div>
                                <p>
                                    <용어 설명><br /><br />

                                    - 총주문 : 주문일 기준으로 주문액 합계가 표시됨<br />
                                    - 입금 전 취소 : 현금 관련 주문의 경우 취소일 기준으로 입금전 취소액 합계가 표시됨<br />
                                    - 실결제주문 : 결제 체크 된 날을 기준으로 결제된 주문액 합계가 표시됨<br />
                                    - 배송 전 취소 : 취소일 기준으로 배송 전 취소액의 합계가 표시됨<br />
                                    - 배송 완료 : 배송 완료 체크된 날을 기준으로 매출로 인식됨<br />
                                    - 취소반품(환불) : 배송 완료 후 취소된 주문액을 취소일 기준으로 표시함<br />
                                    - 순매출 : 배송완료에서 취소/반품(환불)을 차감한 순수한 매출액임
                                </p>
                            </div>
                        </article>
                        
                        
                    </section>
                    
                </section>
            </div>
        </div>
    </div>
    
    </main>


    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script> 
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>