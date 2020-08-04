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
    <link href="<c:url value='/resources/css/Buyer/mypage_review.css?after'/>" rel="stylesheet" />
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
                            	<a id="review_wrtie" href="#" onclick="javascript:location.href='BuyerMyPageReviewWrite.by'">후기 작성</a>
                            	<a id="review_history" href="BuyerMyPageReview.by">후기 내역</a>
                            </div>
                            <div class="review-explain">
                            	<p class="explain">- 후기 작성시 500원의 적립금이 지급됩니다. </p>
                            	<p class="explain">- 후기작성은 구매확정일로부터 90일까지 가능합니다. </p>
                            </div>
                            <article id="review_history">
                                <table id="review_history--table">
                                    <thead>
                                        <tr>                
                                            <th scope="col" class="product-info">상품정보</th>
                                            <th scope="col" class="review-content">내용</th>                
                                            <th scope="col" class="review-date">작성일</th>                
                                             
                                        </tr>   
                                    </thead>
                                    <tbody>
                                   	<c:if test="${fn:length(reviewList) == 0}">
                                        <tr>
                                            <td class="non-list" colspan="5">
                                               등록한 후기가 없습니다.
                                            </td>
                                        </tr>
                                   
                                   </c:if>
                                   <c:forEach var="list" items="${reviewList}" varStatus="status" >
                                   	<tr>
                                   		<td class="product-title">
                                   			<div class="title-detail">
	                                   			<img src="display?path=${list.review_img_path}&name=${list.review_img_name}" onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'" />
	                                   			<p onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'">${list.title}</p>
                                   			</div>
                               			</td>
                                   		<td class="content">
                                   			<dl class="satisfaction">
                                   				<dt>상품만족도</dt> 
                                   				<dd><img src="${list.satisfaction_img}" alt="구매만족도별점"/></dd>
                                   				<dt>배송만족도</dt>
                                   				<dd><img src="${list.delivery_satisfaction_img}" alt="배송별점"/></dd>
                               				</dl>
                               				<p class="detail">${list.content}</p></td>
                                   		<td>${list.format_reg_date}</td>
                                   	</tr>
                                   	</c:forEach>
                                    </tbody>
                                </table>
                            </article>
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