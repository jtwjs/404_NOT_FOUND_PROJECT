<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>
<%@ page import="com.spring.boardproduct.BoardQnaVO" %>
<%@ page import="com.spring.boardproduct.BoardReviewVO" %>
<%@ page import="com.spring.buyer.WishListVO" %>
<%
    /* 마이페이지 접속했을 때 로그인 상태인지 세션을 통해 확인하고 아닐 경우 메인페이지로 이동
    if((String)session.getAttribute("id") != null){
    	out.println("<script>alert('로그인해주십시오')"
    			+ "location.href='/Index.in'</script>");
    	
    }*/
    
    // 아이디, 이름 (고객쇼핑정보) 을 받아옴
   
%>
<!DOCTYPE html>
<html>
<head>
       <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_main.css?after'/>" rel="stylesheet" />
    <title>구매자페이지</title>
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
            	<div class="col-xs-12" >
	            	<section id="content">
	           			<jsp:include page="mypage_template.jsp" flush="false"/>
	           			<section id="myPage">
                            <h2 class="content-title">My Page</h2>
                            <article id="buyer__info">
                                <div class="mypage__buyerRating">
                                    <div class="overall-rating">
                                        <h2 class="overall-rating--title">구매자 등급</h2>
                                        <ul class="rating">
                                            <li><span class="rating-grade">회원등급</span></li>
                                            <li class="my_rating-grade"><h2 id="my-rating">LV.2 브론즈</h2> <a class="rating-benefit" href="#">등급 혜택 보기</a> </li>
                                            <li id="rating-explain">* 다음 등급인 <span class="next-level">실버</span>까지 <span class="required-score">61,670</span>점 남았습니다<span class="register-date">가입일: 2014.05.22</span></li>
                                        </ul>
                                    </div>
                                    
                                </div>
                                <div class="mypage__subInfo">
                                    <div class="saving-point">
                                        <img src="./resources/Images/Buyer/Money.png" alt="saving point image"/>
                                        <dl>
                                            <dt>적립금</dt>
                                            <dd>5.998</dd>
                                        </dl>
                                    </div>
                                    <div class="write-review">
                                        <img src="./resources/Images/Buyer/wirte.png" alt="write review image"/>
                                        <dl>
                                            <dt>후기작성</dt>
                                            <dd>9</dd>   
                                        </dl>
                                    </div>
                                </div>
                                
                            </article>  
                            <article id="inquery">
                                <div class="inquery__order-delivery">
                                    <div class="inquery--title">
                                        <h2>주문<span class="slash">/</span>배송조회</h2>
                                        <a class="view-all" href="#" title="전체보기">전체</a>
                                    </div>
                                    <div class="inquery--content">
                                        <ul class="inquery--list">
                                            <li class="inquery--list-item"><p>0<span class="enter">입금대기중</span></p></li> 
                                            <li class="inquery--list-item"><p>0<span class="enter">배송준비중</span></p></li> 
                                            <li class="inquery--list-item"><p>0<span class="enter">배송중</span></p></li> 
                                            <li class="inquery--list-item complete"><p>0<span class="enter">배송완료</span></p></li> 
                                        </ul>
                                    </div>
                                </div>
                                <div class="inquery__return-exchange">
                                    <div class="inquery--title">
                                        <h2>취소<span class="slash">/</span>교환<span class="slash">/</span>반품 내역</h2>
                                        <a class="view-all" href="#" title="전체보기">전체</a>
                                    </div>
                                    <ul class="inquery--list">
                                        <li class="inquery--list-item"><p>0<span class="enter">교환신청</span></p></li> 
                                        <li class="inquery--list-item complete"><p>0<span class="enter">교환완료</span></p></li> 
                                        <li class="inquery--list-item"><p>0<span class="enter">반품신청</span></p></li> 
                                        <li class="inquery--list-item complete"><p>0<span class="enter">반품완료</span></p></li> 
                                    </ul>
                                </div>
                            </article>
                            <article id="order__history">
                                <div class="order__history--title">
                                    <h2>주문내역</h2>
                                    <a class="view-all" href="#" title="전체보기">전체</a>
                                </div>    
                                <table class="order__history--table">
                                    <thead>
                                        <tr>
                                            <th class="order-number">
                                                주문번호
                                            </th>             
                                            <th class="product-name">
                                                상품명
                                            </th>       
                                            <th class="order-amount">
                                                주문금액
                                            </th>       
                                            <th class="order-date">
                                                주문일자
                                            </th>       
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="non-post" colspan="4">
                                                주문내역이 없습니다.
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
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_main.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>