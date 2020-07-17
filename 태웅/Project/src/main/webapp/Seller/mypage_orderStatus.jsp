<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
    SimpleDateFormat format_time = new SimpleDateFormat("yyyy-MM-dd");
    String today = format_time.format(Calendar.getInstance().getTime());
%>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_orderStatus.css'/>" rel="stylesheet" />
    <title>주문관리</title>
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
	  		  <strong>주문관리</strong>
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
                        <h2 class="content-title">주문관리</h2>
                        
                            <article id="content__status-search">
                            <form id="content__status-search--form" method="get"
                                action="" onsubmit="">
                                <div id="content__status-search--box">
                                
                                    <div id="content__search-box--title">
                                        <span>주문 검색</span>
                                    </div>
                                    <div id="content__search-box--status">
                                        <div class="search-box--title">주문상태</div>
                                        <div id="search-box__status--check">
                                            <input type="checkbox" /> 주문접수
                                            <input type="checkbox" /> 결제확인중
                                            <input type="checkbox" /> 결제확인
                                            <input type="checkbox" /> 상품준비중
                                            <input type="checkbox" /> 배송준비중
                                            <input type="checkbox" /> 배송중
                                            <input type="checkbox" /> 배송완료
                                            <input type="checkbox" /> 거래완료
                                            <input type="checkbox" /> 반송중
                                            <input type="checkbox" /> 주문취소중
                                            <input type="checkbox" /> 주문취소완료
                                        </div>
                                    </div>
                                    <div id="content__search-box--date">
                                        <div class="search-box--title">처리일자</div>
                                        <div id="search-box__order-date">
                                            <input type="date" max="<%=today %>" /> 
                                            ~ <input type="date" max="<%=today %>" />
                                        </div>
                                    </div>
                                    <div id="content__search-box--payment-method">
                                        <div class="search-box--title">결제방법</div>
                                        <div id="search-box__payment-method">
                                            <input type="checkbox" /> 신용카드
                                            <input type="checkbox" /> 카카오페이
                                            <input type="checkbox" /> 가상계좌
                                            <input type="checkbox" /> 무통장입금
                                            <input type="checkbox" /> 실시간계좌
                                            <input type="checkbox" /> 무통장입금(에스크로)
                                        </div>
                                    </div>
                                    <div id="content__search-box--submit">
                                        <input type="submit" value="조회하기" />
                                        <input type="button" value="취소하기" onclick="" />
                                    </div>
                                    
                                </div>
                            </form>
                            </article>
                            
                            <article id="transaction__detail">

                                <table class="transaction__detail--table">
                                    <thead>
                                        <tr>
                                            <th class="order-number">주문번호</th>                
                                            <th class="board-title">상품명</th>       
                                            <th class="buyer-id">구매자</th>       
                                            <th class="payment-method">결제방법</th>       
                                            <th class="order-price">결제금액</th>       
                                            <th class="order-date">결제일</th>       
                                            <th class="order-status">상태</th>       
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="non-post" colspan="7">
                                                등록된 주문내역이 없습니다.
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
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>