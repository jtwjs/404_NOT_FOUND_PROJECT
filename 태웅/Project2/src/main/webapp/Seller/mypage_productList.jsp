<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>상품 내역</title>
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
                        
                            <article id="content__product-list--search">
                                <div id="content__product-list--search-box">
                                    <form id="product-list__search-box--form" method="get"
                                        action="" onsubmit="">
                                        <div id="product-list__search-box--line-1">
                                            <input type="text" placeholder="주문번호, 글제목" />
                                            <input type="submit" value="검색" />
                                        </div>
                                        <div id="product-list__search-box--line-2">
                                            <span>등록일</span>
                                            <input type="date" /> ~ <input type="date" />
                                            <input type="button" value="오늘" />
                                            <input type="button" value="3일간" />
                                            <input type="button" value="일주일" />
                                            <input type="button" value="1개월" />
                                            <input type="button" value="3개월" />
                                            <input type="button" value="전체" />
                                        </div>
                                    </form>
                                </div>
                            </article>
                            
                            <article id="transaction__detail">

                                <table class="transaction__detail--table">
                                    <thead>
                                        <tr>
                                            <th class="board-number">번호</th>                
                                            <th class="board-name">글제목</th>       
                                            <th class="evaluation-score">평가점수</th>       
                                            <th class="board-write-date">등록일</th>       
                                            <th class="board-sell-status">판매여부</th>       
                                        </tr>   
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="non-post" colspan="5">
                                                거래내역이 없습니다.
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
    

    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>