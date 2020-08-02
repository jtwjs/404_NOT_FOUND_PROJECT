<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="<c:url value='/resources/css/Seller/mypage_productRegister2.css'/>" rel="stylesheet" />
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
                        <h2 class="content-title">상품수정</h2>
                    
                        <div class="mypage-upload">

                            <div class="uploadBox">
                                <table class="uploadBox__table">
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input type="text" name="sales_producer" value="${product.sales_producer}" readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td>
                                            <input type="text" class="setNumberTel" name="consumer_consulation"
                                                value="${product.consumer_consulation}" readonly="readonly" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상품 카테고리</th>
                                        <td class="select-btn">
                                            <p>
                                                <select name="code01_idx">
                                                    <option value="">선택하세요.</option>
                                                    <option value="1">쌀/잡곡</option>
                                                    <option value="2">채소류</option>
                                                    <option value="3">과일</option>
                                                    <option value="4">축산물</option>
                                                    <option value="5">수산물/건어물</option>
                                                    <option value="6">가공식품/떡류</option>
                                                    <option value="7">김치/반찬/젓갈</option>
                                                    <option value="8">장/조청/식초</option>
                                                    <option value="9">건강식품</option>
                                                    <option value="10">차류</option>
                                                </select>
                                            </p>
                                            <p>
                                                <select name="code02_idx" class="select-btn2">
                                                    <option value="">선택하세요.</option>
                                                </select>
                                            </p>
                                            <script>
                                                $(function () {
                                                    $("select[name=code01_idx]").change(function (e) {

                                                        code01_idx = $(this).val();

                                                        jQuery.ajax({
                                                            type: "POST",
                                                            url: "ajax_code2_idx.php",
                                                            data: { code01_idx: code01_idx },
                                                            success: function (data) {
                                                                $("select[name=code02_idx]").empty().append(data)
                                                            }
                                                        });
                                                    });
                                                })
                                            </script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>제목</th>
                                        <td>
                                            <input type="text" name="title" value="${product.title}" 
                                                placeholder="제목을 입력하세요." id="setTitle" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>지역</th>
                                        <td class="addr">
                                            <input type="text" id="sample4_postcode" class="inputAddrNum"
                                                name="addr_num" placeholder="우편번호">
                                            <button type="button" class="addrNumBtn"
                                                onclick="sample4_execDaumPostcode()">우편번호찾기</button><br>
                                            <input type="text" id="sample4_roadAddress" class="inputAddr1"
                                                id="sample4_roadAddress" placeholder="도로명주소">
                                            <span id="guide" style="color:#999;display:none"></span>
                                            <input type="text" class="inputAddr2" id="sample4_detailAddress"
                                                placeholder="상세주소">
                                            <script
                                                src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>단위</th>
                                        <td>
                                            <input type="text" name="pd_unit" value="0" class=""
                                                onKeyUp="removeChar(event);inputNumberFormat(this);"
                                                onKeyDown="inputNumberFormat(this);" />
                                            <select name="pd_symbol">
                                                <option value="21">Kg</option>
                                                <option value="22">근</option>
                                                <option value="23">개</option>
                                                <option value="24">g</option>
                                                <option value="25">톤</option>
                                                <option value="26">묶음</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>거래량</th>
                                        <td>
                                            <input type="text" name="quantity" value="${product.quantity}" class="setComma" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <th>금액</th>
                                        <td>
                                            <input type="text" name="price" value="${product.price}" class="setComma" />
                                            원
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>썸네일</th>
                                        <td class="form-two">
                                            <ul class="add_file">
                                                <li class="on">
                                                    <div class="comment_add_file">
                                                        <input name="file5_filename" type="file" />
                                                        <input name="file5" type="hidden">
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
                                                        <input name="file1_filename" type="file" />
                                                        <input name="file1" type="hidden">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="file2_filename" type="file" />
                                                        <input name="file2" type="hidden">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="file3_filename" type="file" />
                                                        <input name="file3" type="hidden">
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="comment_add_file">
                                                        <input name="file4_filename" type="file" />
                                                        <input name="file4" type="hidden">
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
                                                <div id="summernote"></div>

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
                                <button type="button" class="submitBtn" onclick="location.href='SellerProductModify.se'">수정</button>
                                <button type="button" class="resetBtn" onclick="location.href='SellerProductList.se'">취소</button>
                            </div>
                            
                        </div>
                    
                    
                    </section>
                    
                </section>
            </div>
        </div>
    </div>
    
    </main>




    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js'/>" ></script>
    <!-- footer,js end -->
</body>
</html>