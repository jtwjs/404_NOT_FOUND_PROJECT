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
                        
                            <%String user_id = ""; %>
                            <sec:authorize access="isAuthenticated()">
                                <sec:authentication var="user" property="principal.username" />
                                <%user_id = pageContext.getAttribute("user").toString();%>
                            </sec:authorize>
                            
                            <form id="productUploadForm" method="post" onsubmit="return registCheck();" 
                                action="BoardProductRegist.bo" enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            
                            <input type="hidden" name="seller_id" value="<%=user_id%>"/>
                            
                            <div class="uploadBox">
                                <table class="uploadBox__table">
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            <input type="text" name="title" value="" 
                                                placeholder="제목을 입력하세요." id="setTitle" maxlength="100" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품 카테고리</th>
                                        <td class="select-btn">
                                            <p>
                                                <select name="category_1" id="code01_idx" class="select-btn1"
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
                                            </p>
                                            <p>
                                                <select name="category_2" id="code02_idx" class="select-btn2">
                                                    <option value="" selected disabled>선택하세요.</option>
                                                </select>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>금액</th>
                                        <td>
                                            <input type="text" name="price" id="setPrice" class="setComma" />
                                            원
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>배송비</th>
                                        <td>
                                            <input type="text" name="delivery_price" id="setDeliveryPrice" class="setComma" />
                                            원
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>수량 (재고량)</th>
                                        <td>
                                            <input type="text" name="quantity" id="setQuantity" class="setComma" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>판매생산자</th>
                                        <td>
                                            <input type="text" name="sales_producer" maxlength="32" 
                                                id="setSalesProducer" value="윤기석" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품명</th>
                                        <td>
                                            <input type="text" name="product_name" maxlength="32" 
                                                id="setProductName" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>중량</th>
                                        <td>
                                            <input type="text" name="pd_unit" id="pd_unit" maxlength="28" />
                                            <select name="pd_symbol" id="pd_symbol">
                                                <option value="Kg">Kg</option>
                                                <option value="근">근</option>
                                                <option value="개">개</option>
                                                <option value="g">g</option>
                                                <option value="톤">톤</option>
                                                <option value="묶음">묶음</option>
                                            </select>
                                            <input type="hidden" name="product_weight" 
                                                id="setProductWeight" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>크기</th>
                                        <td>
                                            <input type="text" name="product_size" id="setProductSize" maxlength="32" 
                                                placeholder="예) 215 * 50 * 30 mm 혹은 -" value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>원산지</th>
                                        <td class="select-btn">
                                            <select name="category_local" id="code03_idx" class="select-btn1">
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
                                                id="code04_idx" maxlength="53" />
                                            <input type="hidden" value="" name="product_country" id="setProductCountry">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>제조년월일</th>
                                        <td>
                                            <input type="text" name="date_manufacture" id="setDateManufacture"
                                                placeholder="예) 2020년 06월 30일 생산" maxlength="32" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>품질유지기한(유통기한)</th>
                                        <td>
                                            <input type="text" name="best_before_date" id="setBestBeforeDate"
                                                placeholder="예) 2020년 09월 30일 까지" maxlength="32" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>유전자 변형 농수산물 표시</th>
                                        <td>
                                            <input type="text" name="transgenic" id="setTransGenic"
                                                placeholder="예) 특이사항 혹은 o,x 표기" maxlength="32" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>보관방법</th>
                                        <td>
                                            <input type="text" name="storage_method" id="setStorageMethod"
                                                placeholder="예) 냉장보관" maxlength="32" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>소비자상담문의</th>
                                        <td>
                                            <input type="text" name="consumer_consulation" id="setConsumerConsulation"
                                                placeholder="예) 010-0000-0000" maxlength="16" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>썸네일</th>
                                        <td class="form-two">
                                            <ul class="add_file">
                                                <li class="on">
                                                    <div class="comment_add_file">
                                                        <input name="thumbnail_origin" type="file" accept="image/*;capture=camera" 
                                                            id="thumbnail_origin" onchange="return checkExtension(this, 1);" />
                                                        <div id="image_container_thumbnail"></div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>대표이미지</th>
                                        <td class="form-two">
                                            <ul class="add_file">
                                                <li class="on">
                                                    <div class="comment_add_file">
                                                        <input name="product_origin_1" type="file" accept="image/*;capture=camera" 
                                                            id="product_origin_1" onchange="return checkExtension(this, 2);" />
                                                        <div id="image_container_product_1"></div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="product_origin_2" type="file" accept="image/*;capture=camera" 
                                                            id="product_origin_2" onchange="return checkExtension(this, 3);" />
                                                        <div id="image_container_product_2"></div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="product_origin_3" type="file" accept="image/*;capture=camera" 
                                                            id="product_origin_3" onchange="return checkExtension(this, 4);" />
                                                        <div id="image_container_product_3"></div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="product_origin_4" type="file" accept="image/*;capture=camera" 
                                                            id="product_origin_4" onchange="return checkExtension(this, 5);" />
                                                        <div id="image_container_product_4"></div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">
                                            <p>상품상세설명</p>
                                            <p class="fs14">* 사진 및 글을 자유롭게 올리시면 됩니다.</p>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div>
                                                <textarea id="summernote"></textarea>

                                                <script>
                                                    $(document).ready(function () {
                                                        
                                                        $('#summernote').summernote({
                                                            height: 500,                 // 에디터 높이
                                                            minHeight: null,             // 최소 높이
                                                            maxHeight: null,             // 최대 높이
                                                            focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
                                                            lang: "ko-KR",					// 한글 설정
                                                            onImageUpload: function (files, editor, welEditable) {
                                                                sendFile(files[0], editor, welEditable);
                                                            }
                                                        });
                                                        
                                                        
                                                    });

                                                </script>
                                            </div>                                        
                                        </td>
                                    </tr>                                   
                                </table>
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