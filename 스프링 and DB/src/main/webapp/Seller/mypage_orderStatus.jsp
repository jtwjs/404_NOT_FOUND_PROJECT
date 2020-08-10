<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.order.OrderRecordVO" %>
<%@ page import="com.spring.util.PageMaker" %>
<%
    SimpleDateFormat format_time = new SimpleDateFormat("yyyy-MM-dd");
    String today = format_time.format(Calendar.getInstance().getTime());
    
    ArrayList<OrderRecordVO> vo_list = null;
    if((ArrayList<OrderRecordVO>)request.getAttribute("vo_list") != null){
    	vo_list = (ArrayList<OrderRecordVO>)request.getAttribute("vo_list");
    }
    
    String status_data = null;
    if((String)request.getAttribute("status_data") != null){
    	status_data = (String)request.getAttribute("status_data");
    }
    
    String payment_data = null;
    if((String)request.getAttribute("payment_data") != null){
    	payment_data = (String)request.getAttribute("payment_data");
    }
    
    String start_date = null;
    if((String)request.getAttribute("start_date") != null){
    	start_date = (String)request.getAttribute("start_date");
    }
    
    String end_date = null;
    if((String)request.getAttribute("end_date") != null){
    	end_date = (String)request.getAttribute("end_date");
    }
    
    int vo_count = 0;
    if((int)request.getAttribute("vo_count") != 0){
    	vo_count = (int)request.getAttribute("vo_count");
    }
    
    PageMaker pageMaker = null;
    if((PageMaker)request.getAttribute("PageMaker") != null){
    	pageMaker = (PageMaker)request.getAttribute("PageMaker");
    }
    
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
<body onload="setView('<%=status_data%>', '<%=payment_data%>');">
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
                                action="SellerOrderStatus.se" onsubmit="">
                                <div id="content__status-search--box">
                                
                                    <div id="content__search-box--title">
                                        <span>주문 검색</span>
                                    </div>
                                    <div id="content__search-box--status">
                                        <div class="search-box--title">주문상태</div>
                                        <div id="search-box__status--check">
                                            <input type="checkbox" name="status" class="status" value="결제확인중" /> 결제확인중
                                            <input type="checkbox" name="status" class="status" value="상품준비중" /> 상품준비중
                                            <input type="checkbox" name="status" class="status" value="배송준비중" /> 배송준비중
                                            <input type="checkbox" name="status" class="status" value="배송중" /> 배송중
                                            <input type="checkbox" name="status" class="status" value="배송완료" /> 배송완료
                                            <input type="checkbox" name="status" class="status" value="거래완료" /> 거래완료
                                            <input type="checkbox" name="status" class="status" value="반송중" /> 반송중
                                            <input type="checkbox" name="status" class="status" value="환불확인중" /> 환불확인중
                                            <input type="checkbox" name="status" class="status" value="환불완료" /> 환불완료
                                            <input type="checkbox" name="status" class="status" value="주문취소중" /> 주문취소중
                                            <input type="checkbox" name="status" class="status" value="주문취소완료" /> 주문취소완료
                                        </div>
                                    </div>
                                    
                                    <div id="content__search-box--date">
                                        <div class="search-box--title">처리일자</div>
                                        <div id="search-box__order-date">
                                            <input type="date" max="<%=today %>" name="start_date" value="<%=start_date%>" /> 
                                            ~ <input type="date" max="<%=today %>" name="end_date" value="<%=end_date%>" />
                                        </div>
                                    </div>
                                    <div id="content__search-box--payment-method">
                                        <div class="search-box--title">결제방법</div>
                                        <div id="search-box__payment-method">
                                            <input type="checkbox" name="order_payment" class="order_payment" value="신용카드" /> 신용카드
                                            <input type="checkbox" name="order_payment" class="order_payment" value="카카오페이" /> 카카오페이
                                            <input type="checkbox" name="order_payment" class="order_payment" value="가상계좌" /> 가상계좌
                                            <input type="checkbox" name="order_payment" class="order_payment" value="무통장입금" /> 무통장입금
                                            <input type="checkbox" name="order_payment" class="order_payment" value="실시간계좌" /> 실시간계좌
                                            <input type="checkbox" name="order_payment" class="order_payment" value="무통장입금(에스크로)" /> 무통장입금(에스크로)
                                        </div>
                                    </div>
                                    
                                    <div id="content__search-box--submit">
                                        <input type="submit" value="조회하기" />
                                        <input type="reset" value="취소하기" onclick="resetDate();"/>
                                    </div>
                                    
                                </div>
                            </form>
                            </article>

                            <article id="transaction__detail">
                            
                                <div id="list__search--count">
                                    <strong>검색된 결과 <span><%=vo_count%></span> 건</strong>
                                </div>
                                
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
                                    <%if(vo_list.size() != 0){ 
                                        for(int i = 0; i < vo_list.size(); i++){%>
                                        <tr>
                                            <td>
                                                <input type="button" value="<%=vo_list.get(i).getOrder_id() %>" 
                                                    class="table-list__order-id" onclick="orderReceiptView(this, '<%=vo_list.get(i).getBoard_id()%>', '<%=i%>');" />
                                            </td>
                                            <td>
                                                <a class="table-list__board-title--view" 
                                                    href="BoardProductView2.bo?board_id=<%=vo_list.get(i).getBoard_id()%>">
                                                <%=vo_list.get(i).getBoard_title() %>
                                                </a>
                                            </td>
                                            <td><%=vo_list.get(i).getBuyer_id() %></td>
                                            <td><%=vo_list.get(i).getOrder_payment() %></td>
                                            <td><%=vo_list.get(i).getPrice() %></td>
                                            <td><%=vo_list.get(i).getOrder_date() %></td>
                                            <td>
                                                <input type="button" value="<%=vo_list.get(i).getStatus() %>" 
                                                    class="table-list__order-status" onclick="" />
                                            </td>
                                        </tr>
                                    <%}
                                    }else{ %>
                                        <tr>
                                            <td class="non-post" colspan="7">등록된 주문내역이 없습니다.</td>
                                        </tr>
                                    <%} %>
                                    </tbody>
                                </table>
                                
                                <div id="list__paging">
                                    <div id="list__paging--prev">
                                    <%if(pageMaker.isPrev()){ %>
                                        <input type="button" value="이전" id="prev-btn" 
                                            onclick="repagingPrev('<%=pageMaker.getPage_num()%>');" />
                                    <%}else{ %>
                                        <input type="button" value="이전" id="prev-btn--disabled" disabled />
                                    <%} %>
                                    </div>
                                    
                                    <%if(vo_count != 0){ %>
                                    <div id="list__paging--page">
                                    <ul id="list__paging--nav">
                                        <%for(int i = pageMaker.getStartPage(); i <= pageMaker.getEndPage(); i++){ 
                                            if(i == pageMaker.getPage_num()){%>
                                        <li id="list__paging--num-now"><%=i%></li>
                                            <%}else{ %>
                                        <li class="list__paging--num" onclick="pageMove('<%=i%>');"><%=i%></li>
                                        <%    }
                                        } %>
                                    </ul>
                                    </div>
                                    <%} %>
                                    
                                    <div id="list__paging--next">
                                    <%if(pageMaker.isNext()){ %>
                                        <input type="button" value="다음" id="next-btn" 
                                            onclick="repagingNext('<%=pageMaker.getPage_num()%>');" />
                                    <%}else{ %>
                                        <input type="button" value="다음" id="next-btn--disabled" disabled />
                                    <%} %>
                                    </div>
                                </div>
                                
                                <div id="modal">
                                    <div id="modal-content">
                                        <input type="hidden" value="" id="modal-board_id" />
                                        <input type="hidden" value="" id="modal-status-index" />
                                        <div>
                                            <input type="button" value="x" id="modal-close" onclick="modal_close();" />
                                        </div>
                                        
                                        <p id="modal__order-title">주문 내역</p>
                                        
                                        <div id="modal__order-content">
                                        
                                            <div class="order-content__table--title">
                                                <span>주문정보</span>
                                                <span>배송정보</span>
                                            </div>
                                            <div class="order-content__table">
                                            
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문번호</div>
                                                    <div class="order-content__table--content order_id"></div>
                                                    <div class="order-content__table--subject">배송주소</div>
                                                    <div class="order-content__table--content order_address">
                                                        <span></span>
                                                        <input type="button" value="변경" class="order-content__display-btn"  
                                                            onclick="modifyDisplayOpen(this, 'order_addr--display');" />
                                                        <div id="order_addr--display" class="slide-up" style="display: none;">
                                                            <input type="text" value="" id="order__addr-text"
                                                                class="order-content__modify--text" maxlength="50" />
                                                            <input type="button" value="수정" class="order-content__modify--btn" 
                                                                onclick="orderAddrModify();" />
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문일자</div>
                                                    <div class="order-content__table--content order_date"></div>
                                                    <div class="order-content__table--subject">받으실 분</div>
                                                    <div class="order-content__table--content order_name">
                                                        <span></span>
                                                        <input type="button" value="변경" class="order-content__display-btn"  
                                                            onclick="modifyDisplayOpen(this, 'order_name--display');" />
                                                        <div id="order_name--display" class="slide-up" style="display: none;">
                                                            <input type="text" value="" id="order__name-text"
                                                                class="order-content__modify--text" maxlength="8" />
                                                            <input type="button" value="수정" class="order-content__modify--btn" 
                                                                onclick="orderNameModify();" />
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문자</div>
                                                    <div class="order-content__table--content buyer_id"></div>
                                                    <div class="order-content__table--subject">배송 연락처</div>
                                                    <div class="order-content__table--content order_phone">
                                                        <span></span>
                                                        <input type="button" value="변경" class="order-content__display-btn"  
                                                            onclick="modifyDisplayOpen(this, 'order_phone--display');" />
                                                        <div id="order_phone--display" class="slide-up" style="display: none;">
                                                            <input type="text" value="" id="order__phone-text"
                                                                class="order-content__modify--text" maxlength="13" />
                                                            <input type="button" value="수정" class="order-content__modify--btn" 
                                                                onclick="orderPhoneModify();" />
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문상태</div>
                                                    <div class="order-content__table--content order_status">
                                                        <select id="order-status__select" style="width: 60%;" 
                                                            onchange="orderStatusModify();">
                                                            <option value="">주문상태</option>
                                                            <option value="결제확인중">결제확인중</option>
                                                            <option value="상품준비중">상품준비중</option>
                                                            <option value="배송준비중">배송준비중</option>
                                                            <option value="배송중">배송중</option>
                                                            <option value="배송완료">배송완료</option>
                                                            <option value="환불확인중">환불확인중</option>
                                                            <option value="반송중">반송중</option>
                                                            <option value="환불완료">환불완료</option>
                                                            <option value="주문취소중">주문취소중</option>
                                                            <option value="주문취소완료">주문취소완료</option>
                                                            <option value="거래완료" disabled>거래완료</option>
                                                        </select>
                                                    </div>
                                                    <div class="order-content__table--subject">택배회사</div>
                                                    <div class="order-content__table--content order_delivery">
                                                        <select id="order_delivery__select" style="width: 60%;" 
                                                            onchange="orderDeliveryModify();">
                                                            <option value="">배송사</option>
                                                            <option value="우체국택배">우체국택배</option>
                                                            <option value="CJ대한통운">CJ대한통운</option>
                                                            <option value="한진택배">한진택배</option>
                                                            <option value="롯데택배">롯데택배</option>
                                                            <option value="로젠택배">로젠택배</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문자 연락처</div>
                                                    <div class="order-content__table--content buyer_phone"></div>
                                                    <div class="order-content__table--subject">운송장 번호</div>
                                                    <div class="order-content__table--content order_invoicenum">
                                                        <span></span>
                                                        <input type="button" value="변경" class="order-content__display-btn"  
                                                            onclick="modifyDisplayOpen(this, 'order_invoicenum--display');" />
                                                        <div id="order_invoicenum--display" class="slide-up" style="display: none;">
                                                            <input type="text" value="" id="order__invoicenum-text"
                                                                class="order-content__modify--text" maxlength="20" />
                                                            <input type="button" value="수정" class="order-content__modify--btn" 
                                                                onclick="orderInvoicenumModify();" />
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                            
                                            <div class="order-content__table--title">
                                                <span>결제정보</span>
                                            </div>
                                        
                                            <div class="order-content__table">
                                            
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문금액</div>
                                                    <div class="order-content__table--content order_price"></div>
                                                    <div class="order-content__table--subject">배송비</div>
                                                    <div class="order-content__table--content delivery_price"></div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">적립금</div>
                                                    <div class="order-content__table--content save_point"></div>
                                                    <div class="order-content__table--subject">사용 적립금</div>
                                                    <div class="order-content__table--content use_point"></div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문자 ID</div>
                                                    <div class="order-content__table--content order--buyer_id"></div>
                                                    <div class="order-content__table--subject">주문자 이름</div>
                                                    <div class="order-content__table--content order--buyer_name"></div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">결제방식</div>
                                                    <div class="order-content__table--content cell--order_payment"></div>
                                                    <div class="order-content__table--subject">결제계좌/카드번호</div>
                                                    <div class="order-content__table--content order_account"></div>
                                                </div>
                                                
                                                <div class="order-content__table--row">
                                                    <div class="order-content__table--subject">주문수량</div>
                                                    <div class="order-content__table--content amount"></div>
                                                    <div class="order-content__table--subject">총 결제금액</div>
                                                    <div class="order-content__table--content totPrice"></div>
                                                </div>
                                                
                                            </div>
                                            
                                        </div>
                                        
                                        
                                        
                                    </div>
                                </div>
                            </article>

                    </section>
	            </section>
	        </div>	
        </div>
    </div>	    
    </main>
    


    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_orderStatus.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>