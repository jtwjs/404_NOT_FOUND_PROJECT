<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="com.spring.boardproduct.BoardReviewVO" %>
<%@ page import="com.spring.boardproduct.CommentReviewVO" %>
<%@ page import="com.spring.boardproduct.BoardQnaVO" %>
<%@ page import="com.spring.util.PageMaker" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.nio.ByteBuffer" %>
<%
    BoardProductVO vo = null;
    if((BoardProductVO)request.getAttribute("vo") != null){
    	vo = (BoardProductVO)request.getAttribute("vo");
    }
    
    String location = null;
    if((String)request.getAttribute("location") != null){
    	location = (String)request.getAttribute("location");
    }
    
    ArrayList<BoardReviewVO> review_list = null;
    if((ArrayList<BoardReviewVO>)request.getAttribute("review_list") != null){
    	review_list = (ArrayList<BoardReviewVO>)request.getAttribute("review_list");
    }
    
    ArrayList<CommentReviewVO[]> reviewComment = null;
    if((ArrayList<CommentReviewVO[]>)request.getAttribute("reviewComment") != null){
    	reviewComment = (ArrayList<CommentReviewVO[]>)request.getAttribute("reviewComment");
    }
   
    int reviewNum = 0;
    double reviewNumCalc = vo.getSatisfaction();
    double deliveryReviewNumCalc = 0.0;
    if((int)request.getAttribute("reviewNum") != 0){
    	reviewNum = (int)request.getAttribute("reviewNum");
    	
    	if(review_list.size() != 0 || review_list.size() != reviewNum){
    	    for(int i = 0; i < review_list.size(); i++){
    		    //reviewNumCalc += review_list.get(i).getSatisfaction();
    		    deliveryReviewNumCalc += review_list.get(i).getDelivery_satisfaction();
    	    }
    	
    	    //reviewNumCalc /= reviewNum;
    	    deliveryReviewNumCalc /= reviewNum;
        }else{
        	System.out.println("review_list 사이즈 에러");
        }
    }
    
    ArrayList<BoardQnaVO> qna_list = null;
    if((ArrayList<BoardQnaVO>)request.getAttribute("qna_list") != null){
    	qna_list = (ArrayList<BoardQnaVO>)request.getAttribute("qna_list");
    }
    
    int countQna = 0;
    if((int)request.getAttribute("countQna") != 0){
    	countQna = (int)request.getAttribute("countQna");
    }
    
    ArrayList<BoardProductVO> seller_best_list = null;
    if((ArrayList<BoardProductVO>)request.getAttribute("seller_best_list") != null){
    	seller_best_list = (ArrayList<BoardProductVO>)request.getAttribute("seller_best_list");
    }
  
%>

<%  int login_case = 0; 
    String user_id = "0";%>
<sec:authorize access="isAuthenticated() and hasRole('BUYER')">
    <sec:authentication var="user" property="principal.username" />
    <%login_case = 1; 
    user_id = pageContext.getAttribute("user").toString();%>
</sec:authorize>
<sec:authorize access="isAuthenticated() and hasRole('SELLER')">
    <sec:authentication var="user" property="principal.username" />
    <%login_case = 2; 
    user_id = pageContext.getAttribute("user").toString();%>
</sec:authorize>
<sec:authorize access="isAuthenticated() and hasRole('ADMIN')">
    <sec:authentication var="user" property="principal.username" />
    <%login_case = 3; 
    user_id = pageContext.getAttribute("user").toString();%>
</sec:authorize>
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
    <link href="<c:url value='/resources/css/BoardProduct/boardProductView.css'/>" rel="stylesheet" />
    <title><%=vo.getTitle() %></title>
