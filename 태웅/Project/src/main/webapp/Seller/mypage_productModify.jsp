<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/header.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
    <link href="<c:url value='/resources/css/Common/sub_main.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_productRegister.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css'/>" rel="stylesheet" />
    <title>판매자 상품 수정</title>
</head>
<body>
<section id="sub-main" class="seller">
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
	  		  <strong>상품 수정</strong>
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
                        <h2 class="content-title">상품등록</h2>
                    
                        <div class="mypage-upload">
                            <form id="productUploadForm" method="post" onsubmit="return registCheck();"  action="BoardProductModify.bo" enctype="multipart/form-data">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<input type="hidden" value="${product.board_id}" name="board_id" />
								<div class="product-category1 article-wrap">
									<h2 class="article-title">상품유형</h2>
									<ul class="category1_list">
										<li class="category1_list-item">
											<button type="button" id="grain">쌀/잡곡</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="vegetable">채소류</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="fruit">과일</button>	
										</li>
										<li class="category1_list-item">
											<button type="button" id="liveStock">축산물</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="aquatic">수산물/건어물</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="processedFood">가공식품/떡류</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="kimchi">김치/반찬/젓갈</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="jang">장/조청/식초</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="health">건강식품</button>
										</li>
										<li class="category1_list-item">
											<button type="button" id="tea">차류</button>
										</li>
									</ul>
									<input type="hidden" name="category_1" id="product_type" value="${product.category_1}" />
								</div>
								<div class="product-name article-wrap">
									<h2 class="article-title">게시물제목</h2>
									<div class="input_wrap">
										<input type="text" name="title" id="board_name" placeholder="게시물의 제목을 적어주세요" value="${product.title }" />
									</div>
								</div>
								
								<div class="product-detail_1 article-wrap">
									<div class="product_representImg">
										<h2 class="article-title">상품대표이미지</h2>
										<input type="file" name="thumbnail_origin" id="representImg" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" onchange="return checkExtension(this, 1);"/>
										<label for="representImg" id="representImgLabel">이미지 등록</label>
										<input type="hidden" id="repImg" value="${product.thumbnail_thum_path}${product.thumbnail_thum}" />
									</div>
									<div class="detail_1-desc_wrap"> 
										<div class="detail_1-desc_1">
											
											<div class="product_info_1">
												<div class="product-name">
													<h2 class="article-title">상품명</h2>
													<input type="text"name="product_name" id="ProductName" class="product_input2" maxlength="14" value="${product.product_name}"/>
												</div>
												<div class="product_stock">
													<h2 class="article-title">재고량</h2>
	                                             	<input type="text" name="quantity"id="totalStock" class="product_input" maxlength="3" value="${product.quantity}"/>
                                             	</div>
											</div>
											<div class="product_country">
												<h2 class="article-title">원산지</h2>
												<select name="category_local" id="code03_idx" class="select-btn1 product_input2">
	                                                <option value="" selected disabled>선택하세요.</option>
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
	                                            <input type="hidden" value="${product.category_local}" id="categoryLocal"/>
	                                             <input type="text" value ="${fn:substringAfter(product.product_country, ' ')}" placeholder="나머지 입력  예) 속초" 
                                                id="code04_idx" class="product_input2" maxlength="14" />
                                                <input class="hidden"name="product_country" id="setProductCountry" />
                                          	</div> 
                                          	<div class="product_weight">
												<h2 class="article-title">중량</h2>
												<input type="text" id="pd_unit" class="product_input3" value="${intWeight}"/>
												<input type="hidden" id="strWeight" value="${strWeight}"/>
												<select name="pd_symbol" id="pd_symbol" class="product_input4">
	                                                <option value="Kg">Kg</option>
	                                                <option value="근">근</option>
	                                                <option value="개">개</option>
	                                                <option value="g">g</option>
	                                                <option value="톤">톤</option>
	                                                <option value="묶음">묶음</option>
                                            	</select>
               	                              <input type="hidden" name="product_weight" id="setProductWeight" value="" />
											</div>
											 <div class="storage_size">
											 	<div class="size">
											 	   <h2 class="article-title">상품크기</h2>
                                             	   <input type="text" name="product_size" id="productSize" class="product_input" maxlength="15" placeholder="예) 215 * 50 * 30 mm"  value="${product.product_size}"/>
											 	</div>
											 	<div class="storage">
                                             	   <h2 class="article-title">보관방법</h2>
                                             	   <input type="text" name="storage_method" id="storageMethod" class="product_input" placeholder="예) 냉장보관" maxlength="15"  value="${product.storage_method}"/>
                                           	    </div>
                                             </div>
											
											
										</div>
										<div class="detail_1-desc_2">
											<div class="category">
												<h2 class="article-title">상품카테고리</h2>
											  	<select name="category_2" id="code02_idx" class="select-btn2 product_input">
                                                    <option value="${product.category_2}"  id="category2"selected disabled>선택하세요.</option>
                                                </select>
                                                </div>
                                             <div class="amount">
                                             	<div class="amount-product">
		                                             <h2 class="article-title">판매가격</h2>
		                                             <input type="text" name="price" id="product_amount" class="product_input5" maxlength="9" value="${product.price}"/>
	                                            </div>
	                                            <div class="amount-delivery">
		                                            <h2 class="article-title">배송비</h2>
		                                             <input type="text" name="delivery_price" id="delivery_amount" class="product_input5" maxlength="9" value="${product.delivery_price}"/>
	                                            </div>
                                             </div>
                                            <div class="manufacture">
												<h2 class="article-title">제조년도</h2>
												<input type="text" name="date_manufacture" id="manufacture-year" class="product_input"  placeholder="예) 2020년 06월 30일 생산" maxlength="15" value="${product.date_manufacture}" />
												
											</div>
											<div class="expirationDate">
												  <h2 class="article-title">품질유지기한(유통기한)</h2>
												  <input type="text"name="best_before_date" id="expiration" class="product_input"placeholder="예) 2020년 09월 30일 까지" maxlength="15" value="${product.best_before_date }"/>
											</div>
										</div>
									</div>
								</div>
								<div class="product-detail_2 article-wrap">
									<div class="product_img">
										<h2 class="article-title">상품이미지</h2>
										<div class="productImg">	
											<input type="file" name="product_origin_2" id="productImg1" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" onchange="return checkExtension(this, 2);"/>
											<label for="productImg1" id="productImg1Label">이미지 등록</label>
											<input type="hidden" id="productThumbImg2" value="${product.product_origin_path}${product.product_origin_2}" />
											<input type="file" name="product_origin_3" id="productImg2" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" onchange="return checkExtension(this, 3);" />
											<label for="productImg2" id="productImg2Label">이미지 등록</label>
											<input type="hidden" id="productThumbImg3" value="${product.product_origin_path}${product.product_origin_3}" />
											<input type="file" name="product_origin_4" id="productImg3" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" onchange="return checkExtension(this, 4);"/>
											<label for="productImg3" id="productImg3Label">이미지 등록</label>
											<input type="hidden" id="productThumbImg4" value="${product.product_origin_path}${product.product_origin_4}" />
										</div>
									</div>
									<div class="additional_info">
										<div class="transGenic">
											<h2 class="article-title">유전자 변형 농수산물 표시</h2>
											<input type="text" name="transgenic" id="transGenic" class="product_input5" placeholder="예) 특이사항 혹은 o,x 표기"maxlength="12" value="${product.transgenic}"/>
										</div>
										<div class="producer">
											<h2 class="article-title">판매생산자명</h2>
											<input type="text" name="sales_producer" id="salesProducer" class="product_input5" maxlength="12" value="${product.sales_producer}" />
										</div>
										<div class="consulation">
											<h2 class="article-title">소비자상담문의</h2>
											  <input type="text" name="consumer_consulation" id="consumerConsulation" class="product_input" placeholder="예) 010-0000-0000" maxlength="16"  value="${product.consumer_consulation}" />
										</div>
									</div>
								</div>
                            <!-- 등록 버튼 -->
	                            <div class="finish">
	                                <br />
	                                <input type="submit" class="submitBtn" value="수정" onclick="return registCheck();"/>
	                                <input type="button" class="resetBtn" value="취소" onclick="location.href='SellerMyPage.se'" />
	                            </div>    
                            </form>
                        </div>                
                </section>
               </section>
            </div>
        </div>
    </div>
    
    </main>




    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_productModify.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>