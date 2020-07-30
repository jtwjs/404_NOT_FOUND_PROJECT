<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_orderList.css'/>" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <title>주문 내역</title>
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
	  			<strong>주문내역</strong>
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
                        <h2 class="content-title">주문내역</h2>
                        	<div class="search-date">
                            	<div class="date-filter_wrap">
                            		<input type="radio" id="1week" value="1week" name="dateSelect" class="hide" />
                            		<label for="1week" class="date_label" id="1week_label">1주일</label>
                            		<input type="radio" id="1month" value="1month" name="dateSelect" class="hide" />
                            		<label for="1month" class="date_label" id="1month_label">1개월</label>
                            		<input type="radio" id="3month" value="3month" name="dateSelect" class="hide" />
                            		<label for="3month" class="date_label" id="3month_label">3개월</label>
                            		<input type="radio" id="all_date" value="all_date" class="hide"  checked/>
                            		<label for="all_date" class="date_label" id="all_label">전체 시기</label>
                            	</div>
                            	<div class="date-select_wrap">
                            		<input type="text" name="startDate" id="startDate" class="datePicker" readonly  />
                            		<img src="./resources/Images/Buyer/date_range_24px_rounded.png" id="start_calender" alt="달력이미지"/>
                            		<input type="text" name="endDate" id="endDate" class="datePicker" readonly />
                            		<img src="./resources/Images/Buyer/date_range_24px_rounded.png" id="end_calender" alt="달력이미지"/>

                            	</div>
                            	<div class="submitBtn_wrap">
                            		<button type="button" id="dateSubmit" >조회</button>
                            	</div>
                           	</div>
                            
                            <article id="transaction__detail">

                                <table class="transaction__detail--table">
                                    <thead>
                                        <tr>
                                            <th class="order-number">주문번호</th>                
                                            <th class="board-name">상품명</th>       
                                            <th class="order-amount">수량</th>       
                                            <th class="order-price">구매가격</th>       
                                            <th class="order-date">구매일</th>       
                                            <th class="order-status">주문상태</th>       
                                        </tr>   
                                    </thead>
                                    <tbody>
	                              	<c:choose>
	                              		<c:when test="${fn:length(orderList)==0}">
                                        <tr>
                                            <td class="non-post" colspan="6">
                                                주문내역이 없습니다.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                      </c:when>
                                      <c:otherwise>
                                      	<c:forEach var="orderList" items="${orderList}" varStatus="status">
                                      		<tr class="">
                                      			<td><a href="OrderResearch.or?order_id=${orderList.order_id}">${orderList.order_id}</a></td>
                                      			<td class="imgWrap">
                                      				<a href="BoardProductView.bo?board_id=${orderList.board_id}">
	                                      				<img src="display?path=${orderList.thumbnail_thum_path}&name=${orderList.thumbnail_thum}" class="product_img" alt="상품 이미지"/>
	                                      			${orderList.board_title}
	                                      			</a>
                                      			</td>
                                      			<td>${orderList.amount}</td>
                                      			<td>${orderList.price}</td>
                                      			<td>${orderList.order_date}</td>
                                      			<td>${orderList.status}</td>
                                      		</tr>
                                      	</c:forEach>
                                      </c:otherwise>
                                   </c:choose>
                                    </tbody>
                                </table>
                                <div class="n-paging">
                     		<ul>
                     			<c:if test="${pageMaker.prev}">
                     				<li><a href="BuyerMyPageOrderList.by${pageMaker.makeQuery(pageMaker.startPage - 1,startDate,endDate)}" class="prev">이전</a></li>
                     			</c:if>
                     			
                     			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                     				<c:if test="${currentPage eq idx}">
                     				<li><a href="BuyerMyPageOrderList.by${pageMaker.makeQuery(idx,startDate,endDate)}" class="page active">${idx}</a></li>
                     				</c:if>
                     				<c:if test="${currentPage ne idx}">
                     				<li><a href="BuyerMyPageOrderList.by${pageMaker.makeQuery(idx,startDate,endDate)}" class="page">${idx}</a></li>
                     				</c:if>
                     			</c:forEach>
                     			
                     			<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
                     				<li><a href="BuyerMyPageOrderList.by${pageMaker.makeQuery(pageMaker.endPage + 1,startDate,endDate)}" class="next">다음</a></li>
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
    
	<script type="text/javascript" src="<c:url value='/resources/js/Buyer/date_search.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
    <!-- footer,js -->
    
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
    <!--  date-picker -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" ></script>
</body>
</html>