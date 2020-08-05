<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                            <li class="my_rating-grade"><h2 id="my-rating">LV.${user.grade}</h2> <a class="rating-benefit" href="BuyerMyPageMyGrade.by">등급 혜택 보기</a> </li>
                                            <li id="rating-explain"><p class="required-score">* 다음 등급까지 ${rest_exp}점 남았습니다</p> <p class="register-date">가입일: ${user.joinDate}</p></li>
                                        </ul>
                                    </div>
                                    
                                </div>
                                <div class="mypage__subInfo">
                                    <div class="saving-point" onclick="location.href='BuyerMyPageSavePoint.by?status=전체'">
                                        <img src="./resources/Images/Buyer/Money.png" alt="saving point image"/>
                                        <dl>
                                            <dt>적립금</dt>
                                            <dd>${user.strSavePoint}</dd>
                                        </dl>
                                    </div>
                                    <div class="write-review" onclick="location.href='BuyerMyPageReview.by'">
                                        <img src="./resources/Images/Buyer/wirte.png" alt="write review image"/>
                                        <dl>
                                            <dt>후기작성</dt>
                                            <dd>${reveiwCount}</dd>   
                                        </dl>
                                    </div>
                                </div>
                                
                            </article>  
                            <article id="inquery">
                                <div class="inquery__order-delivery">
                                    <div class="inquery--title">
                                        <h2>주문<span class="slash">/</span>배송조회</h2>
                                        <a class="view-all" href="BuyerMyPageOrderList.by" title="전체보기">전체</a>
                                    </div>
                                    <div class="inquery--content">
                                        <ul class="inquery--list">
                                            <li class="inquery--list-item"><p>${countList[0]}<span class="enter">입금대기중</span></p></li> 
                                            <li class="inquery--list-item"><p>${countList[1]}<span class="enter">배송준비중</span></p></li> 
                                            <li class="inquery--list-item"><p>${countList[2]}<span class="enter">배송중</span></p></li> 
                                            <li class="inquery--list-item complete"><p>${countList[3]}<span class="enter">배송완료</span></p></li> 
                                        </ul>
                                    </div>
                                </div>
                                <div class="inquery__return-exchange">
                                    <div class="inquery--title">
                                        <h2>취소<span class="slash">/</span>교환<span class="slash">/</span>반품 내역</h2>
                                        <a class="view-all" href="BuyerMyPageOrderList.by" title="전체보기">전체</a>
                                    </div>
                                    <ul class="inquery--list">
                                        <li class="inquery--list-item"><p>${countList[4]}<span class="enter">교환신청</span></p></li> 
                                        <li class="inquery--list-item complete"><p>${countList[5]}<span class="enter">교환완료</span></p></li> 
                                        <li class="inquery--list-item"><p>${countList[6]}<span class="enter">반품신청</span></p></li> 
                                        <li class="inquery--list-item complete"><p>${countList[7]}<span class="enter">반품완료</span></p></li> 
                                    </ul>
                                </div>
                            </article>
                            <article id="order__history">
                                <div class="order__history--title">
                                    <h2>주문내역</h2>
                                    <a class="view-all" href="BuyerMyPageOrderList.by" title="전체보기">전체</a>
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
                                    <c:if test="${fn:length(orderList) ==0 }" >
                                        <tr>
                                            <td class="non-post" colspan="4">
                                                주문내역이 없습니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                      </c:if>
                                      <c:if test="${fn:length(orderList) > 5}">
	                                      <c:forEach var="list" items="${orderList}"  end="5" varStatus="status">
                                      		<tr>
                                      			<td>${list.order_id}</td>
                                      			<td>${list.board_title }</td>
                                      			<td>${list.price}원</td>
                                      			<td>${fn:substring(list.order_date,0,11)}</td>
                                      		</tr>
	                                      </c:forEach>                                      
                                      </c:if>
                                      <c:if test="${fn:length(orderList) < 5 }">
                                      	  <c:forEach var="list" items="${orderList}"  varStatus="status">
                                      		<tr>
                                      			<td>${list.order_id}</td>
                                      			<td>${list.board_title }</td>
                                      			<td>${list.price}원</td>
                                      			<td>${fn:substring(list.order_date,0,11)}</td>
                                      		</tr>
	                                      </c:forEach>
                                      </c:if>
                                    </tbody>
                                </table>
                            </article>
                        </section>
	       			</section>
	       		 </div>	
       		</div>
        </div>	    
    </main>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>