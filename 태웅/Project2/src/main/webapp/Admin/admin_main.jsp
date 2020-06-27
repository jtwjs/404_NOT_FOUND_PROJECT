<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- header, css -->
    <jsp:include page="../header.jsp" flush="false"/>
    <link href="<c:url value='/resources/css/module/reset.css'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/header.css?after'/>" rel="stylesheet" />
    <link href="<c:url value='/resources/css/module/footer.css'/>" rel="stylesheet" />
    <!-- header, css end -->
    
    <link href="<c:url value='/resources/css/Admin/admin_main.css'/>" rel="stylesheet" />
    <title>관리자 페이지</title>
</head>
<body>

    <section id="admin_page">
    
    <div class="container">
        <div class="row">
            <div class="col-xs-4" id="sidebar">
                
            </div>
        
            <div class="col-xs-8" id="admin__main--content-box">
                <div id="content-box__margin">
                    
                    <div id="content-box__line-1">
                        <div id="content__order-status--graph">
                        </div>
                        
                        <div id="content__order-status--box">
                            <div class="content__table--title">
                                <span>처리 주문 상태</span>
                            </div>
                            <div id="content__order-status--table">
                                <table>
                                    <thead>
                                        <tr>
                                            <td class="status-table__td--status">상태변경</td>
                                            <td class="status-table__td--num-cases">건수</td>
                                            <td class="status-table__td--price">금액</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>주문</td>
                                            <td>0</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>입금</td>
                                            <td>0</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>준비</td>
                                            <td>0</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>배송</td>
                                            <td>0</td>
                                            <td>0</td>
                                        </tr>
                                        <tr>
                                            <td>완료</td>
                                            <td>0</td>
                                            <td>0</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    
                    
                    <div id="content-box__line-2">
                        <div id="content__order-method-payment--table">
                        
                        </div>
                    </div>
                    
                    
                    <div id="content-box__line-3">
                        
                    </div>
                    
                </div>
            </div>
            
            
        
        </div>
    </div>
    
    </section>

    <!-- footer,js -->
    <jsp:include page="../footer.jsp" flush="false"/>    
    <script type="text/javascript" src="<c:url value='/resources/js/module/footer.js'/>" ></script>
    <script type="text/javascript" src="<c:url value='/resources/js/module/header.js?after'/>" ></script>
    <!-- footer,js end -->
</body>
</html>