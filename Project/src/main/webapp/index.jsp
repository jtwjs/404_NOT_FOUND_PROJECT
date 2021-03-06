<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList<BoardProductVO> vo_list = null;
    if((ArrayList<BoardProductVO>)request.getAttribute("vo_list") != null){
    	vo_list = (ArrayList<BoardProductVO>)request.getAttribute("vo_list");
    }
    
    int indexRedirect = 0;
    if((String)request.getAttribute("indexRedirect") != null){
    	indexRedirect = 1;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/module/side.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Home/index.css'/>" rel="stylesheet" />
    <title>Home</title>
</head>
<body onload="checkRedirect('<%=indexRedirect%>');">
    <main id="main">
        <section id="main__visual1">
        	<div id="control">
        		<ul>
        			<li>
        				<a id="control_item-1" href="#"class="on">1</a>
        			</li>
        			<li>
        				<a id="control_item-2" href="#">2</a>
        			</li>
        			<li>
        				<a id="control_item-3" href="#">3</a>
        			</li>
        		</ul>
        	</div>
			<article id="main__visual1--slider">
				<ul>
					<li id="list-item1" class="on">
						<div class="slide-page1">
						</div>
						<div class="slider__slogon">
							<div class="slider__slogon--title">
								<h2>바른먹거리, 신뢰와 상생</h2> 
								<span class="main_title">농산물 직거래 플랫폼
								<span class="enter subtitle">우리 지역 농산물의 <strong>신선함</strong>을 그대로 전달해드립니다</span></span>
							</div>
						</div>
					</li>
					<li id="list-item2" >
						<div class="slide-page2">
						</div>
						<div class="slider__slogon">
							<div class="slider__slogon--title">
								<h2>바른먹거리, 신뢰와 상생</h2>
								<span class="main_title">농산물 직거래 플랫폼
								<span class="enter subtitle">우리 지역 농산물의 <strong>신선함</strong>을 그대로 전달해드립니다</span></span>
							</div>
						</div>
					</li>
					<li id="list-item3" >
						<div class="slide-page3">
						</div>
						<div class="slider__slogon">
							<div class="slider__slogon--title">
								<h2>바른먹거리, 신뢰와 상생</h2>
								<span class="main_title">농산물 직거래 플랫폼
								<span class="enter subtitle">우리 지역 농산물의 <strong>신선함</strong>을 그대로 전달해드립니다</span></span>
							</div>
						</div>
					</li>
				</ul>
			</article> 
        </section>
        <section id="main__visual2">
       		 <div class="remote-controller">
		      		<button id="controller-left" type="button" class="disable">
		      		</button>
		      		<button id="controller-right" type="button">
		      		</button> 
	 		</div>
          <article id="best-product">
          	<div class="best-product--head">
          		<!-- <h2>이달의 상품</h2> -->
          		<h2 class="product--head-title">Best</h2>
          		
          	</div>
          	<div class="best-product--content">
          		<ul id="best-product--list">
          		<%if(vo_list != null){ 
          			int count = 0;
          			int max = vo_list.size();
          			if(max > 10){
          				max = 10;
          			}
          			%>
          			<%for(int i = 0; i < max; i++){ %>
          			    <li class="product--list-item">
        				<div class="item-img">
	        				<button type="button">
	        					<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
	        				</button>
	        				<%if(vo_list.get(i).getProduct_thum_1() != null){ %>
	       					<img class="product-image" 
	       					    src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum(), "UTF-8") %>" alt="product image"/>
	       					<%}else if(vo_list.get(i).getProduct_thum_2() != null){ %>
	       					<img class="product-image" 
	       					    src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_2(), "UTF-8") %>" alt="product image"/>
	       					<%}else if(vo_list.get(i).getProduct_thum_3() != null){ %>
	       					<img class="product-image" 
	       					    src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_3(), "UTF-8") %>" alt="product image"/>
	       					<%}else{ %>
	       					<img class="product-image" 
	       					    src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getProduct_origin_4(), "UTF-8") %>" alt="product image"/>
	       					<%} %>
     					</div>
	       				<div class="item-desc">
	       					<div class="item-desc--content">
	       				
	       						<dl>
	       							<dt><p class="product_title"><%=vo_list.get(i).getTitle() %> </p> 
	       								<span>상품명:  <%=vo_list.get(i).getProduct_name() %>/<%=vo_list.get(i).getProduct_weight() %> /원산지:<%=vo_list.get(i).getProduct_country() %></span></dt>
	       							<dd><span class="enter">재고량: <%=vo_list.get(i).getQuantity() %></span><span class="enter"></span><span class="enter">판매가:  <%=vo_list.get(i).getPrice() %></span><span class="enter">배송비:  <%=vo_list.get(i).getDelivery_price() %></span>
	       								<span class="enter">제조년도:  <%=vo_list.get(i).getDate_manufacture() %></span><span class="enter">품질유지기한:  <%=vo_list.get(i).getBest_before_date() %></span>
	       							<dd>
	       						</dl>
	       					</div>
	       					<div class="item-desc--option">
	       						<dl class="stars">
	       						 	<dt>
	       						 		<span class="customer-review__table--star-rating">
                                            <span style="width: <%=(int)(vo_list.get(i).getSatisfaction() * 20)%>%;"></span>
                                        </span>
	   						 		</dt>
	       						</dl>
	       						<sec:authorize access="isAnonymous()">
	       						<button class="order-btn" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=vo_list.get(i).getBoard_id() %>'"
	       						    type="button">주문</button>
	       						</sec:authorize>
	       						<sec:authorize access="isAuthenticated()">
	       						<button class="order-btn" onclick="javascript:location.href='BoardProductView2.bo?board_id=<%=vo_list.get(i).getBoard_id() %>'"
	       						    type="button">주문</button>
	       						</sec:authorize>
	       					</div>
	       				</div>
          			</li>
          			<%} %>
          	    <%}%>

          		</ul>
          	</div>
          </article>
        </section>
  			
    </main>
    
    
    
     <jsp:include page="side.jsp" flush="false"/>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="<c:url value='/resources/js/module/side.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Home/index.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>