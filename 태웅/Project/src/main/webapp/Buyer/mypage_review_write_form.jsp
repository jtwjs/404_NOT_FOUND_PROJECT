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
    <link href="<c:url value='/resources/css/Buyer/mypage_review_write_form.css?after'/>" rel="stylesheet" />
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
	  		<li>
	  			<strong>후기작성</strong>
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
                        <h2 class="content-title">후기작성</h2>
                            
                           
                            <div class="write-explain">
                            	<p class="explain">- 일반 후기 작성 시, 500원의 적립금을 드립니다. </p>
                            	<p class="explain">- 후기 내용은 20자 이상 작성합니다. 단순 문자 및 기호의 나열/반복은 적립금이 지급되지 않습니다.</p>
                            	<p class="explain">- 이메일,휴대전화 번호 등의 개인 정보/광고/비속어가 포함된 후기는 블라인드 처리됩니다.</p>
                            	<p class="explain">- 등록하신 후기는 공개되어 회원이 조회가능합니다</p>
                            </div>
                            <article id="review_write">
                            	<dl class="item-info">
                            		<dt><img src="display?path=${item.thumbnail_thum_path}&name=${item.thumbnail_thum}"/></dt>
                            		<dd><p class="item-title">${item.product_country} / ${item.product_name}<span class="enter bold">${item.title}</span></p></dd>
                            	</dl>
                            	<form id="review_form" action="/project/BuyerMyPageReviewWriteRegist" method="POST">
	                            	<div class="satisfaction">
	                            		<dl class="item-satisfaction">
	                            			<dt>상품 만족도</dt>
	                            			<dd>
	                            				<a href="#a" class="score-0_5"></a>
	                            				<a href="#a" class="score-1"></a>
	                            				<a href="#a" class="score-1_5"></a>
	                            				<a href="#a" class="score-2"></a>
	                            				<a href="#a" class="score-2_5"></a>
	                            				<a href="#a" class="score-3"></a>
	                            				<a href="#a" class="score-3_5"></a>
	                            				<a href="#a" class="score-4"></a>
	                            				<a href="#a" class="score-4_5"></a>
	                            				<a href="#a" class="score-5"></a>
	                           				</dd>
	                            		</dl>
	                            		<input type="hidden" id="satisfaction" name="satisfaction"  />
	                            		<dl class="delivery-satisfaction">
	                            			<dt>배송 만족도</dt>
	                            			<dd>
	                            				<a href="#a" class="score-0_5"></a>
	                            				<a href="#a" class="score-1"></a>
	                            				<a href="#a" class="score-1_5"></a>
	                            				<a href="#a" class="score-2"></a>
	                            				<a href="#a" class="score-2_5"></a>
	                            				<a href="#a" class="score-3"></a>
	                            				<a href="#a" class="score-3_5"></a>
	                            				<a href="#a" class="score-4"></a>
	                            				<a href="#a" class="score-4_5"></a>
	                            				<a href="#a" class="score-5"></a>
	                            			</dd>
	                            		</dl>
	                            		<input type="hidden" id="delivery_satisfaction" name="delivery_satisfaction"  />
	                            		<input type="hidden" name="title" value="${item.title}" />
	                            		<input type="hidden" name="board_id" value="${item.board_id}" />
	                            		<input type="hidden" name="order_id" value="${order_id}" />
	                            	</div>
	                            	<div class="product_review">
	                            		<label for="goods_text" class="label">상품에 대한 평가를 20자 이상 작성해 주세요</label>
	                            		<textarea name="content" id="goods_text" placeholder="내용을 입력해주세요" ></textarea>
	                            	</div>
	                            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            	</form>
                            	<div class="regist_review">
                            		<button type="button" id="submitBtn"> 등록 </button>
                           		</div>
                            </article>

                    </section>
	            </section>
	        </div>	
        </div>
    </div>	    
    </main>
    

    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_review_write_form.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>