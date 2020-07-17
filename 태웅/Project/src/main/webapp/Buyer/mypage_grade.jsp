<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_grade.css?after'/>" rel="stylesheet" />
    <title>나의 등급</title>
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
              <strong>나의 등급</strong>
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
                  <article id="myPage">
                     <h2 class="content-title">나의 등급</h2>
                      <div class="my_grade--grade">
                     	<div class="grade-desc">
	                     	<dl>
	                     		<dt class="cumulativeAmount">누적 구매금액 / 10</dt>
	                     		<dd class="amount">1,965,087원<span class="text-lighter"> / 10</span></dd>
	                   		</dl>
	                   		<dl>
	                     		<dt class="grade-score text-green">현재 등급점수</dt>
	                     		<dd class="amount text-green">0점</dd>
	                     	</dl>
                     	</div>
                     	<div class="grade-explain">
	                     	<p>- 회원 등급 점수는 누적 구매금액 /10 로 결정됩니다.</p>
	                     	<p>- 회원 등급에 따라 이웃# 등급 할인, 적리금 추가 지급 등의 혜택이 주어집니다</p>
	                     	<p>- 누적 구매 금액은 최근 5년 치가 반영됩니다.</p>
                     	</div>
                     </div>
                     <div class="grade-benefit">
                     	<h2>등급별 혜택</h2>
                     	<table id="benefit-table" >
                     		<thead>
                     			<tr>
                     				<th></th>
                     				<th scope="row">LV.1<th>
                     				<th scope="row">LV.2<th>
                     				<th scope="row">LV.3<th>
                     				<th scope="row">LV.4<th>
                     			</tr>
                     		
                     				<tr>
                     					<th scope="col">등급 점수</th>
                     					<td>회원가입 ~ 2000</td>
                     					<td>2001 ~ 10,000</td>
                     					<td>10,001 ~ 100,000</td>
                     					<td>100,001 ~ 200,000</td>
                     				</tr>
                     				<tr>
                     					<th scope="col">이웃# 혜택</th>
                     					<td></td>
                     					<td>-이웃# 추가 할인 1%<span class="enter">-이웃# 추가 적립 1%</span></td>
                     					<td>-이웃# 추가 할인 2%<span class="enter">-이웃# 추가 적립 1%</span></td>
                     					<td>-이웃# 추가 할인 2%<span class="enter">-이웃# 추가 적립 2%</span></td>
                     				</tr>
                     		</tbody>
                     		<thead>
                     			<tr>
                     				<th></th>
                     				<th scope="row">LV.5<th>
                     				<th scope="row">LV.6<th>
                     				<th scope="row">LV.7<th>
                     				<th scope="row">LV.8<th>
                     			</tr>
                     		</thead>
                     		<tbody>
                     				<tr>
                     					<th scope="col">등급 점수</th>
                     					<td>200,001 ~ 500,000</td>
                     					<td>500,001 ~ 1,000,000</td>
                     					<td>1,000,001 ~ 2,000,000</td>
                     					<td>2,000,001 ~ </td>
                     				</tr>
                     				<tr>
                     					<th scope="col">이웃# 혜택</th>
                     					<td>-이웃# 추가 할인 3%<span class="enter">-이웃# 추가 적립 2%</span></td>
                     					<td>-이웃# 추가 할인 3%<span class="enter">-이웃# 추가 적립 3%</span></td>
                     					<td>-이웃# 추가 할인 4%<span class="enter">-이웃# 추가 적립 3%</span></td>
                     					<td>-이웃# 추가 할인 4%<span class="enter">-이웃# 추가 적립 4%</span></td>
                     				</tr>
                     		</tbody>
                     	</table>
                     </div>
                     </article>    
              </section>      
            </div>
        </div>
    </div>
</main>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>  
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>