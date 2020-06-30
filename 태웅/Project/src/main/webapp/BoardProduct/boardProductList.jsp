<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int nowpage = 0;
    int startpage = 0;
    int endpage = 0;
    int maxpage = 0;
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
<body>
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
                            <b><a href="#">쌀 / 잡곡</a></b>
                        </div>

                        <hr />

                        <table>
                            <tr>
                                <td>
                                    <div class="category_contents"></div>
                            </tr>
                            <tr>
                                <td><a href="#">· 백미</a></td>
                                <td><a href="#">· 현미 / 찹쌀 / 흑미</a></td>
                                <td><a href="#">· 콩 / 팥 / 보리</a></td>
                                <td><a href="#">· 조 / 수수 / 깨 / 기타</a></td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td><a href="#">· 곡류선물세트</a></td>
                            </tr>
                        </table>
            
                        <hr />

                        <div>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="left">
                                        전체 상품 () 개
                                    </td>
                                    <td align="right">
                                        <a href="#">인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#">최근등록순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#">판매인기순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#">낮은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a href="#">높은가격순</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                                        <select class="qty_view" name="perpage"
                                            onchange="document.location.href='?perpage='+this.value+'&code=0004'">
                                            <option value="32">32개씩 보기</option>
                                            <option value="64">64개씩 보기</option>
                                            <option value="96">96개씩 보기</option>
                                            <option value="192">192개씩 보기</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="clear"></div>

                        <hr />

                        <div id="new">
                            <div class="item_box" onclick="javascript:location.href='BoardProductView.bo'">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 4kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">20,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 20kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">75,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찹쌀 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찹쌀입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>

                            <div class="clear"></div>

                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 4kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">20,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 20kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">75,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찹쌀 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찹쌀입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>

                            <div class="clear"></div>

                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 4kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">20,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찰현미 20kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찰현미입니다.</li>
                                    <li class="price">75,000원</li>
                                </ul>
                            </div>
                            <div class="item_box">
                                <ul class="item">
                                    <li><img src="./resources/Images/BoardProduct/exRice.png"></li>
                                    <li class="subject">홍천곡산 고향찹쌀 10kg</li>
                                    <li class="comment">구수한 누룽지 향이 일품인 찹쌀입니다.</li>
                                    <li class="price">40,000원</li>
                                </ul>
                            </div>
                        </div> 
                        <!-- new 끝-->

                        <br />

                        <div class="clear"></div>

                        <div>
                            <tr align="center" height="20">
                                <td colspan=7 style=font-family:Tahoma;font-size:10pt;>
                                    <%if(nowpage<=1){ %>
                                    [이전]&nbsp;
                                    <%}else{ %>
                                    <a href="./boardlist.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
                                    <%} %>
                                
                                    <%for(int a=startpage;a<=endpage;a++){
                                          if(a==nowpage){%>
                                        [<%=a %>]
                                        <%}else{ %>
                                        <a href="./boardlist.bo?page=<%=a %>">[<%=a %>]</a>
                                        &nbsp;
                                        <%} %>
                                    <%} %>
                                
                                    <%if(nowpage>=maxpage){ %>
                                    [다음]
                                    <%}else{ %>
                                    <a href="./boardlist.bo?page=<%=nowpage+1 %>">[다음]</a>
                                    <%} %>
                                </td>
                            </tr>
                        </div>

                        <br /><hr /><br />

                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- contents 끝 -->


    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>