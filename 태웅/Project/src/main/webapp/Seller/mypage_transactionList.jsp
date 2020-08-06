<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.order.OrderRecordVO"%>


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
    <link href="<c:url value='/resources/css/Seller/mypage_transactionList.css'/>" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <title>거래 목록</title>
</head>
<body>
  <section id="sub-main" class="mypage">
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
	  		  <strong>거래 목록</strong>
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
                        <h2 class="content-title">거래 목록</h2>
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
                                            <th class="product-name">상품명</th>       
                                            <th class="order-price">가격</th>       
                                            <th class="buyer-id">구매자</th>       
                                            <th class="order-date">구매일</th>       
                                        </tr>   
                                    </thead>
                                    <tbody>                                 
	                                  <c:forEach var="list" items="${orderRecordList}" varStatus="status">
	                                    <tr class="orderList"  >
                                            <td class="order_number" onclick="javascript:location.href='BoardProductView.bo?board_id=${list.board_id}'">${list.order_id}</td>
                                            <td class="product_info" onclick="javascript:location.href='BoardProductView.bo?board_id=${list.board_id}'">
                                            	<img src="display?path=${list.thumbnail_thum_path}&name=${list.thumbnail_thum}" alt="상품이미지">
                                            	${list.board_title}
                                           	</td>
                                            <td>${list.str_tot_price}원</td>
                                            <td>
                                            	<c:if test="${list.non_member_flag eq 'Y' }">
                                            		${list.buyer_name}	
                                            	</c:if>
                                            	<c:if test="${list.non_member_flag eq 'N' }">
                                            		${list.buyer_id}	
                                            	</c:if>
                                            </td>
                                            <td>
                                             	<span>${list.order_date}</span>
                                            </td>
                                        </tr>
	                                  </c:forEach>
                                    </tbody>
                                </table>
                            </article>
                            <div class="n-paging">
									<ul>
										<c:if test="${pageMaker.prev}">
											<li><a
												href="SellerTransactionList.se${pageMaker.makeQuery(pageMaker.startPage - 1,startDate,endDate)}"
												class="prev">이전</a></li>
										</c:if>

										<c:forEach begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}" var="idx">
											<c:if test="${currentPage eq idx}">
												<li><a
													href="SellerTransactionList.se${pageMaker.makeQuery(idx,startDate,endDate)}"
													class="page active">${idx}</a></li>
											</c:if>
											<c:if test="${currentPage ne idx}">
												<li><a
													href="SellerTransactionList.se${pageMaker.makeQuery(idx,startDate,endDate)}"
													class="page">${idx}</a></li>
											</c:if>
										</c:forEach>

										<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
											<li><a
												href="SellerTransactionList.se${pageMaker.makeQuery(pageMaker.endPage + 1,startDate,endDate)}"
												class="next">다음</a></li>
										</c:if>
									</ul>
								</div>
                    </section>
	            </section>
	        </div>	
        </div>
    </div>	    
    </main>
    

    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/date_search.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
    <!--  date-picker -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" ></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" ></script>
</body>
</html>