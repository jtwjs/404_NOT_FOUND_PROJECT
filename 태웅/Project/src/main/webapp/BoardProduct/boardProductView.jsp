<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="com.spring.boardproduct.BoardProductVO" %>
<%@ page import="com.spring.boardproduct.BoardReviewVO" %>
<%@ page import="com.spring.boardproduct.CommentReviewVO" %>
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
    double reviewNumCalc = 0.0;
    if((int)request.getAttribute("reviewNum") != 0){
    	reviewNum = (int)request.getAttribute("reviewNum");
    	
    	for(int i = 0; i < reviewNum; i++){
    		reviewNumCalc += review_list.get(i).getSatisfaction();
    	}
    	
    	reviewNumCalc /= reviewNum;
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
                            <div class="seller-imgBig">
                                <% String origin_path = java.net.URLEncoder.encode(vo.getProduct_origin_path(), "UTF-8"); 
                                   String thumb_path = java.net.URLEncoder.encode(vo.getProduct_thum_path(), "UTF-8"); 
                                if(vo.getProduct_thum_1() != null){ %>
                                <img src="display?path=<%=origin_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_origin_1(), "UTF-8") %>" alt="">
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
                                    <li onclick="selectBigImg('<%=origin_path %>', '<%=java.net.URLEncoder.encode(vo.getProduct_origin_1(), "UTF-8")%>');">
                                        <img src="display?path=<%=thumb_path %>&name=<%=java.net.URLEncoder.encode(vo.getProduct_thum_1(), "UTF-8") %>" alt="" >
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
                                        <span><%=reviewNum %> 건 <%=reviewNumCalc%> / 5</span>
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
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
                                <div class="seller__btnWrap">
                                    <button type="button" class="button1" id="buy-btn" 
                                        onclick="buyForm('<%=user_id %>', '<%=login_case%>');">
                                    <b>구매하기</b></button>
                                </div>
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
                        
                        <sec:authorize access="isAuthenticated() and hasRole('BUYER')">
                            <div id="customer-review__write">
                                <input type="button" id="customer-review__write--btn" value="리뷰작성"
                                    onclick="modal_review_write('<%=vo.getBoard_id() %>', '<%=user_id %>');" />
                            </div>
                        </sec:authorize>
                        
                        <div id="modal__review">
                            <div id="modal__review--content">
                                <div id="review__write--title">
                                    <h4>상품평 남기기</h4>
                                    <a href="javascript:;" id="modal__reivew--close" onclick="modal_review_cancle();">X</a>
                                    
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
                                    	
                                    for(int i = 0; i < reviewNum; i++){ 
                                    	int flag = 2;
                                    	if(reviewComment.get(i).length != 0){
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
                                            <div class="recommend-1">적극비추천</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 2.0){ %>
                                            <div class="recommend-2">추천 안함</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 3.0){ %>
                                            <div class="recommend-3">보통</div>
                                            <%}else if(review_list.get(i).getSatisfaction() <= 4.0){ %>
                                            <div class="recommend-4">추천</div>
                                            <%}else { %>
                                            <div class="recommend-5">적극추천</div>
                                            <%} %>
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
                                            <div id="customer-review__table--star-rating">
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

                    </div>

                    <hr />

                    <!-- 상품 문의 -->
                    <div class="customer-qna" id="customer-qna">
                        <h4 class="seller-head">
                            상품 문의
                        </h4>
                        <div class="customer-qna__table">
                            <table>
                                <thead>
                                    <tr>
                                        <td class="customer-review__table--num" align="center">번호</td>
                                        <td class="customer-review__table--title" align="center">후기</td>
                                        <td class="customer-review__table--date" align="center">작성일</td>
                                        <td class="customer-review__table--hit" align="center">조회</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="4" class="customer-qna__table--none-content" align="center">등록된 게시글이 없습니다</td>
                                    </tr>
                                    
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
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