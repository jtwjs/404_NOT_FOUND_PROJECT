<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.order.OrderRecordVO"%>

<%
System.out.println("hi1");
    SimpleDateFormat format_time = new SimpleDateFormat("yyyy-MM-dd");
    String today = format_time.format(Calendar.getInstance().getTime());
    
    List<OrderRecordVO> orderRecordList = (List<OrderRecordVO>) request.getAttribute("orderRecordList");
    
System.out.println("hi2");

	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();

System.out.println("hi3");
    
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
    <link href="<c:url value='/resources/css/Seller/mypage_transactionList.css'/>" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <title>거래 목록</title>
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
	                                    <%
											int num = listcount - ((nowpage - 1) * 10);
	                                    System.out.println("123123123:"+orderRecordList.size());
		                                    for(int i = 0; i < orderRecordList.size(); i++) {
		                           
												OrderRecordVO orl = (OrderRecordVO) orderRecordList.get(i);
							
										
										%>										
                                        <tr class="orderList" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=orl.getBoard_id()%>'">
                                            <td><%=orl.getOrder_num() %></td>
                                            <td><%=orl.getBoard_title() %></td>
                                            <td><%=((orl.getAmount()) * (orl.getPrice())) %></td>
                                            <td>
                                            	<%
                                            		if(orl.getNon_member_flag() == 'Y') { 
                                            			//회원 구매자
                                            			System.out.println("회원 구매자 test");
                                            	%>
                                            	<%=orl.getBuyer_id() %>
                                            	<%
                                            		} else { 	
                                            			//비회원 구매자
                                            			System.out.println("비회원 구매자 test");
                                            	%>
                                            	<%=orl.getBuyer_name() %>
                                            	<%	
                                            		}
                                            	%>
                                            </td>
                                            <td>
                                           
                                             	<span><%=orl.getOrder_date() %></span>
                                            </td>
                                        </tr>
                                        
                                        <%
											num--;
										}
										%>
										
										<tr align=center height=20>
											<td class="page" colspan=5 style="font-family: Tahoma; font-size: 10pt;">
												<%
													if (nowpage<=1) {
												%> [이전]&nbsp; <%
													} else {
												%> <a href="./SellerTransactionList.se?page=<%=nowpage-1%>">[이전]</a>&nbsp;
												<%
													}
												%> <%
													for (int a=startpage; a<=endpage; a++) {
													if (a==nowpage) {
												%> [<%=a%>] <%
													} else {
												%> <a href="./SellerTransactionList.se?page=<%=a%>">[<%=a%>]
																					</a> &nbsp; <%
													}
												%> <%
													}
												%> <%
													if (nowpage>=maxpage) {
												%> [다음] <%
													} else {
												%> <a href="./SellerTransactionList.se?page=<%=nowpage+1%>">[다음]</a> <%
													}
												%>
											</td>
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