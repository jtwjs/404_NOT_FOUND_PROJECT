<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="com.spring.util.PageMaker" %>
<%
	UrlPathHelper urlPathHelper = new UrlPathHelper(); 
    String originalURL = urlPathHelper.getOriginatingRequestUri(request); // 현재 view url 경로 찾기
    
    int sort_list = 0;
    if((int)request.getAttribute("sort_list") != 0){
    	sort_list = (int)request.getAttribute("sort_list");
    }
    
    ArrayList<BoardProductVO> vo_list = null;
    int vo_list_size = 0;
    if((ArrayList<BoardProductVO>)request.getAttribute("vo_list") != null){
    	vo_list = (ArrayList<BoardProductVO>)request.getAttribute("vo_list");
    	vo_list_size = vo_list.size();
    }
    
    String keyword = null;
    if((String)request.getAttribute("keyword") != null){
    	keyword = (String)request.getAttribute("keyword");
    }
    
    int category_1 = 0;
    if((int)request.getAttribute("category_1") != 0){
    	category_1 = (int)request.getAttribute("category_1");
    }
    
    int category_2 = 0;
    if((int)request.getAttribute("category_2") != 0){
    	category_2 = (int)request.getAttribute("category_2");
    }
    
    int category_local = 0;
    if((int)request.getAttribute("category_local") != 0){
    	category_local = (int)request.getAttribute("category_local");
    }
    
    int min_price = 0;
    if((int)request.getAttribute("min_price") != 0){
    	min_price = (int)request.getAttribute("min_price");
    }
    
    int max_price = 0;
    if((int)request.getAttribute("max_price") != 0){
    	max_price = (int)request.getAttribute("max_price");
    }
    
    int priceSelect = 0;
    if((int)request.getAttribute("priceSelect") != 0){
    	priceSelect = (int)request.getAttribute("priceSelect");
    }
    
    
    PageMaker pageMaker = null;
    if((PageMaker)request.getAttribute("pageMaker") != null){
    	pageMaker = (PageMaker)request.getAttribute("pageMaker");
    }
    
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
	<link href="<c:url value='/resources/css/BoardProduct/recentProduct.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/BoardProduct/boardProductSearch.css'/>" rel="stylesheet" />
    <title></title>
