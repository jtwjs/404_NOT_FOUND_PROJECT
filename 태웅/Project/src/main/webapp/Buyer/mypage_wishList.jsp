<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.buyer.WishListVO"%>
<%@ page import="com.spring.util.PageMaker" %>

<%
	UrlPathHelper urlPathHelper = new UrlPathHelper(); 
	String originalURL = urlPathHelper.getOriginatingRequestUri(request); // 현재 view url 경로 찾기
	
	String category_param_name = null;
    String category_param_code = null;
    
    if(request.getParameter("buyer_id") != null){
    	category_param_name = "buyer_id";
    	category_param_code = request.getParameter("buyer_id");
    }
    
    int sort_list = 0;
    if((int)request.getAttribute("sort_list") != 0){
    	sort_list = (int)request.getAttribute("sort_list");
    }
    
    ArrayList<WishListVO> wishList = null;
    if((ArrayList<WishListVO>)request.getAttribute("wishList") != null){
    	wishList = (ArrayList<WishListVO>)request.getAttribute("wishList");
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
<jsp:include page="../header.jsp" flush="false" />
<link href="<c:url value='/resources/css/module/header.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/reset.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/module/footer.css'/>"
	rel="stylesheet" />
<!-- header, css end -->
<link href="<c:url value='/resources/css/Common/sub_main.css?after'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Buyer/mypage_template.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/Buyer/mypage_wishList.css'/>"
	rel="stylesheet" />
<title>찜목록</title>
</head>
<body onload="setStyle('<%=pageMaker.getPage_amount()%>', '<%=sort_list %>');" >
	<section id="sub-main" class="">
		<div class="sub-top">
			<h2 class="sub-title">마이페이지</h2>
			<ul class="sub-location">
				<li class="home"><a href="Index.in"><span class="hide-text">home</span></a>
				</li>
				<li><strong>마이페이지</strong></li>
				<li><strong>찜 목록</strong></li>
			</ul>
		</div>
		<div class="sub-tab">
			<ul>
				<li><a href="BuyerMyPage.by"> <span>마이페이지</span>
				</a></li>
			</ul>
		</div>
	</section>
	<main id="main">

		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<section id="content">
						<jsp:include page="mypage_template.jsp" flush="false" />

						<section id="myPage">
							<h2 class="content-title">찜목록</h2>

							<article id="content__sort">
								<div id="content__sort-box">
									<div align="right">
										<a href="#" id="sort-list--1" 
                                            onclick="pageViewOption('<%=originalURL %>', 1, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">등록일순 (최근)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--2" 
                                            onclick="pageViewOption('<%=originalURL %>', 2, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">등록일순 (오래된순)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--3" 
                                            onclick="pageViewOption('<%=originalURL %>', 3, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">상품명순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--4" 
                                            onclick="pageViewOption('<%=originalURL %>', 4, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">가격순 (높은 가격)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#" id="sort-list--5" 
                                            onclick="pageViewOption('<%=originalURL %>', 5, '<%=pageMaker.getPage_num()%>', '<%=pageMaker.getPage_amount()%>');">가격순 (낮은 가격)</a>&nbsp;&nbsp;|&nbsp;&nbsp;
									</div>
								</div>
							</article>

							<article id="transaction__detail">
								<table class="transaction__detail--table">
									<thead>
										<tr>
											<th class="wish-check">이미지</th>
											<th class="wish-title">상품명</th>
											<th class="wish-price">가격</th>
											<th class="wish-delete"></th>
										</tr>
									</thead>
									<tbody>
										<%
											if(wishList.size() == 0) {
									    %>
										<tr>
											<td colspan="4">
												<br />
												등록된 상품이 없습니다.
												<br />
											</td>
										</tr>
										<%} %>
										<%		
			                            	for(int i = 0; i < wishList.size(); i++) {
			                                    WishListVO wl_new = (WishListVO) wishList.get(i);
										%>
										<tr class="">
	                                        <td class="wish_thum" onclick="javascript:location.href='BoardProductView.bo?board_id=<%=wl_new.getBoard_id()%>'">
	                                           	<img src="display?path=<%=java.net.URLEncoder.encode(wl_new.getThumbnail_thum_path(),"UTF-8") %>&name=<%=java.net.URLEncoder.encode(wl_new.getThumbnail_thum(),"UTF-8") %>" style="width: auto; height: 80px;">            
	                                        </td>
	                                        <td onclick="javascript:location.href='BoardProductView.bo?board_id=<%=wl_new.getBoard_id()%>'">
	                                          	<%=wl_new.getTitle() %>
	                                        </td>
	                                        <td><%=wl_new.getPrice() %></td>
	                      					<td>
	                      						<button type="button" class="deleteBtn" id="deleteBtn"
																	onclick="location.href='DeleteWishList.by?wish_id=<%=wl_new.getWish_id() %>'">삭제</button>
	                      					</td>
	                                    </tr>
	                                        
	                                    <%} %>
		                                
		                                <tr align=center height=20>
											<td colspan=5 style="font-family: Tahoma; font-size: 10pt;">
												<%if(pageMaker.isPrev()){ %>
					                                <input type="button" value="◀" onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()-1%>', '<%=pageMaker.getPage_amount()%>')" />
					                            <%} %>
					                                
					                            <%for(int a=pageMaker.getStartPage();a<=pageMaker.getEndPage();a++){
					                                  if(a==pageMaker.getPage_num()){%>
					                                    <input type="button" value="<%=a %>" id="now-page" readonly/>
					                                <%}else{ %>
					                                    <input type="button" value="<%=a %>"onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=a%>', '<%=pageMaker.getPage_amount()%>')" />
					                                <%}
					                            } %>
					                                
					                            <%if(pageMaker.isNext()){ %>
					                                <input type="button" value="▶" onclick="pageViewOption('<%=originalURL %>', '<%=sort_list %>', '<%=pageMaker.getPage_num()+1%>', '<%=pageMaker.getPage_amount()%>')" />
					                            <%} %>
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


	<script type="text/javascript"
		src="<c:url value='/resources/js/Buyer/mypage_menu.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_wishList.js?after'/>" ></script>
	<!-- footer,js -->
	<jsp:include page="../footer.jsp" flush="false" />
	<script type="text/javascript"
		src="<c:url value='/resources/js/Common/sub_main.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/footer.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/resources/js/module/header.js'/>"></script>
	<!-- footer,js end -->
</body>
</html>