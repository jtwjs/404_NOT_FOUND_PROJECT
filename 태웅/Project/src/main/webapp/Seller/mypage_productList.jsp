<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_productList.css?after'/>" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <title>상품 내역</title>
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
	  		  <strong>상품내역</strong>
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
                        <h2 class="content-title">상품내역</h2>
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
                                            <th class="board-number">번호</th>                
                                            <th class="board-name">글제목</th>       
                                            <th class="evaluation-score">평가점수</th>       
                                            <th class="board-write-date">등록일</th>       
                                            <th class="board-sell-status">판매여부</th>       
                                            <th class="board-modify">상품수정</th>       
                                        </tr>   
                                    </thead>
                                    <tbody>

                                    	<c:set var="list" value="${productList}" />
                                    <c:choose>
										<c:when test="${fn:length(list) == 0}" >
                                        <tr>
                                            <td class="non-post" colspan="6">
                                                등록된 상품내역이 없습니다.
                                            </td>
                                        </tr>
                                        </c:when>
                                        <c:otherwise>
                                        <c:forEach items="${productList}" var="list" varStatus="status">
                                        	<tr>
                                            <td>
                                               ${status.count}
                                            </td>
                                            <td class="product-title">
	                                            <img src="display?path=${list.thumbnail_thum_path}&name=${list.thumbnail_thum}" onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'"/>
	                                            <p onclick="location.href='BoardProductView.bo?board_id=${list.board_id}'">
	                                            ${list.title}
                                            	</p>
                                               
                                            </td>
                                            <td>
                                               ${list.satisfaction}
                                            </td>
                                            <td>
                                            <fmt:formatDate value="${list.register_date}" pattern="yy-MM-dd" var ="registerDate"/>
                                               ${registerDate}
                                
                                            </td>
                                            <td>
                                               ${list.content_origin}
                                            </td>
                                            <td>
                                                <input type="button" value="상품수정" class="product-modify"
                                                    onclick="javascript:location.href='SellerProductModifyForm.se?board_id=${list.board_id}'" />
                                                    
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
                     				<li><a href="SellerProductList.se${pageMaker.makeQuery(pageMaker.startPage - 1,startDate,endDate)}" class="prev">이전</a></li>
                     			</c:if>
                     			
                     			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                     				<c:if test="${currentPage eq idx}">
                     				<li><a href="SellerProductList.se${pageMaker.makeQuery(idx,startDate,endDate)}" class="page active">${idx}</a></li>
                     				</c:if>
                     				<c:if test="${currentPage ne idx}">
                     				<li><a href="SellerProductList.se${pageMaker.makeQuery(idx,startDate,endDate)}" class="page">${idx}</a></li>
                     				</c:if>
                     			</c:forEach>
                     			
                     			<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
                     				<li><a href="SellerProductList.se${pageMaker.makeQuery(pageMaker.endPage + 1,startDate,endDate)}" class="next">다음</a></li>
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
    

    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/date_search.js'/>"></script>
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