<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
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
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_review_write.css?after'/>" rel="stylesheet" />
    <title>구매후기</title>
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
	  			<strong>구매후기</strong>
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
                        <h2 class="content-title">구매후기</h2>
                            
                            <div class="review_menu">
                            	<a id="review_wrtie" href="BuyerMyPageReviewWrite.by">후기 작성</a>
                            	<a id="review_history" href="BuyerMyPageReview.by">후기 내역</a>
                            </div>
                            <div class="review-explain">
                            	<p class="explain">- 후기 작성시 500원의 적립금이 지급됩니다. </p>
                            	<p class="explain">- 후기작성은 구매확정일로부터 90일까지 가능합니다. </p>
                            </div>
                            <article id="review_history">
                                <table id="order_history--table">
                                    <thead>
                                        <tr>                
                                            <th scope="col" class="product-info">상품정보</th>
                                            <th scope="col" class="purchase-date">구매일</th>  
                                            <th scope="col" class="review-write">일반 후기</th>                
                                             
                                        </tr>   
                                    </thead>
                                    <tbody>
                                   	<c:if test="${fn:length(orderList) == 0}">
                                        <tr>
                                            <td class="non-list" colspan="5">
                                               주문한 상품이 없습니다.
                                            </td>
                                        </tr>
                                   
                                   </c:if>
                                   <c:forEach var="list" items="${orderList}" varStatus="status" >
                                   	<tr>
                                   		<td class="product-title"><img src="display?path=${list.thumbnail_thum_path}&name=${list.thumbnail_thum}" onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'"/><p onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'">${list.board_title}</p></td>
                                   		<c:if test="${list.reviewCheck eq true}">
                                   		<td class="order-date">${list.order_date}</td>
                                   		<td><button type="button" class="reviewBtn" onclick="location.href='BuyerMyPageReviewWriteForm.by?board_id=${list.board_id}&order_id=${list.order_id}'">작성하기</button></td>
                                   		
                                   		</c:if>
                                   		<c:if test="${list.reviewCheck eq false }" >
                                   		<td class="last_order-date">${list.order_date}</td>
                                   		<td><span class="complete">작성 완료</span><span class="enter">(적립금 지급)</span></td>
                                   		</c:if>
                               		
                                   	</tr>
                                   	</c:forEach>
                                  
                                    </tbody>
                                </table>
                                <div class="n-paging">
                     		<ul>
                     			<c:if test="${pageMaker.prev}">
                     				<li><a href="BuyerMyPageReview.by${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="prev">이전</a></li>
                     			</c:if>
                     			
                     			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                     				<c:if test="${currentPage eq idx}">
                     				<li><a href="BuyerMyPageReview.by${pageMaker.makeQuery(idx)}" class="page active">${idx}</a></li>
                     				</c:if>
                     				<c:if test="${currentPage ne idx}">
                     				<li><a href="BuyerMyPageReview.by${pageMaker.makeQuery(idx)}" class="page">${idx}</a></li>
                     				</c:if>
                     			</c:forEach>
                     			
                     			<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
                     				<li><a href="BuyerMyPageReview.by${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="next">다음</a></li>
                     			</c:if>
                     		</ul>
                     	</div>
                            </article>

                    </section>
	            </section>
	        </div>	
        </div>
    </div>	    
    </main>
    

    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>