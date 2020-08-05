<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
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
                                    <tbody>
	                              	<c:choose>
	                              		<c:when test="${fn:length(orderList)==0}">
                                        <tr style="width: 900px;">
                                            <td class="non-post">
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
                                      		
                                      		<tr class="order-list__table--tr">
                                      		    <td>
                                      		        <div class="order-list__status">
                                      		            <span class="order-list__status--span">${orderList.status}</span>
                                      		            <c:set var="orderDate" value="${orderList.order_date}" ></c:set>
                                      		            <%String orderDate = (String)pageContext.getAttribute("orderDate");
                                      		            SimpleDateFormat format_time = new SimpleDateFormat("yyyy-MM-dd");
                                      		            Date today = new Date();
                                      		            Date date = new Date();
                                      		            date = format_time.parse(orderDate);
                                      		            Calendar delivery_date = Calendar.getInstance();
                                      		            delivery_date.setTime(date);
                                      		            delivery_date.add(Calendar.DATE, 2);
                                      		            date = delivery_date.getTime();
                                      		            
                                      		            int compare = today.compareTo(date);
                                      		            int month = delivery_date.get(Calendar.MONTH);
                                      		            int day = delivery_date.get(Calendar.DATE);
                                      		            int day_of_week = delivery_date.get(Calendar.DAY_OF_WEEK);
                                      		            String week = null;
                                      		            
                                      		            if(compare >= 0){ // 배송예정일보다 시간이 지났을 때

                                      		            	delivery_date.setTime(today);
                                      		            	delivery_date.add(Calendar.DATE, 2);

                                      		            	month = delivery_date.get(Calendar.MONTH);
                                          		            day = delivery_date.get(Calendar.DATE);
                                          		            day_of_week = delivery_date.get(Calendar.DAY_OF_WEEK);

                                      		            }
                                      		            
                                      		            switch(day_of_week){
                                      		            case 1:
                                      		            	week = "일";
                                      		            	break;
                                      		            case 2:
                                      		            	week = "월";
                                    		            	break;
                                      		            case 3:
                                      		            	week = "화";
                                  		            	    break;
                                      		            case 4:
                                      		            	week = "수";
                                    		            	break;
                                      		            case 5:
                                      		            	week = "목";
                                  		            	    break;
                                      		            case 6:
                                      		            	week = "금";
                                		            	    break;
                                      		            case 7:
                                      		            	week = "토";
                                    		            	break;
                                      		            }
                                      		            
                                      		             %>
                                      		            <c:if test='${orderList.status ne "배송완료" && orderList.status ne "거래완료" && orderList.status ne "주문취소완료"}'>
                                      		                <span class="order-listt__delivery-schedule"
                                      		                    >해당상품은 <%=month+1%>/<%=day%> (<%=week%>) 에 도착할 예정입니다.</span>
                                      		            </c:if>  
                                      		        </div>
                                      		        <div class="order_list__table--detail">
                                      		            <div class="order_list__detail-info--image">
                                      		                <img src="display?path=${orderList.thumbnail_thum_path}&name=${orderList.thumbnail_thum}" alt="상품 이미지"/>
                                      		            </div>
                                      		            <div class="order_list__detail-info">
                                      		                <div onclick="javascript:location.href='BoardProductView.bo?board_id=${orderList.board_id}'"
                                      		                    class="order-list__title"><span>${orderList.board_title}</span>
                                      		                </div>
                                      		                <div>
                                      		                    <span style="color: #848484;">${orderList.price} 원 / ${orderList.amount} 개</span>
                                      		                </div>
                                      		            </div>
                                      		            <div class="order_list__detail-info--order">
                                      		                <div><strong>주문번호</strong></div>
                                      		                <div style="margin-bottom: 10px;">${orderList.order_id}</div>
                                      		                <div><strong>주문일자</strong></div>
                                      		                <div>${orderList.order_date}</div>
                                      		            </div>
                                      		            <div class="order_list__detail-info--btn">
                                      		                <c:if test='${orderList.status eq "결제확인중" || orderList.status eq "상품준비중" || orderList.status eq "배송준비중"}'>
                                      		                    <input type="button" value="주문취소" 
                                      		                        onclick="orderCancle('${status.index}', '${orderList.order_id}', '${orderList.board_id}');" />
                                      		                    <input type="button" value="배송정보" 
                                      		                        onclick="orderDelivery('${orderList.order_id}', '${orderList.board_id}');" />
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "배송중"}'>
                                      		                    <input type="button" value="배송정보" 
                                      		                        onclick="orderDelivery('${orderList.order_id}', '${orderList.board_id}');" />
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "배송완료"}'>
                                      		                    <input type="button" value="환불신청" 
                                      		                        onclick="orderRefund('${status.index}', '${orderList.order_id}', '${orderList.board_id}');" />
                                      		                    <input type="button" value="구매확정" 
                                      		                        onclick="orderComplete('${status.index}', '${orderList.price}', 
                                      		                            '${orderList.amount}', '${orderList.order_id}', '${orderList.board_id}');" />
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "거래완료"}'>
                                      		                <fmt:parseNumber var="savePoint" integerOnly="true" 
                                      		                    value="${(orderList.price * orderList.amount) *0.03}" />
                                      		                    <span style="color: limegreen; font-size: 17px;">
                                      		                        ${savePoint}P 적립
                                      		                    </span>
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "환불확인중"}'>
                                      		                    <span>환불확인중입니다</span>
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "반송중"}'>
                                      		                    <input type="button" value="배송정보" 
                                      		                        onclick="orderRefund('${orderList.order_id}', '${orderList.board_id}');" />
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "주문취소중"}'>
                                      		                    <span>주문취소중입니다</span>
                                      		                </c:if>
                                      		                <c:if test='${orderList.status eq "주문취소완료"}'>
                                      		                    <span>주문취소완료</span>
                                      		                </c:if>
                                      		            </div>
                                      		            
                                      		        </div>
                                      		       
                                      		    </td>
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
	<script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_orderList.js'/>"></script>
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