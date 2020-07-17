<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="com.spring.boardproduct.PageMaker" %>
<%
	UrlPathHelper urlPathHelper = new UrlPathHelper(); 
    String originalURL = urlPathHelper.getOriginatingRequestUri(request); // 현재 view url 경로 찾기
    
    String category_param_name = null;
    String category_param_code = null;
    
    if(request.getParameter("category_1") != null){
    	category_param_name = "category_1";
    	category_param_code = request.getParameter("category_1");
    }
    
    if(request.getParameter("category_2") != null){
    	category_param_name = "category_2";
    	category_param_code = request.getParameter("category_2");
    }
    
    if(request.getParameter("category_local") != null){
    	category_param_name = "category_local";
    	category_param_code = request.getParameter("category_local");
    }
    
    int sort_list = 0;
    if((int)request.getAttribute("sort_list") != 0){
    	sort_list = (int)request.getAttribute("sort_list");
    }
    
    ArrayList<BoardProductVO> vo_list = null;
    if((ArrayList<BoardProductVO>)request.getAttribute("vo_list") != null){
    	vo_list = (ArrayList<BoardProductVO>)request.getAttribute("vo_list");
    }
    
    String category_title = null;
    ArrayList<String> category_sub = null;
    int category_code = 0;
    if((String)request.getAttribute("category_title") != null){
    	category_title = (String)request.getAttribute("category_title");
    }
    if((ArrayList<String>)request.getAttribute("category_sub") != null){
    	category_sub = (ArrayList<String>)request.getAttribute("category_sub");
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
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/BoardProduct/boardProductList.css'/>" rel="stylesheet" />
    <title></title>
</head>
<body onload="setStyle('<%=pageMaker.getPage_amount()%>', '<%=sort_list %>', '<%=category_param_code %>');" >
   <section id="sub-main" class="seller">
	  <div class="sub-top">
	  	<h2 class="sub-title">상품리스트</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>상품리스트</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="SellerMyPage.se">
	  				<span>상품리스트</span>
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
                            <%if(request.getParameter("category_local") != null){ %>
                            <b><%=category_title %></b>
                            <%}else{ %>
                            <b><a href="BoardProductList.bo?category_1=<%=category_param_code.charAt(0) %>">
                                <%=category_title %></a></b>
                            <%} %>
                        </div>

                        <table>
                            <tr>
                                <td>
                                    <div class="category_contents"></div>
                                </td>
                            </tr>
                            
                            <hr />
                            
                            <%
                            String param_code = category_param_code.charAt(0) + "0";
                                for(int i = 1; i <= category_sub.size(); i++){ 
                                if(i % 4 == 1){ %>
                                <tr>
                                <%} %>
                                    <td class="category-table__list">
                                    <%if(request.getParameter("category_local") != null){ %>
                                    · <a href="BoardProductList.bo?category_local=<%=i%>" id="category-local--<%=i%>">
                                        <%=category_sub.get(i-1) %></a>
                                    <%}else{ %>
                                    · <a href="BoardProductList.bo?category_2=<%=param_code + i%>" id="category-2--<%=param_code + i%>">
                                        <%=category_sub.get(i-1) %></a>
                                    <%} %>
                                    </td>
                                <%if(i % 4 == 0){ %>
                                </tr>
                                <%} 
                                }%>
                            
                        </table>
                        
                        <hr />
            
                        <div id="view-table">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="left">
                                        전체 상품 <%=pageMaker.getTotal() %> 개
                                    </td>
                                    <td align="right">
                                        <a href="#" id="sort-list--1" 
                                            onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', 1, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--2" 
                                            onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', 2, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">최근등록순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--3" 
                                            onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', 3, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">판매인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--4" 
                                            onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', 4, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">낮은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--5" 
                                            onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', 5, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">높은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        
                                        <select class="qty_view" name="perpage" id="qty_view" 
                                            onchange="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()%>', this.value);" >
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
                        
                        <%if(vo_list.size() == 0){ %>
                        <div id="non-box">검색된 상품이 없습니다</div>
                        <%} %>
                        <div id="new">
                            <%for(int i = 0; i < vo_list.size(); i++){ %>
                            <div class="item_box" 
                            onclick="javascript:location.href='BoardProductView.bo?board_id=<%=vo_list.get(i).getBoard_id()%>'">
                                <ul class="item">
                                    <li><img src="<%=vo_list.get(i).getThumbnail_thum_path() %><%=vo_list.get(i).getThumbnail_thum()%>"></li>
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
                                <input type="button" value="◀" onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()-1%>', '<%=pageMaker.getPage_amount()%>')" />
                            <%} %>
                                
                            <%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
                                  if(a==pageMaker.getPage_num()){%>
                                    <input type="button" value="<%=a %>" id="now-page" readonly/>
                                <%}else{ %>
                                    <input type="button" value="<%=a %>"onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', '<%=sort_list %>', '<%=a%>', '<%=pageMaker.getPage_amount()%>')" />
                                <%}
                            } %>
                                
                            <%if(pageMaker.isNext()){ %>
                                <input type="button" value="▶" onclick="pageViewOption('<%=originalURL %>', '<%=category_param_name %>', '<%=category_param_code %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()+1%>', '<%=pageMaker.getPage_amount()%>')" />
                            <%} %>
                        </div>

                        <br /><hr /><br />

                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- contents 끝 -->

    <script type="text/javascript" src="<c:url value='/resources/js/BoardProduct/boardProductList.js?after'/>" ></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>