</head>
<body onload="enableCheck('<%=vo.getQuantity()%>', '<%=vo.getSale_status()%>', '<%=login_case%>', '<%=user_id%>', '<%=vo.getBoard_id()%>', '<%=location%>')">
<jsp:include page="recentProduct.jsp" flush="false"/>
   <section id="sub-main" class="seller">
	  <div class="sub-top">
	  	<h2 class="sub-title">상품</h2>
	  	<ul class="sub-location">
	  		<li class="home">
	  		  <a href="Index.in"><span class="hide-text">home</span></a>
	  		</li>
	  		<li>
	  		  <strong>상품리스트</strong>
	  		</li>
	  		<li>
	  		  <strong>상품</strong>
	  		</li>
	  	</ul>
	  </div>
	  <div class="sub-tab">
	  	<ul>
	  		<li>
	  			<a href="SellerMyPage.se">
	  				<span>상품</span>
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
                    <!-- 사진 및 제목, 부연설명 -->
                    <div class="seller__dataWrap">

                        <!-- 이미지 -->
                        <div class="seller__datathumb--img">
                       <c:choose>
                        
                        <c:when test="${vo.quantity ne 0 }">
                            <div class="seller-imgBig">
                        </c:when>
                        <c:otherwise>
                        	<div class="seller-imgBig sold_out">
                        </c:otherwise>
                       </c:choose>
                        
                                <% String origin_path = java.net.URLEncoder.encode(vo.getProduct_origin_path(), "UTF-8"); 
                                   String thumb_path = java.net.URLEncoder.encode(vo.getProduct_thum_path(), "UTF-8"); 
                                   String origin2_path = java.net.URLEncoder.encode(vo.getThumbnail_origin_path(),"UTF-8");
                                   String thumb2_path = java.net.URLEncoder.encode(vo.getThumbnail_thum_path(),"UTF-8");
                                if(vo.getProduct_thum_1() != null){ %>
                                <img src="display?path=<%=origin2_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_origin_1(), "UTF-8") %>" alt="">
                                <%}else if(vo.getProduct_thum_2() != null){ %>
                                <img src="display?path=<%=origin_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_origin_2(), "UTF-8") %>" alt="">
                                <%}else if(vo.getProduct_thum_3() != null){ %>
                                <img src="display?path=<%=origin_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_origin_3(), "UTF-8") %>" alt="">
                                <%}else{ %>
                                <img src="display?path=<%=origin_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_origin_4(), "UTF-8") %>" alt="">
                                <%} %>
                            </div>
                      	
                     
                            <div class="seller__img--thumb">
                                <ul>
                                    <%if(vo.getProduct_thum_1() != null){ %>
                                    <li onclick="selectBigImg('<%=origin2_path %>', '<%=java.net.URLEncoder.encode(vo.getProduct_origin_1(), "UTF-8")%>');">
                                        <img src="display?path=<%=thumb2_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_thum_1(), "UTF-8") %>" alt="" >
                                    </li>
                                    <%}
                                    if(vo.getProduct_thum_2() != null){ %>
                                    <li onclick="selectBigImg('<%=origin_path%>', '<%=java.net.URLEncoder.encode(vo.getProduct_origin_2(), "UTF-8")%>');">
                                        <img src="display?path=<%=thumb_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_thum_2(), "UTF-8") %>" alt="">
                                    </li>
                                    <%}
                                    if(vo.getProduct_thum_3() != null){ %>
                                    <li onclick="selectBigImg('<%=origin_path%>', '<%=java.net.URLEncoder.encode(vo.getProduct_origin_3(), "UTF-8")%>');">
                                        <img src="display?path=<%=thumb_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_thum_3(), "UTF-8") %>" alt="">
                                    </li>
                                    <%}
                                    if(vo.getProduct_thum_4() != null){ %>
                                    <li onclick="selectBigImg('<%=origin_path%>', '<%=java.net.URLEncoder.encode(vo.getProduct_origin_4(), "UTF-8")%>');">
                                        <img src="display?path=<%=thumb_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_thum_4(), "UTF-8") %>" alt="">
                                    </li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>

                        <!-- 제품 설명란 -->
                        <div class="seller__datatxt">
                            <div class="seller__datatxtBox">
                                <div class="seller__datatitle"><%=vo.getTitle() %></div>
                            </div>
                            
                            <div class="seller__datatxtBox">
                                <div class="seller__datatxtarea"></div>
                            </div>
                            <hr />

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">판매가</li>
                                    <li class="dataBox__content"><%=vo.getPrice() %></li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">배송</li>
                                    <li class="dataBox__content">
                                        <select class="selectDelivery" name="selectDelivery" id="delivery">
                                            <option value="택배(선불)" selected>택배(선불)</option>
                                        </select>
                                    </li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">배송비</li>
                                    <li class="dataBox__content">
                                        <%if(vo.getDelivery_price() == 0){ %>
                                        <span>무료배송</span>
                                        <%}else{ %>
                                        <span><%=vo.getDelivery_price() %></span>
                                        <%} %>
                                    </li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">고객평가</li>
                                    <li class="dataBox__content">
                                        <span><%=reviewNum %> 건 <%=String.format("%.2f", reviewNumCalc)%> / 5</span>
                                        <div id="review-calc__star-rating--box">
                                            <div id="review-calc__star-rating">
                                                <span style="width: <%=(int)(reviewNumCalc*20)%>%;"></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">원산지</li>
                                    <li class="dataBox__content"><%=vo.getProduct_country() %></li>
                                </ul>
                            </div>

                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">단위</li>
                                    <li class="dataBox__content"><%=vo.getProduct_weight() %></li>
                                </ul>
                            </div>
                            <div class="seller__datatxtBox">
                                <ul>
                                    <li class="dataBox__title">재고량</li>
                                    <li class="dataBox__content"><%=vo.getQuantity() %></li>
                                </ul>
                            </div>
                           
                            <hr />
                            
                            <div class="seller__datatxtBox seller__dataValue">
                                <ul>
                                    <li class="dataBox__title"><span id="buy-quantity">수량</span></li>
                                    <li class="dataBox__content"><input type="button" value="-" 
                                        id="quantity-minus-btn" onclick="btnQuantityChange(this.value, '<%=vo.getPrice() %>', '<%=vo.getDelivery_price() %>', '<%=vo.getQuantity() %>');" />
                                    <input type="text" value="1" id="quantity-text" name="quantity" maxlength="2" 
                                        oninput="onInputCheck(this, '<%=vo.getQuantity() %>');" 
                                        onchange="calcTotPrice(this.value, '<%=vo.getPrice() %>', '<%=vo.getDelivery_price() %>')" />
                                    <input type="button" value="+" 
                                        id="quantity-plus-btn" onclick="btnQuantityChange(this.value, '<%=vo.getPrice() %>', '<%=vo.getDelivery_price() %>', '<%=vo.getQuantity() %>');" /></li>
                                </ul>
                                <ul>
                                    <li class="dataBox__title">총 금액</li>
                                    <li class="dataBox__content">
                                        <span id="tot-price-span"><%=(vo.getPrice() + vo.getDelivery_price()) %></span>원
                                        <input type="hidden" value="" id="tot-price-input"/>
                                    </li>
                                </ul>
                            </div>

                            <hr/>
                            <!-- 농원소개 -->
                            
                            <input type="hidden" value="" id="btn__check--val" />
                            
                            <form id="buyForm" method="post" action="OrderSheet.or">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="csrfFormId" />
                                <input type="hidden" value="<%=vo.getBoard_id() %>" name="board_id" id="board_id" />
                            </form>
                            <form id="wishForm" method="post" action="">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" id="wishForm-csrf"/>
                                <input type="hidden" value="<%=vo.getBoard_id() %>" name="board_id"/>
                                <input type="hidden" value="<%=user_id %>" name="buyer_id"/>
                                <input type="hidden" value="<%=vo.getTitle() %>" name="title"/>
                                <input type="hidden" value="<%=vo.getPrice() %>" name="price"/>
                                <input type="hidden" value="<%=vo.getThumbnail_thum() %>" name="thumbnail_thum"/>
                                <input type="hidden" value="<%=vo.getThumbnail_thum_path() %>" name="thumbnail_thum_path"/>
                            </form>
                            <div class="seller__data--btn">
                            <c:if test="${vo.quantity ne 0 }">
                                <div class="seller__btnWrap">
                                    <button type="button" class="button1" id="buy-btn" 
                                        onclick="buyForm('<%=user_id %>', '<%=login_case%>');">
                                    <b>구매하기</b></button>
                                </div>
                           </c:if>
                           <c:if test="${vo.quantity eq 0 }">
                           		<div class="seller__btnWrap">
                                    <button type="button" class="button1" id="sold_out">
                                    <b>품절</b></button>
                                </div>
                           </c:if>
                                <div class="seller__btnWrap">
                                    <button type="button" class="button2" id="cart-btn" 
                                        onclick="cartForm('<%=user_id %>', '<%=login_case%>');">
                                    <b>장바구니</b></button>
                                </div>
                                <div class="seller__btnWrap">
                                    <button type="button" class="button3" id="wish-btn" 
                                        onclick="wishForm('<%=user_id %>', '<%=login_case%>');">
                                    <b id="wishList__check--mark" class="wishList__check--mark-n">위시리스트</b>
                                    </button>
                                </div>
                            </div>
                            
                            <%if(seller_best_list.size() != 0){ %>
                            <div id="seller__best-list--search-box">
                                <div id="seller__best-list--subject">판매자의 다른 인기상품</div>
                                <ul id="seller__best-list--search-inner-box">
                                    <%for(int i = 0; i < seller_best_list.size(); i++){ %>
                                    <sec:authorize access="isAnonymous()">
                                    <li class="seller__best--item" 
                                        onclick="javascript:location.href='BoardProductView.bo?board_id=<%=seller_best_list.get(i).getBoard_id()%>'">
                                        <img src="display?path=<%=java.net.URLEncoder.encode(seller_best_list.get(i).getThumbnail_thum_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(seller_best_list.get(i).getThumbnail_thum(), "UTF-8") %>">
                                        <p><%=seller_best_list.get(i).getTitle() %></p>
                                        <strong><%=seller_best_list.get(i).getPrice() %> 원</strong>
                                    </li>
	       						    </sec:authorize>
	       						    <sec:authorize access="isAuthenticated()">
	       						    <li class="seller__best--item" 
                                        onclick="javascript:location.href='BoardProductView2.bo?board_id=<%=seller_best_list.get(i).getBoard_id()%>'">
                                        <img src="display?path=<%=java.net.URLEncoder.encode(seller_best_list.get(i).getThumbnail_thum_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(seller_best_list.get(i).getThumbnail_thum(), "UTF-8") %>">
                                        <p><%=seller_best_list.get(i).getTitle() %></p>
                                        <strong><%=seller_best_list.get(i).getPrice() %> 원</strong>
                                    </li>
	       						    </sec:authorize>
                                    <%}%>
                                    
                                </ul>
                                
                                <%if(seller_best_list.size() > 4){ %>
                                <span id="seller__best-list--navi">
                                    <input type="button" id="seller__best-list--navi-left" 
                                        onclick="sellerBestListMove('left');" />
                                    <input type="button" id="seller__best-list--navi-right" 
                                        onclick="sellerBestListMove('right');" />
                                </span>
                                <%} %>
                            </div>
                            <%}%>
                            
                            <div id="modal-client">
                                <div id="modal-content">
                                    <div>
                                        <img src="http://pics.gmkt.kr/pc/ko/item/vip/img_cartplus_n.png" />
                                    </div>
                                    <div>
                                        <strong></strong>
                                    </div>
                                    <div id="modal-content--btn">
                                        <input type="button" value="" id="modal__ok-btn" 
                                            onclick="modal_ok();" />
                                        <input type="button" value="계속 쇼핑" id="modal__cancle-btn"
                                            onclick="modal_cancle();" />
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    

                    <!-- 메뉴 바 -->
                    <div class="menu-bar" id="view__menu-bar">
                    
                        <a href="#seller-data" id="board__content--move">상세 정보</a>
                        <a href="#customer-review" id="board__review--move">상품 후기</a>
                        <a href="#customer-qna" id="board__qna--move">상품 문의</a>
                        <a href="#seller-etc" id="board__delivery--move">배송/교환/환불안내</a>
                        
                    </div>
                    
                    <style>
                        #view__menu-bar--fixed > #board__review--move:after {
	                        margin-left: 5px;
	                        font-size: 15px;
	                        font-family: inherit;
	                        content: '<%=reviewNum%>';
                        }
                        
                        #view__menu-bar--fixed > #board__qna--move:after {
	                        margin-left: 5px;
	                        font-size: 15px;
	                        font-family: inherit;
	                        content: '<%=countQna%>';
                        }
                    </style>

                    <!-- 상세정보 -->
                    <div class="seller-data" id="seller-data">
                        <h4 class="seller-head">
                            상세 정보
                        </h4>
                        <div class="rs-table-list">
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>판매 생산자</dt>
                                    <dd><%=vo.getSales_producer() %></dd>
                                </dl>
                            </div>
                            
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>원산지</dt>
                                    <dd><%=vo.getProduct_country() %></dd>
                                </dl>
                            </div>
                            
                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>상품 중량</dt>
                                    <dd><%=vo.getProduct_weight() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>상품 크기</dt>
                                    <dd><%=vo.getProduct_size() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>수량</dt>
                                    <dd><%=vo.getQuantity() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>제조년월일</dt>
                                    <dd><%=vo.getDate_manufacture() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>유통기한 품질유지기한</dt>
                                    <dd><%=vo.getBest_before_date() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>유전자 변형 농수산물 표시</dt>
                                    <dd><%=vo.getTransgenic() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>보관방법</dt>
                                    <dd><%=vo.getStorage_method() %></dd>
                                </dl>
                            </div>

                            <div class="rs-td-item">
                                <dl class="rs-table-box">
                                    <dt>소비자 상담 문의</dt>
                                    <dd><%=vo.getConsumer_consulation() %></dd>
                                </dl>
                            </div>   

                        </div>
                    </div>

                    <hr />

                    <!-- 상품 후기 -->
                    <div class="customer-review" id="customer-review">
                        <h4 class="seller-head">상품 후기 <span style="color: cornflowerblue;"><%=reviewNum %></span></h4>
                        
                        <div id="customer-review__info">
                            <strong style="font-size: 17px;">상품만족도 </strong>
                            
                            <span class="customer-review__table--star-rating">
                                <span style="width: <%=reviewNumCalc * 20%>%;"></span>
                            </span>
                        
                            &nbsp;&nbsp;<strong style="font-size: 17px;">배송만족도 </strong>
                            
                            <span class="customer-review__table--star-rating">
                                <span style="width: <%=deliveryReviewNumCalc * 20%>%;"></span>
                            </span>
                            
                        <sec:authorize access="isAuthenticated() and hasRole('BUYER')">
                            <div id="customer-review__write">
                                <input type="button" id="customer-review__write--btn" value="리뷰작성"
                                    onclick="modal_review_write('<%=vo.getBoard_id() %>', '<%=user_id %>');" />
                            </div>
                        </sec:authorize>
                        </div>
                        
                        <div id="modal__review">
                            <div id="modal__review--content">
                                <div id="review__write--title">
                                    <h2>상품평 남기기</h2>
                                    <a href="javascript:;" id="modal__reivew--close" onclick="modal_review_cancle();">X</a>
                                    <div id="review__write--satisfaction-title">구매만족도</div>
                                    <div id="review__write--satisfaction">
                                        
                                        <div id="star-satisfaction">
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            


                                        </div>
                                    </div>
                                    
                                    <div id="review__write--delivery-satisfaction-title">배송만족도</div>
                                    <div id="review__write--delivery-satisfaction">
                                        
                                        <div id="star-delivery-satisfaction">
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            
                                            <span class="star star-left" onclick=""></span>
                                            <span class="star star-right" onclick=""></span>
                                            


                                        </div>
                                    </div>
                                    
                                    
                                </div>
                                
                                
                                <div id="review__write--content">
                                    <textarea id="review-content--text" maxlength="200" 
                                        placeholder="200자 이내로 후기를 작성해주십시오."></textarea>
                                    <input type="button" onclick="review_regist();" value="작성완료" id="review-submit-btn" />
                                    <input type="button" onclick="modal_review_cancle();" value="취소" id="review-cancle-btn"/>
                                </div>            
                                
                                <form id="reviewForm" method="post" action="BoardReviewRegist.bo">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" value="<%=vo.getBoard_id() %>" name="board_id"/>
                                    <input type="hidden" value="<%=user_id %>" name="buyer_id"/>
                                    <input type="hidden" value="<%=vo.getTitle() %>" name="title"/>
                                    <input type="hidden" value="<%=vo.getThumbnail_thum() %>" name="review_img_name"/>
                                    <input type="hidden" value="<%=vo.getThumbnail_thum_path() %>" name="review_img_path"/>
                                </form>
                            </div>
                        </div>
                        
                        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                        <div id="dialog-message--review" title="상품 후기">
                            <p></p>
                        </div>
                        
                        <div id="customer-review__table">
                            <table>
                                <tbody>
                                    <%if(reviewNum != 0){
                                    	int loc = -1;
                                    	int saveLoc = -1;
                                    	
                                    for(int i = 0; i < review_list.size(); i++){ // 리뷰 갯수만큼 for문 돌림 (최대 5개)
                                    	int flag = 2;
                                    	if(reviewComment.get(i).length != 0){  // 리뷰에 달려 있는 댓글이 있는지 체크
                                    		loc = saveLoc;
                                    		loc++;
                                    		saveLoc = loc;
                                    	}else{
                                    		loc = -1;
                                    	}
                                    	
                                    	if(login_case == 2){
                                    	    if(user_id.equals(vo.getSeller_id())){
                                    		    flag = 1;
                                    	    }
                                    	}
                                        if((login_case == 2 && user_id.equals(vo.getSeller_id())) || reviewComment.get(i).length != 0){%>
                                    <tr onclick="reviewComments('<%=flag%>', '<%=i%>', '<%=loc %>');" style="cursor:pointer;">
                                    <%}else{ %>
                                    <tr>
                                    <%} %>
                                        <td class="customer-review__table--photo">
                                            <img src="display?path=<%=java.net.URLEncoder.encode(review_list.get(i).getReview_img_path(), "UTF-8") %>&name=<%=java.net.URLEncoder.encode(review_list.get(i).getReview_img_name(), "UTF-8") %>" />
                                        </td>
                                        <td class="customer-review__table--recommend">
                                        
                                            <%if(review_list.get(i).getSatisfaction() <= 1.0){ %>
                                            <div class="recommend-1">비추천</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 2.0){ %>
                                            <div class="recommend-2">추천 안함</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 3.0){ %>
                                            <div class="recommend-3">보통</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 4.0){ %>
                                            <div class="recommend-4">추천</div>
                                            <%}else { %>
                                            <div class="recommend-5">적극추천</div>
                                            <%} %>
                                            
                                            <%if(review_list.get(i).getDelivery_satisfaction() <= 2.0){ %>
                                            <div class="delivery-1">배송느림</div>
                                            <%}else if(review_list.get(i).getDelivery_satisfaction() <= 3.5){ %>
                                            <div class="delivery-2">배송보통</div>
                                            <%}else { %>
                                            <div class="delivery-3">배송빠름</div>
                                            <%}%>
                                            
                                        </td>
                                        <td class="customer-review__table--content">
                                            <p class="review__content--title"><%=review_list.get(i).getTitle() %></p>
                                            <span class="review__content"><%=review_list.get(i).getContent() %></span>
                                        </td>
                                        <%
                                        
                                        StringBuilder getReviewId 
                                            = new StringBuilder(review_list.get(i).getBuyer_id().substring(0,3));
                                        
                                        for(int j = 0; j < review_list.get(i).getBuyer_id().length() - 3; j++){
                                        	getReviewId.append("*");
                                        }
                                        
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                		String getReviewDate = sdf.format(review_list.get(i).getRegister_date()); 
                                        %>
                                        <td class="customer-review__table--info">
                                            <dl>
                                                <dt>작성자: </dt>
                                                <dd><%=getReviewId.toString()%></dd>
                                                <dt>등록일: </dt>
                                                <dd><%=getReviewDate %></dd>
                                            </dl>
                                            <div class="customer-review__table--star-rating">
                                                <span style="width: <%=(int)(review_list.get(i).getSatisfaction() * 20)%>%;"></span>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    
                                    
                                    <%if(user_id.equals(vo.getSeller_id())){// 접속한 id와 판매자의 id가 같다면 %>
                                    
                                    <tr class="seller__review--comment"> 
                                        <td colspan="4">
                                            <div class="seller__review--comment-list">
                                            <%if(reviewComment.get(i).length != 0){
                                            for(int j = 0; j < reviewComment.get(i).length; j++){ 
	                                            SimpleDateFormat reviewDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	                                            String reviewDate = reviewDateFormat.format(reviewComment.get(i)[j].getRegister_date());
	                                            reviewDate.replace("AM", "오전");
	                                            reviewDate.replace("PM", "오후");%>
                                            
                                                <div class="seller__review--comment-read">
	                                                <div class="review-comment--seller">판매자</div>
	                                                <div class="review-comment--content"><%=reviewComment.get(i)[j].getContent() %></div>
	                                                <div class="review-comment--date"><%=reviewDate %>
	                                                    <input type="button" class="review__comment--delete-btn" 
	                                                        value="x" onclick="reviewCommentDelete(this,'<%=reviewComment.get(i)[j].getReview_cmt_num()%>','<%=review_list.get(i).getReview_id()%>', '${_csrf.token}');" />
	                                                </div>
	                                            </div>
	                                        
	                                            <%} %>
	                                        <%} %>
                                            </div>
                                            <div class="seller__review--comment-box">
                                                <textarea name="content" maxlength="200" class="seller__review--comment-content"
                                                    placeholder="200자 이하로 댓글을 작성해주세요."></textarea>
                                                <input type="button" value="등록" 
                                                    onclick="reviewCommentSubmit(this, '<%=user_id%>', '<%=review_list.get(i).getReview_id()%>', '${_csrf.token}', '<%=i%>');"/>
                                            </div>
                                        </td>   
                                        	
                                    </tr>	
                                        
                                    <%}else{ %>
                                    
	                                    <%if(reviewComment.get(i).length != 0){ %>
	                                    <tr class="review-comment">
	                                        <td colspan="4">
	                                            <%for(int j = 0; j < reviewComment.get(i).length; j++){ 
	                                            SimpleDateFormat reviewDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	                                            String reviewDate = reviewDateFormat.format(reviewComment.get(i)[j].getRegister_date());
	                                            reviewDate.replace("AM", "오전");
	                                            reviewDate.replace("PM", "오후");%>
	                                            <div>
	                                                <div class="review-comment--seller">판매자</div>
	                                                <div class="review-comment--content"><%=reviewComment.get(i)[j].getContent() %></div>
	                                                <div class="review-comment--date"><%=reviewDate %></div>
	                                            </div>
	                                            <%} %>
	                                        </td>
	                                    </tr>
	                                    <%} %>
                                    
                                    <%} %>
                                    
                                     	
                                    <%}
                                    
                                    }else{%>
                                    <tr id="customer-review__non-table">
                                        <td colspan="4">등록된 리뷰가 없습니다.</td>
                                    </tr>
                                    <%} %>  
                                </tbody>
                            </table>
                        </div>
                        
                        <div id="customer-review__table--page">
                        <% // 페이지메이커 생성, 현재 페이지 1페이지, 보여줄 댓글 개수 5개, 총갯수 고정
                           // 이후는 비동기로 처리
                        PageMaker reviewPage = new PageMaker(1, 5, reviewNum);
                        
                        boolean equalsSellerId = false;
                        if(user_id.equals(vo.getSeller_id())){
                        	equalsSellerId = true;
                        }
                        %>
                            
                            <div id="review__page--btn">
                            <%if(reviewPage.isPrev()){ %>    
                                <input type="button" value="이전" disabled class="page__abled--prev-btn" 
                                    onclick="reviewPageList(this);" />
                            <%}else{ %>
                                <input type="button" value="이전" disabled class="page__disabled--prev-btn"/>
                            <%}
                            for(int i = reviewPage.getStartPage(); i < reviewPage.getEndPage()+1; i++){
                            	
                                if(i == reviewPage.getPage_num()){%>
                                <input type="button" value="<%=i%>" disabled id="review__table--now-page" />
                                
                                <%}else{ %>
                                <input type="button" value="<%=i%>" class="review__table--page-move" 
                                    onclick="reviewListPageMove('<%=vo.getBoard_id()%>', this, '<%=login_case %>', '<%=equalsSellerId %>', '<%=user_id %>');" />
                                <%} 
                                
                            }%>
                            
                            <%if(reviewPage.isNext()){ %>
                                <input type="button" value="다음" disabled class="page__abled--prev-btn" 
                                    onclick="reviewPageList(this);" />
                            <%}else{ %>
                                <input type="button" value="다음" disabled class="page__disabled--prev-btn"/>
                            <%} %>
                            
                            </div>
                            
                            <div id="review__page--set">
                                <input type="text" value="1" onchange="reviewTextPageMove(this);" 
                                    oninput="reviewTextPage(this, '<%=(int)(Math.ceil((double)reviewNum / 5.0)) %>');" />
                                <span> / <%=(int)(Math.ceil((double)reviewNum / 5.0)) %> Page</span>
                            </div>
                            
                        </div>

                    </div>

                    <hr />

                    <!-- 상품 문의 -->
                    <div class="customer-qna" id="customer-qna">
                        <h4 class="seller-head">상품 문의 <span style="color: cornflowerblue;"><%=countQna %></span></h4>
                        
                        <div id="modal__qna">
                            <div id="modal__qna--content">
                                <div id="qna__write--title">
                                    <h2>상품 문의</h2>
                                    <a href="javascript:;" id="modal__qna--close" onclick="modal_qna_cancle();">X</a>
                                </div>
                                
                                <form id="qnaForm" method="post" action="BoardQnaRegist.bo" 
                                    onsubmit="return qna_regist();">
                                <input type="hidden" name="seller_id" id="seller_id" 
                                    value="<%=vo.getSeller_id() %>" />
                                
                                <div id="qna__write--info">
                                    <span>문의종류 </span>
                                    <select id="qna__write--info-select" name="qna_status">
                                        <option value=1>상품</option>
                                        <option value=2>배송</option>
                                        <option value=3>취소</option>
                                        <option value=4>반품/취소</option>
                                        <option value=5>교환</option>
                                        <option value=6>기타</option>
                                    </select>
                                    <input type="checkbox" id="secret__check"/> 비밀글
                                </div>
                                
                                
                                
                                <div id="qna__write--content">
                                    <span>제목 </span> 
                                    <input type="text" id="qna__write--content-title" 
                                        maxlength="200" name="title" />
                                    <textarea id="qna-content--text" maxlength="500" name="content" 
                                        placeholder="문의사항을 500자 이내로 입력해주세요."></textarea>
                                    <input type="submit" value="작성완료" id="qna-submit-btn" />
                                    <input type="button" onclick="modal_qna_cancle();" value="취소" id="qna-cancle-btn"/>
                                </div>            
                                
                                
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="hidden" value="<%=vo.getBoard_id() %>" name="board_id"/>
                                    <input type="hidden" value="<%=user_id %>" name="user_id" id="user_id" />
                                    <input type="hidden" value="<%=user_id %>" name="buyer_id" id="buyer_id" />
                                </form>
                               
                            </div>
                        </div>
                        
                        <div id="customer-qna__info">
                            <div id="customer-qna__search">
                                <select id="customer-qna__search--select">
                                    <option>제목</option>
                                </select>
                                <input type="text" id="customer-qna__search--text" />
                                <input type="button" id="customer-qna__search--btn" value="검색" 
                                    onclick="searchQnaList(1);" />
                                <input type="hidden" value="" id="customer-qna__search--text-save" />
                                <span id="qna__search--result">검색된 결과 <strong><%=countQna %></strong> 건</span>
                            </div>
                            
                        <sec:authorize access="isAuthenticated() and hasRole('BUYER')">
                        
                            <div id="customer-qna__write">
                                <input type="button" id="customer-qna__write--btn" value="문의작성"
                                    onclick="modal_qna_write();" />
                            </div>
                        </sec:authorize>
                        </div>
                        
                        <div class="customer-qna__table">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="customer-qna__table--num">번호</th>
                                        <th class="customer-qna__table--divide">
                                            <span class="customer-qna__table--search" 
                                                onclick="qnaDropBox(this);">문의종류</span>
                                            <ul class="customer-qna__table--drop-box"
                                                style="display: none;">
                                                <li onclick="qnaDropBoxSearch(this, 10);"
                                                    style="color: dodgerblue;">전체</li>
                                                <li onclick="qnaDropBoxSearch(this, 1);">상품</li>
                                                <li onclick="qnaDropBoxSearch(this, 2);">배송</li>
                                                <li onclick="qnaDropBoxSearch(this, 3);">취소</li>
                                                <li onclick="qnaDropBoxSearch(this, 4);">반품/취소</li>
                                                <li onclick="qnaDropBoxSearch(this, 5);">교환</li>
                                                <li onclick="qnaDropBoxSearch(this, 6);">기타</li>
                                            </ul>
                                            <input type="hidden" value="10" id="qna__drop-box--qna" />
                                        </th>
                                        <th class="customer-qna__table--status">
                                            <span class="customer-qna__table--search" 
                                                onclick="qnaDropBox(this);">답변상태</span>
                                            <ul class="customer-qna__table--drop-box" 
                                                style="display: none;">
                                                <li onclick="qnaDropBoxSearch(this, 10);"
                                                    style="color: dodgerblue;">전체<li>
                                                <li onclick="qnaDropBoxSearch(this, 2);">답변대기중<li>
                                                <li onclick="qnaDropBoxSearch(this, 1);">답변완료</li>
                                            </ul>
                                            <input type="hidden" value="10" id="qna__drop-box--answer" />
                                        </th>
                                        <th class="customer-qna__table--title">제목</th>
                                        <th class="customer-qna__table--user">문의자</th>
                                        <th class="customer-qna__table--date">등록일</th>
                                    </tr>
                                </thead>
                                <%
                                        
                                        
                                        %>
                                <tbody>
                                    <%if(qna_list.size() != 0){ 
                                    for(int i = 0; i < qna_list.size(); i++){
                                        
                                        StringBuilder getQnaId 
                                            = new StringBuilder(qna_list.get(i).getBuyer_id().substring(0,3));
                                    
                                        for(int j = 0; j < qna_list.get(i).getBuyer_id().length() - 3; j++){
                                    	    getQnaId.append("*");
                                        }
                                    
                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            		    String getQnaDate = sdf.format(qna_list.get(i).getRegister_date()); 
                            		    
                            		    String qna_status = null;
                            		    
                            		    switch(qna_list.get(i).getQna_status()){
                            		    case 1:
                            		    	qna_status = "상품";
                            		    	break;
                            		    case 2:
                            		    	qna_status = "배송";
                            		    	break;
                            		    case 3:
                            		    	qna_status = "취소";
                            		    	break;
                            		    case 4:
                            		    	qna_status = "반품/취소";
                            		    	break;
                            		    case 5:
                            		    	qna_status = "교환";
                            		    	break;
                            		    case 6:
                            		    	qna_status = "기타";
                            		    	break;
                            		    }
                            		    
                                    %>
                                    <tr class="customer-qna__table--tr" onclick="qnaDisplayOpen(this, '<%=i%>');">
                                        <td><%=qna_list.get(i).getQna_num()%></td>
                                        <td><%=qna_status %></td>
                                        <%if(qna_list.get(i).getAnswer_status() == 1){ %>
                                        <td class="customer-qna__table--td-answer" style="color: cornflowerblue;">답변완료</td>
                                        <%}else{ %>
                                        <td class="customer-qna__table--td-answer" style="color: cadetblue;">답변대기중</td>
                                        <%} %>
                                        <%if(user_id.equals(vo.getSeller_id()) || 
                                        		user_id.equals(qna_list.get(i).getBuyer_id())|| 
                                        		qna_list.get(i).getSecret_flag() != 1){ %>
                                        <td class="customer-qna__table--title-td"><%=qna_list.get(i).getTitle() %></td>
                                        <%}else{ %>
                                        <td class="customer-qna__table--title-td">비밀글입니다.</td>
                                        <%} %>
                                        <td class="customer-qna__table--user-td"><%=getQnaId.toString() %></td>
                                        <td><%=getQnaDate %></td>
                                    </tr>
                                    <tr class="customer-qna__table--content-answer">
                                        <td colspan="6">
                                        <%if(user_id.equals(vo.getSeller_id()) || 
                                        		user_id.equals(qna_list.get(i).getBuyer_id())|| 
                                        		qna_list.get(i).getSecret_flag() != 1){ %>
                                            <div>
                                                <span class="customer-qna__table--content-Q">Q</span>
                                                <%=qna_list.get(i).getContent() %>
                                            </div>
                                            <%if(qna_list.get(i).getAnswer_status() == 1){ %>
                                            <div id="customer-qna__table--recommend-<%=i%>">
                                                <span class="customer-qna__table--content-A">A</span>
                                                <span class="qna__content--recommend"><%=qna_list.get(i).getRecommend() %></span>
                                            </div>
                                            <div>
                                            <%SimpleDateFormat qnaRecommendDateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
                                            String qnaRecommendDate = qnaRecommendDateFormat.format(qna_list.get(i).getRecommend_date());
                                            qnaRecommendDate.replace("AM", "오전");
                                            qnaRecommendDate.replace("PM", "오후"); %>
                                                <span>답변 등록일: &nbsp;&nbsp;&nbsp;</span>
                                                <span class="qna__recommend-date--format"><%=qnaRecommendDate %></span>
                                                <%if(user_id.equals(vo.getSeller_id())){ %>
                                                <input type="button" value="수정하기" class="qna__recommend--modify-btn" 
                                                    onclick="recommendModify('<%=i%>');" />
                                                <%} %>
                                            </div>
                                            <%} %>
                                            
                                            <%if(user_id.equals(vo.getSeller_id()) && qna_list.get(i).getAnswer_status() != 1){%>
                                            <div class="recommend-submit-box" style="display: block;"> 
                                            <%}else{ %>
                                            <div class="recommend-submit-box" style="display: none;">
                                            <%} %>
                                            <textarea maxlength="500" class="qna__recommend--content"></textarea>
                                                <input type="button" value="답변등록" class="qna__recommend--btn" 
                                                    onclick="qnaRecommendSubmit('<%=i%>', '<%=qna_list.get(i).getQna_num()%>');" />
                                            </div>
                                        <%}else{ %>
                                            <div>비밀글입니다.</div>
                                        
                                        <%} %>
                                            
                                            
                                        </td>
                                    </tr>
                                    <%}
                                    }else{ %>
                                    
                                    <tr>
                                        <td colspan="6" class="customer-qna__table--none-content">등록된 문의글이 없습니다.</td>
                                    </tr>
                                    <%} %>
                                
                                    
                                </tbody>
                            </table>
                        </div>
                        
                        <div id="customer-qna__table--page">
                        <% // 페이지메이커 생성, 현재 페이지 1페이지, 보여줄 댓글 개수 5개, 총갯수 고정
                           // 이후는 비동기로 처리
                        PageMaker qnaPage = new PageMaker(1, 10	, countQna);
                        
                       
                        %>
                            
                            <div id="qna__page--btn">
                            <%if(qnaPage.isPrev()){ %>    
                                <input type="button" value="이전" class="page__abled--prev-btn" 
                                    onclick="qnaRePaging(1);" />
                            <%}else{ %>
                                <input type="button" value="이전" disabled class="page__disabled--prev-btn"/>
                            <%}
                            for(int i = qnaPage.getStartPage(); i < qnaPage.getEndPage()+1; i++){
                            	
                                if(i == qnaPage.getPage_num()){%>
                                <input type="button" value="<%=i%>" id="qna__table--now-page" />
                                
                                <%}else{ %>
                                <input type="button" value="<%=i%>" class="qna__table--page-move" 
                                    onclick="pageBtnMove(this);"/>
                                <%} 
                                
                            }%>
                            
                            <%if(qnaPage.isNext()){ %>
                                <input type="button" value="다음" class="page__abled--prev-btn" 
                                    onclick="qnaRePaging(11);" />
                            <%}else{ %>
                                <input type="button" value="다음" disabled class="page__disabled--prev-btn"/>
                            <%} %>
                            
                            </div>
                            
                            <div id="qna__page--set">
                                <input type="text" value="1" onchange="qnaTextPageMove(this);" 
                                    oninput="qnaTextPage(this, '<%=(int)(Math.ceil((double)countQna / 10.0)) %>');" />
                                <span> / <%=(int)(Math.ceil((double)countQna / 10.0)) %> Page</span>
                            </div>
                            
                        </div>

                    </div>

                    <hr />

                    <!-- 배송/교환/환불안내 -->
                    <div class="seller-etc" id="seller-etc">
                        <h4 class="seller-head">
                            배송/교환/환불안내
                        </h4>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt>반품/교환 안내</dt>
                                <dd>* 반품/교환에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.</dd>
                            </dl>
                        </div>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt><br /><br />반품/교환 사유에 따른 요청 가능 기간</dt>
                                <dd>* 반품 시 먼저 판매자와 연락하셔서 반품사유,택배사,배송비,반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.<br /><br />
                                    &nbsp;&nbsp;1. 구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품배송비 부담)<br />
                                    &nbsp;&nbsp;2. 표시/관고와 상이, 상품하자의 경우 상품 수령 후  3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내.<br /><br />
                                    &nbsp;&nbsp;둘 중 하나 경과 시 반품/교환 불가(판매자 반품배송비 부담)
                                </dd>
                            </dl>
                        </div>

                        <div class="rs-td-etc">
                            <dl class="rs-table-box">
                                <dt><br /><br /><br /><br /><br /><br />반품/교환 불가능 사유</dt>
                                <dd>1. 반품요청기간이 지난 경우<br /><br />
                                    2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)<br /><br />
                                    3. 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예:식품,화장품,향수류,음반 등)<br /><br />
                                    4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)<br /><br />
                                    5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br /><br />
                                    6. 고객주문 확인 후 상품제작에 들어가는 주문제작상품<br /><br />
                                    7. 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>

                <hr />
                
            </div>
        </div>
    </main>
    <!-- contents 끝 -->


    <script type="text/javascript" src="<c:url value='/resources/js/BoardProduct/boardProductView.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/BoardProduct/recentProduct.js?after'/>" ></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>