<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css?after'/>" rel="stylesheet" />
    <!-- header, css end -->
    <link href="<c:url value='/resources/css/Buyer/mypage_template.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Common/sub_main.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/Buyer/mypage_savePoint.css?after'/>" rel="stylesheet" />
    <title>적립금</title>
</head>
<body>
   <section id="sub-main" class="">
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
              <strong>적립금</strong>
           </li>
        </ul>
     </div>
     <div class="sub-tab">
        <ul>
           <li>
              <a href="BuyerMyPage.by">
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
                  <article id="myPage">
                     <h2 class="content-title">적립금</h2>
                     <div class="save_point--point">
                     	<div class="point-desc">
	                     	<dl>
	                     		<dt class="point-present">현재 적립금</dt>
	                     		<dd class="point">${user.savePoint}원</dd>
	                   		</dl>
	                   		<dl>
	                     		<dt class="point-expected">예정 적립금</dt>
	                     		<dd class="point">0원</dd>
	                   		</dl>
	                   		<dl>
	                     		<dt class="point-total text-green">총 적립금</dt>
	                     		<dd class="point text-green">${user.savePoint}원</dd>
	                     	</dl>
                     	</div>
                     	<div class="point-explain">
	                     	<p>- 적립금은 구매 확정 시 지급됩니다. (별도의 구매 확정이 없더라도 상품 발송 후 9일이 지난 경우에는 자동 구매 확정 됩니다.)</p>
	                     	<p>- 구매 후기 작성 시 적립금 지급됩니다.</p>
	                     	<p>- 이웃# 적립금은 상품 금액의 7%까지만 사용 가능합니다.</p>
                     	</div>
                     </div>
                     <div class="save_point--history">                  
                     	<div class="history--option">
						<c:choose>
						 <c:when test="${condition eq '적립'}">
                     		<a href="BuyerMyPageSavePoint.by?status=전체" id="option-total">전체</a>
                     		<a href="BuyerMyPageSavePoint.by?status=적립" id="option-save"class="active" >적립</a>
                     		<a href="BuyerMyPageSavePoint.by?status=사용" id="option-use" >사용</a>
                   		</c:when>
                   		<c:when test="${condition eq '사용'}">
                   			<a href="BuyerMyPageSavePoint.by?status=전체" id="option-total">전체</a>
                     		<a href="BuyerMyPageSavePoint.by?status=적립" id="option-save" >적립</a>
                     		<a href="BuyerMyPageSavePoint.by?status=사용" id="option-use" class="active" >사용</a>
                   		</c:when>
                   		<c:otherwise>
                   			<a href="BuyerMyPageSavePoint.by?status=전체" id="option-total" class="active">전체</a>
                     		<a href="BuyerMyPageSavePoint.by?status=적립" id="option-save" >적립</a>
                     		<a href="BuyerMyPageSavePoint.by?status=사용" id="option-use"  >사용</a>
                   		</c:otherwise>
                   		</c:choose>
                     	</div>
                     	<table id="history--table">
                     		<thead>
                     			<tr>
                     				<th scope="col" class="sp-status">상태</th>
                     				<th scope="col" class="sp_point">적립금</th>
                     				<th scope="col" class="sp_content">적립내용</th>
                     				<th scope="col" class="sp_orderNum">주문번호</th>
                     				<th scope="col" class="sp_appDate">적용일시</th>
                     			</tr>
                     		</thead>
                     		<tbody>
                     		<c:if test="${fn:length(pointList)== 0}">
                     			<tr>
                     				<td colspan="5" class="non-list">적립금 내역이 없습니다.</td>
                     			</tr>
                   			</c:if>
                     		<c:forEach var="point" items="${pointList}" varStatus="index">
                     			
                     			<c:choose>                     			
    								<c:when test="${point.status eq '적립'}">
                     			<tr>
                     				<td class="sp-status save">${point.status}</td>
                     				<td class="sp-point save">${point.point} </td>
                     				<td class="sp-content left">${point.contentTitle}<span class="enter content-detail"><a href="#a">${point.contentDetail}</a></span></td>
                     				<td class="sp-orderNum"><a href="OrderResearch.or?order_id=${point.orderId}">${point.orderId}</a></td>
                     				<td class="sp-appDate">${point.applicationDate}</td>
                     			</tr>
                     				</c:when>
                     				<c:otherwise>
                   				<tr>
                     				<td class="sp-status use">${point.status}</td>
                     				<td class="sp-point use">${point.point} </td>
                     				<td class="sp-content left">${point.contentTitle}<span class="enter content-detail">${point.contentDetail}</span></td>
                     				<td class="sp-orderNum"><a href="OrderResearch.or?order_id=${point.orderId}">${point.orderId}</a></td>
                     				<td class="sp-appDate">${point.applicationDate}</td>
                     			</tr>
                     				</c:otherwise>
                     			</c:choose>
                   			</c:forEach>
                     		</tbody>
                     	</table>
                     	
                     	<div class="n-paging">
                     		<ul>
                     			<c:if test="${pageMaker.prev}">
                     				<li><a href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(pageMaker.startPage - 1,condition)}" class="prev">이전</a></li>
                     			</c:if>
                     			
                     			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                     				<c:if test="${currentPage eq idx}">
                     				<li><a href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(idx,condition)}" class="page active">${idx}</a></li>
                     				</c:if>
                     				<c:if test="${currentPage ne idx}">
                     				<li><a href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(idx,condition)}" class="page">${idx}</a></li>
                     				</c:if>
                     			</c:forEach>
                     			
                     			<c:if test="${pageMaker.next && pageMaker.endPage> 0}">
                     				<li><a href="BuyerMyPageSavePoint.by${pageMaker.makeQuery(pageMaker.endPage + 1,condition)}" class="next">다음</a></li>
                     			</c:if>
                     		</ul>
                     	</div>
                     	
                     </div>
                     </article>    
              </section>      
            </div>
        </div>
    </div>
</main>
    <script type="text/javascript" src="<c:url value='/resources/js/Buyer/mypage_menu.js?after'/>"></script>
    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/Common/sub_main.js'/>" ></script>  
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>