</head>
<body onload="setStyle('<%=pageMaker.getPage_amount()%>', '<%=sort_list%>', '<%=keyword%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');" >
<jsp:include page="recentProduct.jsp" flush="false"/>
   <section id="sub-main" class="seller">
	  <div class="sub-top">
	  	<h2 class="sub-title">상품 검색</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>상품 검색</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="SellerMyPage.se">
	  				<span>상품 검색</span>
	  			</a>
	  		</li>
	  	</ul>
	  </div>
	</section> 

    <!-- contents 시작 -->
    <main id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">

                    <div class="category-table">
                        <div class="category-title">
                            <span>검색 </span><b>' ${keyword} '</b><br/><br/>
                            <span>검색결과 </span><b>' <%=vo_list.size() %> '</b> 건
                        </div>
                        
                        <hr />
                        
                        <div id="search-box">
                            <select id="search-box__category-local">
                                <option value="">지역별 카테고리</option>
                                <option value=0>전체</option>
                                <option value=1>강원도</option>
                                <option value=2>경기도</option>
                                <option value=3>경상북도</option>
                                <option value=4>경상남도</option>
                                <option value=5>전라북도</option>
                                <option value=6>전라남도</option>
                                <option value=7>충청북도</option>
                                <option value=8>충청남도</option>
                                <option value=9>제주도</option>
                                <option value=10>울릉도/독도</option>
                            </select>
                            <select id="search-box__category-1" onchange="categoryChange();">
                                <option value="">1차 카테고리</option>
                                <option value=0>전체</option>
                                <option value=1>쌀/잡곡</option>
                                <option value=2>채소류</option>
                                <option value=3>과일</option>
                                <option value=4>축산물</option>
                                <option value=5>수산물/건어물</option>
                                <option value=6>가공식품/떡류</option>
                                <option value=7>김치/반찬/젓갈</option>
                                <option value=8>장/조청/식초</option>
                                <option value=9>건강식품</option>
                                <option value=10>차류</option>
                            </select>
                            <select id="search-box__category-2">
                                <option value="">2차 카테고리</option>
                                <option value=0>전체</option>
                            </select>
                            <input type="text" id="search-box__keyword" />
                            <input type="button" id="search-box__search-btn" value="검색하기" 
                                onclick="searchBoardProductList(0);" />
                        </div>
                        
                        <div id="price-search-box">
                            <div id="price-search-box__title">가격대</div>
                            <div id="price-search-box__list">
                                <ul>
                                    <li onclick="searchBoardProductList(1)" 
                                           id="price-search-box__search-1">~1만원</li>
                                    <li onclick="searchBoardProductList(2)" 
                                            id="price-search-box__search-2">1~5만원</li>
                                    <li onclick="searchBoardProductList(3)" 
                                           id="price-search-box__search-3">5~15만원</li>
                                    <li onclick="searchBoardProductList(4)" 
                                           id="price-search-box__search-4">15~30만원</li>
                                    <li onclick="searchBoardProductList(5)" 
                                           id="price-search-box__search-5">30~만원</li>
                                </ul>
                            </div>
                            <div id="price-search-box__input">
                                <input type="text" id="search-box__min-price" maxlength="7" 
                                    oninput="minPriceText(this);" /> 원 ~ 
                                <input type="text" id="search-box__max-price" maxlength="7" 
                                    onchange="maxPriceText(this);" /> 원
                            </div>
                        </div>
                    </div>
                        
                        <hr />
            
                        <div id="view-table">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="left">
                                        전체 상품 <%=pageMaker.getTotal() %> 개
                                    </td>
                                    <td align="right">
                                        <a href="#" id="sort-list--1" 
                                            onclick="pageViewOption('<%=originalURL %>', 1, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');">인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--2" 
                                            onclick="pageViewOption('<%=originalURL %>', 2, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');">최근등록순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--3" 
                                            onclick="pageViewOption('<%=originalURL %>', 3, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');">판매인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--4" 
                                            onclick="pageViewOption('<%=originalURL %>', 4, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');">낮은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--5" 
                                            onclick="pageViewOption('<%=originalURL %>', 5, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');">높은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        
                                        <select class="qty_view" name="perpage" id="qty_view" 
                                            onchange="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()%>', this.value, '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>');" >
                                            <option value="30">30개씩 보기</option>
                                            <option value="60">60개씩 보기</option>
                                            <option value="90">90개씩 보기</option>
                                            <option value="120">120개씩 보기</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="clear"></div>

                        <hr />
                        
                        <%if(vo_list_size == 0){ %>
                        <div id="non-box">검색된 상품이 없습니다</div>
                        <%} %>
                        <div id="new">
                            <%for(int i = 0; i < vo_list_size; i++){ %>
                            <sec:authorize access = "isAnonymous()">
                            <div class="item_box" 
                            onclick="javascript:location.href='BoardProductView.bo?board_id=<%=vo_list.get(i).getBoard_id()%>'">
                           </sec:authorize>
                           <sec:authorize access="hasRole('ROLE_SELLER')">
                            <div class="item_box" 
                            onclick="javascript:location.href='BoardProductView.bo?board_id=<%=vo_list.get(i).getBoard_id()%>'">
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_BUYER')">
                            <div class="item_box" 
                            onclick="javascript:location.href='BoardProductView2.bo?board_id=<%=vo_list.get(i).getBoard_id()%>'">
                            </sec:authorize>
                                <ul class="item">
                                    <li><img src="display?path=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(vo_list.get(i).getThumbnail_thum(), "UTF-8")%>"></li>
                                    <li class="subject"><%=vo_list.get(i).getTitle() %></li>
                                    <li class="price"><%=vo_list.get(i).getPrice() %>원</li>
                                    <%if(vo_list.get(i).getDelivery_price() != 0){ %>
                                    <li class="comment">배송비 <%=vo_list.get(i).getDelivery_price() %>원</li>
                                    <%}else{ %>
                                    <li class="comment">무료배송</li>
                                    <%} %>
                                </ul>
                            </div>
                            <%} %>
                        </div> 
                        <!-- new 끝-->

                        <br />

                        <div class="clear"></div>

                        <div id="isPage">
                            <%if(pageMaker.isPrev()){ %>
                                <input type="button" value="이전" onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=pageMaker.getStartPage()-10%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>')" />
                            <%} %>
                                
                            <%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
                                  if(a==pageMaker.getPage_num()){%>
                                    <input type="button" value="<%=a %>" id="now-page" readonly/>
                                <%}else{ %>
                                    <input type="button" value="<%=a %>"onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=a%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>')" />
                                <%}
                            } %>
                                
                            <%if(pageMaker.isNext()){ %>
                                <input type="button" value="다음" onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=pageMaker.getEndPage()+1%>', '<%=pageMaker.getPage_amount()%>', '<%=category_1%>', '<%=category_2%>', '<%=category_local%>', '<%=min_price%>', '<%=max_price%>', '<%=priceSelect%>')" />
                            <%} %>
                        </div>

                        <br /><hr /><br />

                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- contents 끝 -->

    <script type="text/javascript" src="<c:url value='/resources/js/BoardProduct/boardProductSearch.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/BoardProduct/recentProduct.js?after'/>" ></script>
    
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>