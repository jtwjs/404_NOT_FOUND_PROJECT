<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_productRegister.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css?after'/>" rel="stylesheet" />
    <title>판매자 상품등록</title>
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
	  		  <strong>상품등록</strong>
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
                            <form id="productUploadForm" method="post" onsubmit="return registCheck();" 
                                action="BoardProductRegist.bo" enctype="multipart/form-data">
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
								</div>
								<div class="product-name article-wrap">
									<h2 class="article-title">게시물제목</h2>
									<div class="input_wrap">
										<input type="text" id="board_name" placeholder="게시물의 제목을 적어주세요" />
									</div>
								</div>
								
								<div class="product-detail_1 article-wrap">
									<div class="product_representImg">
										<h2 class="article-title">상품대표이미지</h2>
										<input type="file" id="representImg" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" />
										<label for="representImg" id="representImgLabel">이미지 등록</label>
									</div>
									<div class="detail_1-desc_wrap"> 
										<div class="detail_1-desc_1">
											<h2 class="article-title">상품이미지</h2>
											<div class="productImg">	
												<input type="file" id="productImg1" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" />
												<label for="productImg1" id="productImg1Label">이미지 등록</label>
												<input type="file" id="productImg2" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" />
												<label for="productImg2" id="productImg2Label">이미지 등록</label>
												<input type="file" id="productImg3" class="hidden" accept="image/*;capture=camera,.gif, .jpg, .png" />
												<label for="productImg3" id="productImg3Label">이미지 등록</label>
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
	                                             <input type="text" value ="" placeholder="나머지 입력  예) 속초" 
                                                id="code04_idx" class="product_input2" maxlength="53" />
                                          	</div> 
                                          	<div class="product_weight">
												<h2 class="article-title">중량</h2>
												<input type="text" id="weight" class="product_input3"/>
												<select name="pd_symbol" id="pd_symbol" class="product_input4">
	                                                <option value="Kg">Kg</option>
	                                                <option value="근">근</option>
	                                                <option value="개">개</option>
	                                                <option value="g">g</option>
	                                                <option value="톤">톤</option>
	                                                <option value="묶음">묶음</option>
                                            	</select>
											</div>
											
										</div>
										<div class="detail_1-desc_2">
											<h2 class="article-title">상품카테고리</h2>
											 <select name="category_1" id="code01_idx" class="select-btn1 product_input"
                                                    onchange="selectedOption_1();">
                                                    <option value="" selected disabled>선택하세요.</option>
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
                                             <h2 class="article-title">재고량</h2>
                                             <input type="text" id="totalStock" class="product_input"/>
                                             <h2 class="article-title">금액</h2>
                                             <input type="text" id="product_amount" class="product_input"/>
                                             <div class="seller_info">
                                             	<div class="info_name">
		                                             <h2 class="article-title">판매자명</h2>
													<input type="text" id="seller_name" class="product_input5"/>
												</div>
												<div class="info_tel">
													<h2 class="article-title">연락처</h2>
													<input type="text" id="seller_tel" class="product_input6" />
												</div>
											</div>
										</div>
									</div>
								</div>
                            <!-- 등록 버튼 -->
	                            <div class="finish">
	                                <br />
	                                <input type="submit" class="submitBtn" value="등록" onclick="return registCheck();"/>
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




    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_productRegister.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>