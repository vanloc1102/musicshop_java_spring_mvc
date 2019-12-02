<%-- 
    Document   : home
    Created on : Oct 13, 2019, 12:51:53 PM
    Author     : vanlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="include/head-css.jsp">
            <jsp:param name="title" value="Home Page"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="include/header.jsp"/>
        <!-- Hero Section-->
        <section class="hero hero-home no-padding">
            <!-- Hero Slider-->
            <div class="owl-carousel owl-theme hero-slider">
                <c:if test="${not empty bannerList}">
                    <c:forEach var="banner" items="${bannerList}" varStatus="index">
                        <div style="background: url(${pageContext.request.contextPath}/${banner.bannerDir});" class="item d-flex align-items-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6 text-white">
                                        <h1>${banner.bannerTitle}</h1>
                                        <p class="lead">${banner.bannerContent}</p>
                                        <a href="<c:url value="${banner.bannerURL}"/>" class="btn btn-template wide shop-now">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if> 
            </div>
        </section>
        <!-- Categories Section-->
        <section class="categories  gray-bg">
            <div class="container">
                <header class="text-center">
                    <h2 class="text-uppercase"><small>Top for this month</small>Our Featured Picks</h2>
                </header>
                <div class="row text-left">
                    
                    <c:if test="${not empty subbannerList}">
                        <c:forEach var="subbanner" items="${subbannerList}" varStatus="index">
                            <div class="col-lg-4" >
                                <a href="#">
                                    <div style="background-image: url(${pageContext.request.contextPath}/${subbanner.subbannerUrl});" class="item d-flex align-items-end">
                                        <div class="content">
                                            <h3 class="h5">${subbanner.subbannerTitle}</h3><span>New Collection</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>    
                    </c:if>
                    
                </div>
            </div>
        </section>
        <!-- New Collection -->
        <section class="men-collection">
            <div class="container">
                <header class="text-center">
                    <h2 class="text-uppercase"><small>Maybe you like </small>NEW PRODUCTS</h2>
                </header>
                <!-- Products Slider-->
                <div class="owl-carousel owl-theme products-slider">
                    <!-- item-->
                    <c:forEach var="top8NewestProduct" items="${top8NewestProduct}" varStatus="index">
                        <div class="item">
                            <div class="product is-gray">
                                <div class="image d-flex align-items-center justify-content-center">                                  
                                        <img src="<c:url value="${top8NewestProduct.images.size() > 0 ? top8NewestProduct.images.get(0).imageURL : ''}"/>" alt="product" class="img-fluid"/>
                                    <div class="hover-overlay d-flex align-items-center justify-content-center">
                                        <div class="CTA d-flex align-items-center justify-content-center">
                                            <a href="<c:url value="/cart/add/${top8NewestProduct.productID}"/>" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="<c:url value="/product/detail/${top8NewestProduct.productID}"/>" class="visit-product active"><i class="icon-search"></i>View</a>                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="title">
                                    <a href="<c:url value="/product/detail/${top8NewestProduct.productID}"/>">
                                        <h3 class="h6 text-uppercase no-margin-bottom">${top8NewestProduct.productName}</h3>
                                    </a>
                                    <ul class="price list-inline">                                       
                                            <li class="list-inline-item original"><span class="price text-muted">$${top8NewestProduct.productDetail.unitPrice}</span></li>
                                    </ul>                                           
                                </div>
                            </div>        
                        </div>
                    </c:forEach>               
                </div>
            </div>
        </section>
        <!-- Divider Section-->
        <section style="background: url(resources/img/divider-bg.jpg);" class="divider">
            <div class="container"> 
                <div class="row">
                    <div class="col-lg-6">
                        <p>Old Collection                  </p>
                        <h2 class="h1 text-uppercase no-margin">Huge Sales</h2>
                        <p>At our outlet stores</p><a href="#" class="btn btn-template wide shop-now">Shop Now<i class="icon-bag"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Women's Collection -->
        <section class="women-collection">
            <div class="container">
                <header class="text-center">
                    <h2 class="text-uppercase"><small>Best Seller</small>HOT PRODUCTS</h2>
                </header>
                <!-- Products Slider-->
                <div class="owl-carousel owl-theme products-slider">
                    <!-- item-->
                    <c:forEach var="top8HotProduct" items="${top8HotProduct}" varStatus="index">
                        <div class="item">
                            <div class="product is-gray">
                                <div class="image d-flex align-items-center justify-content-center">
                                        <img src="<c:url value="${top8HotProduct.images.size() > 0 ? top8HotProduct.images.get(0).imageURL : ''}"/>" alt="product" class="img-fluid"/>
                                    <div class="hover-overlay d-flex align-items-center justify-content-center">
                                        <div class="CTA d-flex align-items-center justify-content-center">
                                            <a href="cart/add/${top8HotProduct.productID}" class="add-to-cart"><i class="fa fa-shopping-cart"></i></a>
                                            <a href="<c:url value="/product/detail/${top8HotProduct.productID}"/>" class="visit-product active"><i class="icon-search"></i>View</a>                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="title">
                                    <a href="<c:url value="/product/detail/${top8HotProduct.productID}"/>">
                                        <h3 class="h6 text-uppercase no-margin-bottom">${top8HotProduct.productName}</h3>
                                    </a>
                                    <ul class="price list-inline">                
                                            <li class="list-inline-item original"><span class="price text-muted">$${top8HotProduct.productDetail.unitPrice}</span></li>
                                    </ul>                                   
                                </div>
                            </div>
                        </div>                                
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Blog Section-->
        <section class="blog gray-bg">
            <div class="container">
                <header class="text-center">
                    <h2 class="text-uppercase"><small>Made it hard way</small>Latest from the blog</h2>
                </header>
                <div class="row">
                    <!-- post-->
                    <div class="col-lg-6">
                        <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
                            <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="resources/img/blog-1.jpg" alt="..."></div>
                            <div class="info"> 
                                <h4 class="h5"> <a href="post.html">Newest photo apps          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                                <p>ellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Aenean ultricies mi vitae est. </p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /end post-->
                    <!-- post-->
                    <div class="col-lg-6">
                        <div class="post post-gray d-flex align-items-center flex-md-row flex-column">
                            <div class="thumbnail d-flex-align-items-center justify-content-center"><img src="resources/img/blog-2.jpg" alt="..."></div>
                            <div class="info"> 
                                <h4 class="h5"> <a href="post.html">Best books about Photography          </a></h4><span class="date"><i class="fa fa-clock-o"></i>May 10th 2016</span>
                                <p>Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante.  Mauris placerat eleifend leo.</p><a href="post.html" class="read-more">Read More<i class="fa fa-long-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /end post-->
                </div>
            </div>
        </section>
        <!-- Brands Section-->
        <section class="brands">
            <div class="container">
                <!-- Brands Slider-->
                <div class="owl-carousel owl-theme brands-slider">
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-1.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-2.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-3.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-4.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-5.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-6.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-1.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-2.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-3.svg" alt="..." class="img-fluid"></div>
                    </div>
                    <!-- item-->
                    <div class="item d-flex align-items-center justify-content-center">
                        <div class="brand d-flex align-items-center"><img src="resources/img/brand-4.svg" alt="..." class="img-fluid"></div>
                    </div>
                </div>
            </div>
        </section>
        <div id="scrollTop"><i class="fa fa-long-arrow-up"></i></div>
        <jsp:include page="include/footer.jsp"/>      
        <jsp:include page="include/footer-script.jsp"/>
    </body>
</html>
