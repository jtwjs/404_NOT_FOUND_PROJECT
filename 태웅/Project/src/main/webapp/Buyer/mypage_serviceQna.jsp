<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_productQna.css'/>" rel="stylesheet" />
     <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <title>1:1 문의</title>
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
	  			<strong>1:1 문의</strong>
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
                        <h2 class="content-title">1:1 문의</h2>
                        
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
                                            <th class="qna-number">번호</th>                
                                            <th class="qna-title">제목</th>                
                                            <th class="qna-date">등록일</th>                
                                            <th class="qna-hit">조회수</th>                
                                            <th class="qna-secret">비밀글</th>                
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="non-post" colspan="5">
                                               등록한 문의내용이 없습니다.
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
    
	<script type="text/javascript" src="<c:url value='/resources/js/Buyer/date_search.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
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