<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String table = null;
    if((String)request.getAttribute("table") != null){
    	table = (String)request.getAttribute("table");
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
    <link href="<c:url value='/resources/css/Seller/mypage_marketPriceInfo.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Seller/mypage_template.css?after'/>" rel="stylesheet" />
    <title>시세정보</title>
</head>
<body>
  <section id="sub-main" class="mypage">
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
	  		  <strong>시세정보</strong>
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
                        <h2 class="content-title">시세정보</h2>
                        
                        <form id="content__search-box--form" method="get" 
                            action="SellerMarketPriceInfoSearch.se" onsubmit="return searchCheck();">
                            
                            <div id="content__search-box">
                            
                            <input type="date" id="content__search-box--date" 
                                name="regday" value=""/>
                            
                            <select id="select__search-box--local">
                                <option value="1">지역</option>
                                <option value="">전체</option>
                                <option value="1101">서울</option>
                                <option value="2100">부산</option>
                                <option value="2200">대구</option>
                                <option value="2401">광주</option>
                                <option value="2501">대전</option>
                            </select>
                            <input type="hidden" id="content__search-box--local" 
                                name="countycode" value=""/>
                            
                            <select id="select__search-box--classification">
                                <option value="1">분류</option>
                                <option value="100">식량작물</option>
                                <option value="200">채소류</option>
                                <option value="300">특용작물</option>
                                <option value="400">과일류</option>
                                <option value="600">수산물</option>
                            </select>
                            <input type="hidden" id="content__search-box--classification" 
                                name="itemcategorycode" value=""/>
                            
                            <input type="submit" value="조회하기" />
                            
                            </div>
                            
                        </form>
                        
                        <div id="content__search-box--explan-box">
                            <div class="explan-box__red-bold">도매시장 중도매인 상회에서 소상인 및 실수요자에게 판매하는 가격입니다.</div>
                            <div>농산물 특성상 크기와 색상 등이 다양하고 저장기간, 기후변화에 따라 동일 등급에도 다소 차이가 있을 수 있음.</div>
                            <div>1개월전, 1년전은 해당일자 기준 5일 이동평균 가격임. (이동평균은 해당일 기준 전후로 4~5일의 평균값)</div>
                            <div>평년은 5년간(금년 제외) 해당일에 대한 최고값과 최소값을 제외한 3년 평균값. (해당일 평균가격은 5일 이동평균값을 적용)</div>
                            <div>조사단위가 중량이 아닌 품목(포기, 개, 접, 마리 등)은 kg 단위 환산이 제공되지 않음.</div>
                            <div>본 가격자료는 전국 주요 시장에서 조사된 도∙소매 평균가격으로 개별 판매처 및 산지, 브랜드, 규격 등에 따라 가격이 다를 수 있으므로
    실거래에 있어서 참고 자료로만 활용하여 주시기 바랍니다.</div>
                            <div>2018.1.8일 부터 깐마늘(국산)은 대서종과 남도종 구분조사·제공합니다. (이전 깐마늘가격은 품종 혼합가격임)</div>
                            <div>2020.6.23일 부터 난지형 피마늘은 대서종과 남도종 구분조사·제공합니다. (이전 난지형 피마늘 가격은 품종 혼합가격임)</div>
                            <div>해당 자료는 KAMIS 농산물 유통정보에서 제공함을 알려드립니다</div>
                            <div><a href="https://www.kamis.or.kr">https://www.kamis.or.kr</a></div>
                        </div>
                        
                        <div id="content__search-box--table">
                            <%if(table != null){ %>
                            <table>
                                <tbody>
                                    <%=table %>
                                </tbody>
                            </table>
                            <%} %>
                        </div>
                        
                    </section>
                    
                </section>
            </div>
        </div>
    </div>
    
    </main>
    
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_marketPriceInfo.js?after'/>"></script>
    <script type="text/javascript" src="<c:url value='/resources/js/Seller/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js?after'/>" ></script>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js?after'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>