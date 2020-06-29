<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
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
								<h2>LOREM IPSUM,LOREM IPSUM</h2>
								<span><strong>로림 입섬</strong>도울러 싯 애밋
								<span class="enter">로림 입섬</span></span>
							</div>
						</div>
					</li>
					<li id="list-item2" >
						<div class="slide-page2">
						</div>
						<div class="slider__slogon">
							<div class="slider__slogon--title">
								<h2>LOREM IPSUM,LOREM IPSUM</h2>
								<span><strong>로림 입섬</strong>도울러 싯 애밋
								<span class="enter">로림 입섬</span></span>
							</div>
						</div>
					</li>
					<li id="list-item3" >
						<div class="slide-page3">
						</div>
						<div class="slider__slogon">
							<div class="slider__slogon--title">
								<h2>LOREM IPSUM,LOREM IPSUM</h2>
								<span><strong>로림 입섬</strong>도울러 싯 애밋
								<span class="enter">로림 입섬</span></span>
							</div>
						</div>
					</li>
				</ul>
			</article> 
        </section>
        <section id="main__visual2">
   			<div class="remote-controller">
	      		<button id="controller-left" type="button">
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
          			<li id="rank1">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank2">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/potato.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank3">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/hanwoo.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank4">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank5">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank6">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank7">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank8">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank9">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			<li id="rank10">
          				<div class="product--list-item">
          					<div class="item-img">
          						<button type="button">
          							<img src="./resources/Images/Home/ic_share2.png" alt="상세보기" />
          						</button>
		       					<img class="product-image" src="./resources/Images/BoardProduct/straw-berry.jpg" alt="product image"/>
	       					</div>
	       					<div class="item-desc">
	       						<div class="item-desc--content">
	       							<dl>
	       								<dt>lorem ipsum  <span>lorem inpsum dolor sit amet</span></dt>
	       								<dd>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<dd>
	       							</dl>
	       						</div>
	       						<div class="item-desc--option">
	       							<dl class="stars">
	       						 		<dt>
	       						 			<img class="stars-rating" src="./resources/Images/Home/stars_5.png" alt="star rating" />
	   						 			</dt>
	       						 		<dd class="order-quantity">
	       						 			99
	       						 		</dd>
	       						 	</dl>
	       						 	<button class="order-btn" type="button">주문</button>
	       						</div>
	       					</div>
       					</div>
          			</li>
          			
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